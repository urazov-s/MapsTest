//
//  MapController.m
//  MapsTest
//
//  Created by Sergey Urazov on 23/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

#import "MapController.h"
#import <MapKit/MapKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface MapController ()<MKMapViewDelegate, GMSMapViewDelegate>

@end

@implementation MapController

- (void)setMap:(id<Map>)map {
    _map = map;
    
    [map setup];
}

- (void)setLocations:(NSSet<CLLocation *> *)locations {
    _locations = [locations copy];
    
    [self.map setLocations:locations];
}

// MARK:- MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    [mapView deselectAnnotation:view.annotation animated:YES];
    CLLocationCoordinate2D coord = view.annotation.coordinate;
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:coord.latitude longitude:coord.longitude];
    [self.delegate map:self locationSelected:loc];
}

// MARK:- GMSMapViewDelegate

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker {
    CLLocationCoordinate2D coord = marker.position;
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:coord.latitude longitude:coord.longitude];
    [self.delegate map:self locationSelected:loc];
    return YES;
}

@end
