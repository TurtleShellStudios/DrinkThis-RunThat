//
//  UserLoginViewController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 11/14/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "UserLoginViewController.h"

@interface UserLoginViewController ()

@end

@implementation UserLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [[event allTouches] anyObject];
	
	if (![[touch view] isKindOfClass:[UITextField class]]) {
		[self.view endEditing:YES];
	}
	[super touchesBegan:touches withEvent:event];
}

- (IBAction)loginPressed:(id)sender
{
	[PFUser logInWithUsernameInBackground:self.usernameField.text password:self.passwordField.text block: ^(PFUser *user, NSError *error)
	 {
		 if(user)
		 {
			 [self performSegueWithIdentifier:@"loginSegue" sender:self];
		 }
		 else
		 {
			 [[[UIAlertView alloc] initWithTitle:@"Invalid Login" message:@"Login Failed: Please try again."
								  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
		 }
	 }];
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
