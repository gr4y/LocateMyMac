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
    NSString *longitudeString = [NSString stringWithFormat:@"%f", coordinate.longitude];
    NSString *latitudeString = [NSString stringWithFormat:@"%f", coordinate.latitude];
    [longitudeField setStringValue:longitudeString];
    [latitudeField setStringValue:latitudeString];    
    [coordinateField setStringValue:[NSString stringWithFormat:@"%@,%@", latitudeString, longitudeString]];
    [coordinateField setHidden:NO];
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
