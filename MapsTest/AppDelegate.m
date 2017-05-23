//
//  AppDelegate.m
//  MapsTest
//
//  Created by Sergey Urazov on 22/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

#import "AppDelegate.h"
#import <GoogleMaps/GoogleMaps.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GMSServices provideAPIKey:@"AIzaSyB2KLVZoPaE6mBS0Cb4UG3VRkHiINHp8QA"];
    return YES;
}


@end
