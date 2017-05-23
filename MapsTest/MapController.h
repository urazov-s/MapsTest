//
//  MapController.h
//  MapsTest
//
//  Created by Sergey Urazov on 23/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Map.h"

@class MapController;

@protocol MapControllerDelegate <NSObject>

- (void)map:(MapController *)map locationSelected:(CLLocation *)location;

@end

@interface MapController : NSObject

@property (weak, nonatomic) IBOutlet id<Map> map;
@property (copy, nonatomic) NSSet<CLLocation *> *locations;

@property (weak, nonatomic) IBOutlet id<MapControllerDelegate> delegate;

@end
