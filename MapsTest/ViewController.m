//
//  ViewController.m
//  MapsTest
//
//  Created by Sergey Urazov on 22/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

#import "ViewController.h"
#import "Map.h"
#import "LocationService.h"
#import "MapController.h"

@interface ViewController () <MapControllerDelegate>

@property (strong, nonatomic) IBOutlet MapController *map;

@property (strong, nonatomic) LocationService *service;

@end

@implementation ViewController

// MARK:- Init

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _service = [LocationService new];
}

// MARK:- Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.service startTrackingLocation];
    
    __weak typeof(self) weakSelf = self;
    [self.service acquireLocationsWithCompletion:^(NSSet<CLLocation *> *locations, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) sself = weakSelf;
            if (!sself) { return; }
            sself.map.locations = locations;
        });
    }];
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
    self.title = parent.tabBarItem.title;
}

// MARK:- Map Delegate

- (void)map:(MapController *)map locationSelected:(CLLocation *)location {
    CLLocation *curLocation = self.service.currentLocation;
    CLLocationDistance distance = [location distanceFromLocation:curLocation];
    
    UIAlertController *alert = [UIAlertController new];
    alert.title = @"Distance";
    if (curLocation) {
        alert.message = [NSString stringWithFormat:@"Selected point is %.0fm away", distance];
    } else {
        alert.message = @"Information unavailable";
    }
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
