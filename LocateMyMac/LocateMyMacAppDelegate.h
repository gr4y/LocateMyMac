//
//  LocateMyMacAppDelegate.h
//  LocateMyMac
//
//  Created by Sascha Wessel on 20.07.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreLocation/CoreLocation.h>

@interface LocateMyMacAppDelegate : NSObject <NSApplicationDelegate, CLLocationManagerDelegate> {
    NSWindow *window;
    CLLocationManager *locationManager;
    IBOutlet NSTextField *latitudeField;
    IBOutlet NSTextField *longitudeField;
    IBOutlet NSTextField *coordinateField;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) IBOutlet NSTextField *latitudeField;
@property (nonatomic, retain) IBOutlet NSTextField *longitudeField;
@property (nonatomic, retain) IBOutlet NSTextField *coordinateField;

- (IBAction)locateMe:(id)sender;

@end
