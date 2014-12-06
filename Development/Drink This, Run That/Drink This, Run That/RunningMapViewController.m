//
//  RunningMapViewController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 12/5/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "RunningMapViewController.h"

@interface RunningMapViewController ()
@property (nonatomic) BOOL locationManagerIsUpdating;
@property (nonatomic) double distanceTraveled;
@property (nonatomic, strong) CLLocation* oldLocation;
@end

@implementation RunningMapViewController

-(void)viewDidLoad
{
	[super viewDidLoad];
	self.locationManager = [[CLLocationManager alloc] init];
	[self.locationManager requestWhenInUseAuthorization];
	self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	self.locationManager.distanceFilter = 5.0f;
	self.locationManager.delegate = self;
	self.locationManager.headingFilter = 5.0;
	self.locationManagerIsUpdating = NO;
	self.MapView.showsUserLocation = YES;
	self.distanceTraveled = 0.0;
}

#pragma mark Custom IBAction Methods

- (IBAction)startStopRun:(id)sender
{
	if(!self.locationManagerIsUpdating)
	{
		[self.locationManager startUpdatingLocation];
		[self.locationManager startUpdatingHeading];
		[self.runButton setTitle:@"Stop Running" forState:UIControlStateNormal];
		self.locationManagerIsUpdating = YES;
		
	}
	else
	{
		[self.locationManager stopUpdatingHeading];
		[self.locationManager stopUpdatingLocation];
		[self.runButton setTitle:@"Start Running" forState:UIControlStateNormal];
		self.locationManagerIsUpdating = NO;
	}
}

- (IBAction)doneButton:(id)sender
{
	
}

#pragma mark CLLocation Delegate Methods

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
	CLLocation* location = [locations lastObject];
	if(!self.oldLocation)
	{
		self.oldLocation = location;
		printf("New Distance Traveled = %f\n",self.distanceTraveled);
	}
	else
	{
		self.distanceTraveled += [location distanceFromLocation:self.oldLocation];
		self.oldLocation = location;
		printf("New Distance Traveled = %f\n",self.distanceTraveled);
	}
	MKCoordinateRegion region;
	region.center = location.coordinate;
	MKCoordinateSpan span;
	span.latitudeDelta=0.005;
	span.longitudeDelta=0.005;
	region.span=span;
	[self.MapView setRegion:region animated:TRUE];
	[self.MapView regionThatFits:region];
}

-(void) locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager
{
	
}

-(void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager
{
	
}

@end
