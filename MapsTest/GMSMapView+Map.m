//
//  GMSMapView+Map.m
//  MapsTest
//
//  Created by Sergey Urazov on 23/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

#import "GMSMapView+Map.h"
#import <CoreLocation/CoreLocation.h>

@implementation GMSMapView (Map)

- (void)setup {
    self.myLocationEnabled = YES;
}
    
- (void)setLocations:(NSSet<CLLocation *> *)locations {
    [self clear];
    for (CLLocation *location in locations) {
        GMSMarker *marker = [GMSMarker new];
        marker.position = location.coordinate;
        marker.map = self;
    }
    self.myLocationEnabled = true;
}
    
@end
