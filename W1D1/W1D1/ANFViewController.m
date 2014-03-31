//
//  ANFViewController.m
//  W1D1
//
//  Created by Austin Nolan on 3/31/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "ANFViewController.h"

@interface ANFViewController ()

@end

@implementation ANFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)myButton1:(id)sender {
    self.myLabel1.text = @"This is B1!!";
    
    
}


- (IBAction)myButton2:(id)sender {
    self.myLabel2.text = self.typeHere.text;

}


- (IBAction)myButton3:(id)sender {
    self.myLabel3.textColor = [UIColor
                               greenColor];


}



@end
