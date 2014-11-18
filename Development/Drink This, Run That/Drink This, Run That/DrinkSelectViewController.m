//
//  DrinkSelectViewController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 11/13/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "DrinkSelectViewController.h"
#import "RunOrAddCaloriesController.h"

@interface DrinkSelectViewController ()
@property (strong, nonatomic) NSMutableArray *drinks;
@end

@implementation DrinkSelectViewController

-(void)viewDidLoad
{
	self.parseClassName = @"Drinks";
	self.pullToRefreshEnabled = NO;
	self.paginationEnabled = YES;
	self.objectsPerPage = 20;
	self.drinks = [[NSMutableArray alloc] init];
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
	PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
	PFObject *object = [self objectAtIndexPath:indexPath];
	[self.drinks addObject:object];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateMiles:(id)sender
{
	[self performSegueWithIdentifier:@"calcSegue" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	RunOrAddCaloriesController *controller = [segue destinationViewController];
	controller.drinks = self.drinks;
}

@end
