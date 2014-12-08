//
//  RunningMapViewController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 12/5/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "RunningMapViewController.h"
#import "FinishedRunViewController.h"

@interface RunningMapViewController ()
@property (nonatomic) BOOL shouldRecordDistance;
@property (nonatomic) double distanceTraveled;
@property (nonatomic, strong) CLLocation* oldLocation;
@end

@implementation RunningMapViewController

-(void)viewDidLoad
{
	[super viewDidLoad];
	self.locationManager = [[CLLocationManager alloc] init];
	[self.locationManager requestAlwaysAuthorization];
	self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	self.locationManager.distanceFilter = kCLDistanceFilterNone;
	self.locationManager.delegate = self;
	self.shouldRecordDistance = NO;
	self.MapView.showsUserLocation = YES;
	self.distanceTraveled = 0.0;
	self.doneButton.enabled = NO;
	[self.locationManager startUpdatingLocation];
}

#pragma mark Custom IBAction Methods

- (IBAction)startStopRun:(id)sender
{
	self.doneButton.enabled = YES;
	if(!self.shouldRecordDistance)
	{
		[self.locationManager startUpdatingLocation];
		[self.runButton setTitle:@"Stop Running" forState:UIControlStateNormal];
		self.shouldRecordDistance = YES;
		
	}
	else
	{
		[self.locationManager stopUpdatingLocation];
		[self.runButton setTitle:@"Start Running" forState:UIControlStateNormal];
		self.shouldRecordDistance = NO;
	}
}

- (IBAction)doneButton:(id)sender
{
	[self.locationManager stopUpdatingLocation];
	[self performSegueWithIdentifier:@"doneRunningSegue" sender:self];
}

#pragma mark CLLocation Delegate Methods

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
	CLLocation* location = [locations lastObject];
	if(!self.shouldRecordDistance)
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

#pragma mark Segue method
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	FinishedRunViewController* controller = [segue destinationViewController];
	controller.metersRan = self.distanceTraveled;
}

@end
