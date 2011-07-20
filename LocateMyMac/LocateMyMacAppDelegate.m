//
//  LocateMyMacAppDelegate.m
//  LocateMyMac
//
//  Created by Sascha Wessel on 20.07.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LocateMyMacAppDelegate.h"

@implementation LocateMyMacAppDelegate

@synthesize window, locationManager, latitudeField, longitudeField, coordinateField;

- (id)init {
    [super init];
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDesiredAccuracy:kCLDistanceFilterNone];
    [locationManager setDelegate:self];
    return self;
}

- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D coordinate = [newLocation coordinate];
    [longitudeField setStringValue:[NSString stringWithFormat:@"%f", coordinate.longitude]];
    [latitudeField setStringValue:[NSString stringWithFormat:@"%f", coordinate.latitude]];
    [coordinateField setStringValue:[NSString stringWithFormat:@"%f,%f", coordinate.latitude, coordinate.longitude]];
    [locationManager stopUpdatingLocation];
}

- (IBAction)locateMe:(id)sender {
    [locationManager startUpdatingLocation];
}

- (void)dealloc {
    [locationManager release];
    [super dealloc];
}

@end
