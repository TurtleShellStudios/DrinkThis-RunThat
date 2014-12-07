//
//  RunningMapViewController.h
//  Drink This, Run That
//
//  Created by Michael Hartung on 12/5/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface RunningMapViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *runButton;
@property (weak, nonatomic) IBOutlet MKMapView *MapView;
@property (nonatomic, strong) CLLocationManager* locationManager;
- (IBAction)startStopRun:(id)sender;
- (IBAction)doneButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@end
