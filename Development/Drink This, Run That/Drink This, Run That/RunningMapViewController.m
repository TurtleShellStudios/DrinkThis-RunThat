//
//  RunningMapViewController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 12/5/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "RunningMapViewController.h"

@implementation RunningMapViewController

-(void)viewDidLoad
{
	[super viewDidLoad];
	[self.locationManager requestAlwaysAuthorization];
	self.locationManager = [[CLLocationManager alloc] init];
	self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	self.locationManager.distanceFilter = 5.0f;
	self.locationManager.delegate = self;
	self.locationManager.headingFilter = 5.0;
}

- (IBAction)startStopRun:(id)sender
{
	
}

- (IBAction)doneButton:(id)sender
{
	
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
	
}

-(void) locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager
{
	
}

-(void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager
{
	
}

@end
