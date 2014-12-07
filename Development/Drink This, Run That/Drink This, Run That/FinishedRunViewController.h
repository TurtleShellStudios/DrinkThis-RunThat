//
//  FinishedRunViewController.h
//  Drink This, Run That
//
//  Created by Michael Hartung on 12/6/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MainTableViewController.h"

@interface FinishedRunViewController : UIViewController
@property (strong, nonatomic) PFUser* user;
@property (weak, nonatomic) IBOutlet UILabel *milesRanLabel;
@property (weak, nonatomic) IBOutlet UILabel *caloriesBurnedLabel;
@property (nonatomic) double metersRan;
- (IBAction)addMilesRan:(id)sender;
@end
