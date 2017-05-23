//
//  LocationService.m
//  MapsTest
//
//  Created by Sergey Urazov on 22/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

#import "LocationService.h"

@interface LocationService ()<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *manager;

@end

@implementation LocationService

// MARK:- Init

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [CLLocationManager new];
        _manager.delegate = self;
        _manager.distanceFilter = kCLDistanceFilterNone;
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
        [_manager requestWhenInUseAuthorization];
    }
    return self;
}

// MARK:- Provide Data

- (void)acquireLocationsWithCompletion:(void (^)(NSSet<CLLocation *> *, NSError *))completion {
    static CLLocationDegrees minLat = -90.0;
    static CLLocationDegrees maxLat = 90.0;
    
    static CLLocationDegrees minLong = -180.0;
    static CLLocationDegrees maxLong = 180.0;
    
    NSMutableSet<CLLocation *> *locations = [NSMutableSet new];
    
    for (int i = 0; i < 5; i++) {
        CLLocationDegrees latitude = arc4random_uniform(maxLat - minLat) + minLat;
        CLLocationDegrees longitude = arc4random_uniform(maxLong - minLong) + minLong;
        CLLocation *location = [[CLLocation alloc] initWithLatitude: latitude
                                                          longitude: longitude];
        [locations addObject:location];
    }
    
    completion(locations, nil);
}

// MARK:- Tracking

- (void)startTrackingLocation {
    [self.manager startUpdatingLocation];
}

- (void)stopTrackingLocation {
    [self.manager stopUpdatingLocation];
}

- (CLLocation *)currentLocation {
    return _manager.location;
}

@end
