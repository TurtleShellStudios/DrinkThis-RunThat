//
//  CalculatedController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 11/17/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "CalculatedController.h"
#import "RunOrAddCaloriesController.h"
#import "DrinkDetailsTableController.h"

@implementation CalculatedController

-(void)viewDidLoad
{
	RunOrAddCaloriesController *controller = [[self viewControllers] objectAtIndex:0];
	DrinkDetailsTableController *detailsController = [[self viewControllers] objectAtIndex:1];
	controller.drinks = self.drinks;
	detailsController.drinks = self.drinks;
}

@end
