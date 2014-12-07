//
//  RunOrAddCaloriesController.h
//  Drink This, Run That
//
//  Created by Michael Hartung on 11/17/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface RunOrAddCaloriesController : UIViewController
@property (strong,nonatomic) NSMutableArray *drinks;
@property (strong,nonatomic) PFUser *user;
@property (weak, nonatomic) IBOutlet UILabel *caloriesLabel;
@property (weak, nonatomic) IBOutlet UILabel *milesToAddLabel;
- (IBAction)addCaloriesPressed:(id)sender;
@end
