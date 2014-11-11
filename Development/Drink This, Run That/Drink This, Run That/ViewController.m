//
//  ViewController.m
//  Drink This, Run That
//
//  Created by Michael Hartung on 11/3/14.
//  Copyright (c) 2014 hartung-michael. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
	testObject[@"foo"] = @"bar";
	[testObject saveInBackground];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
