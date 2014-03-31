//
//  ANFViewController.h
//  W1D1
//
//  Created by Austin Nolan on 3/31/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANFViewController : UIViewController

- (IBAction)myButton1:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *myLabel1;

- (IBAction)myButton2:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *myLabel2;


@property (weak, nonatomic) IBOutlet UITextField *typeHere;



- (IBAction)myButton3:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *myLabel3;


@property (weak, nonatomic) IBOutlet UIColor *colorLabel;



@end
