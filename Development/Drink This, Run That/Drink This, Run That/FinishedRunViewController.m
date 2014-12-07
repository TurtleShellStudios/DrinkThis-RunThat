//
//  FinishedRunViewController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 12/6/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "FinishedRunViewController.h"


@interface FinishedRunViewController()
@property (nonatomic) double milesRan;
@property (nonatomic) double caloriesBurned;
@end

@implementation FinishedRunViewController

-(void)viewDidLoad
{
	[super viewDidLoad];
	self.milesRan = self.metersRan * 0.000621371;
	self.milesRanLabel.text = [@"Miles Ran: " stringByAppendingString:[NSString stringWithFormat:@"%f", self.milesRan]];
	self.caloriesBurned = self.milesRan * 100;
	self.caloriesBurnedLabel.text = [@"Calories Burned: " stringByAppendingString:[NSString stringWithFormat:@"%f", self.caloriesBurned]];
}

- (IBAction)addMilesRan:(id)sender
{
	self.user = [PFUser currentUser];
	self.user[@"caloriesRemaining"] = [NSNumber numberWithDouble:[self.user[@"caloriesRemaining"] doubleValue] - self.caloriesBurned];
	[self.user saveInBackground];
	NSArray *viewControllers = [self.navigationController viewControllers];
	for(id viewController in viewControllers)
	{
		if([viewController isKindOfClass:[MainTableViewController class]])
		{
			[self.user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
			 {
				 if(error)
				 {
					 [[[UIAlertView alloc] initWithTitle:@"Something went wrong!" message:@"Something went wrong when trying to add these calories, please try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
				 }
				 if(succeeded)
				 {
					 [self.navigationController popToViewController:viewController animated:YES];
				 }
			 }];
		}
	}
}
@end
