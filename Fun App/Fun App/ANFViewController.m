//
//  ANFViewController.m
//  Fun App
//
//  Created by Austin Nolan on 3/31/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "ANFViewController.h"

@interface ANFViewController ()
- (IBAction)buttonPressed:(id)sender;

@end

@implementation ANFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    
    self.myLabel.text = @"Austin Nolan";

}
- (IBAction)buttonPush:(id)sender {
}
@end
