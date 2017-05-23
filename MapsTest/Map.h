//
//  Map.h
//  MapsTest
//
//  Created by Sergey Urazov on 22/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Map.h"

@protocol Map <NSObject>

- (void)setup;
- (void)setLocations:(nullable NSSet<CLLocation *> *)locations;


@end
