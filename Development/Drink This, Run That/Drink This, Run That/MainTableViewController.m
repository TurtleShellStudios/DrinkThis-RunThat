//
//  MainTableViewController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 11/17/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "MainTableViewController.h"

@implementation MainTableViewController

-(void)viewWillAppear:(BOOL)animated
{
	PFUser *user = [PFUser currentUser];
	self.caloriesLabel.text = [NSString stringWithFormat:@"Calories Remaining: %.2f", [user[@"caloriesRemaining"] doubleValue]];
	self.milesLabel.text = [NSString stringWithFormat:@"Miles to Run: %.2f" , [user[@"caloriesRemaining"] doubleValue] / 100];
}
@end
