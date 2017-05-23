//
//  MKMapView+Map.m
//  MapsTest
//
//  Created by Sergey Urazov on 23/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

#import "MKMapView+Map.h"

@implementation MKMapView (Map)

- (void)setup {
    self.showsUserLocation = YES;
}

- (void)setLocations:(NSSet<CLLocation *> *)locations {
    [self removeAnnotations:self.annotations];
    for (CLLocation *location in locations) {
        MKPointAnnotation *point = [MKPointAnnotation new];
        point.coordinate = location.coordinate;
        [self addAnnotation:point];
    }
}

@end
