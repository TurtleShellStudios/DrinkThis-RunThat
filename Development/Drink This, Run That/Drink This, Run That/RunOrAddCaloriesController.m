//
//  RunOrAddCaloriesController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 11/17/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "RunOrAddCaloriesController.h"
#import "MainTableViewController.h"

@interface RunOrAddCaloriesController()
@property (strong,nonatomic) NSNumber *calories;
@end

@implementation RunOrAddCaloriesController

-(void)viewDidLoad
{
	self.calories = @0;
	for(PFObject *drink in self.drinks)
	{
		self.calories = [NSNumber numberWithInt:[self.calories integerValue] + [drink[@"calories"] integerValue]];
	}
	self.caloriesLabel.text = [NSString stringWithFormat:@"Calories Consumed: %@", self.calories];
	self.milesToAddLabel.text = [NSString stringWithFormat:@"Miles to Add: %@", [NSNumber numberWithDouble:[self.calories doubleValue] / 100]];
}

- (IBAction)runButtonPressed:(id)sender
{
}

- (IBAction)addCaloriesPressed:(id)sender
{
	self.user = [PFUser currentUser];
	self.user[@"caloriesRemaining"] = [NSNumber numberWithInt:[self.user[@"caloriesRemaining"] integerValue] + [self.calories integerValue]];
	NSArray *viewControllers = [[self navigationController] viewControllers];
	for(id viewController in viewControllers)
	{
		if([viewController isKindOfClass:[MainTableViewController class]])
		{
			[self.user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
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
