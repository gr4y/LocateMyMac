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
    NSString *coordinateString = [NSString stringWithFormat:@"%@,%@", latitudeString, longitudeString];
    
    [longitudeField setStringValue:longitudeString];
    [latitudeField setStringValue:latitudeString];    
    [coordinateField setStringValue:coordinateString];
    [coordinateField setHidden:NO];
    [locationManager stopUpdatingLocation];
    
    [latitudeString release];
    [longitudeString release];
    [coordinateString release];
}

- (void)locationManager:(CLLocationManager *)manager 
       didFailWithError:(NSError *)error 
{
    NSAlert *alert = [NSAlert alertWithMessageText:@"CoreLocation Error"
                                     defaultButton:@"OK" alternateButton: nil otherButton:nil
                        informativeTextWithFormat:[error description]];
    [alert beginSheetModalForWindow:window modalDelegate:self didEndSelector:nil contextInfo:nil];
}

- (IBAction)locateMe:(id)sender {
    [latitudeField setStringValue:@""];
    [longitudeField setStringValue:@""];
    [locationManager startUpdatingLocation];
}

- (void)dealloc {
    [locationManager setDelegate:nil];
    [locationManager release];
    [super dealloc];
}

@end
