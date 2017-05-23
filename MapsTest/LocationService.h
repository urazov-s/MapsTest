//
//  LocationService.h
//  MapsTest
//
//  Created by Sergey Urazov on 22/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationService : NSObject

@property (readonly, nonatomic, nullable) CLLocation *currentLocation;

- (void)acquireLocationsWithCompletion:(void (^_Nonnull)(NSSet<CLLocation *> * _Nullable locations, NSError * _Nullable error))completion;

- (void)startTrackingLocation;
- (void)stopTrackingLocation;

@end
