//
//  DrinkDetailsTableController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 11/20/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "DrinkDetailsTableController.h"

@implementation DrinkDetailsTableController

-(void)viewDidLoad
{
	[super viewDidLoad];
	self.navigationController.navigationBar.translucent = NO;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	cell.textLabel.text = self.drinks[indexPath.row][@"title"];
	cell.detailTextLabel.text = [@"Calories: " stringByAppendingString:[self.drinks[indexPath.row][@"calories"] stringValue]];
	return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.drinks.count;
}

@end
