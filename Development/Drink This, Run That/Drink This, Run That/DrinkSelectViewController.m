//
//  DrinkSelectViewController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 11/13/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "DrinkSelectViewController.h"

@interface DrinkSelectViewController ()

@end

@implementation DrinkSelectViewController

-(void)viewDidLoad
{
	self.parseClassName = @"Drinks";
	self.pullToRefreshEnabled = NO;
	self.paginationEnabled = YES;
	self.objectsPerPage = 20;
	[super viewDidLoad];
}

-(PFQuery *)queryForTable
{
	PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
	if(self.objects.count == 0)
	{
		query.cachePolicy = kPFCachePolicyCacheThenNetwork;
	}
	[query orderByAscending:@"title"];
	return query;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
	static NSString *cellIdentifier = @"Cell";
	
	PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell)
	{
		cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
	}
	cell.textLabel.text = object[@"title"];
	//can't figure out why this isn't working...
	cell.detailTextLabel.text = [@"Calories: " stringByAppendingString:[NSString stringWithFormat:@"%@", object[@"calories"]]];
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	PFObject *object = [self objectAtIndexPath:indexPath];
	
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
