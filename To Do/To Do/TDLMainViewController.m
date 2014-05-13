//
//  TDLMainViewController.m
//  To Do
//
//  Created by Austin Nolan on 5/6/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TDLMainViewController.h"

#import "TDLTableViewController.h"

@interface TDLMainViewController ()

@end

@implementation TDLMainViewController
{
    
    
    
    UITextView * textField;

    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];


    UIBarButtonItem * addNewUser = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newUser)];
    
    self.navigationItem.rightBarButtonItem = addNewUser;
    
    textField = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 170, 44)];
    self.navigationItem.titleView = textField;




}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
