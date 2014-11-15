//
//  SignUpUserViewController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 11/14/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "SignUpUserViewController.h"

@interface SignUpUserViewController ()

@end

@implementation SignUpUserViewController

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

- (IBAction)signupPressed:(id)sender
{
	if([self.passwordField.text isEqualToString:self.confirmPasswordField.text])
	{
		PFUser *user = [PFUser user];
		user.username = self.usernameField.text;
		user.password = self.passwordField.text;
		user.email = self.emailField.text;
		user[@"caloriesRemaining"] = @0;
		[user signUpInBackgroundWithBlock:^(BOOL suceeded, NSError *error){
			if(!error)
			{
				NSString *signupTitle = [@"You're all signed up, " stringByAppendingString:self.usernameField.text];
				[[[UIAlertView alloc] initWithTitle:signupTitle message:@"Congratulations, you are all signed up!"
										   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
				[self.navigationController popViewControllerAnimated:YES];
			}
			else
			{
				NSString *errorString = [error userInfo][@"error"];
				[[[UIAlertView alloc] initWithTitle:@"Sign Up Error" message:errorString
										   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
			}
		}];
	}
	else
	{
		[[[UIAlertView alloc] initWithTitle:@"Passwords don't match!" message:@"Your Passwords didn't match, please confirm they match"
							  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
	}
}

@end