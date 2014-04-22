//
//  SLFSelfyViewController.m
//  Selfy
//
//  Created by Austin Nolan on 4/22/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "SLFSelfyViewController.h"

@interface SLFSelfyViewController ()

{
    UITextField * captionField;
    
    UIButton * submitSelfy;
    
}



@end

@implementation SLFSelfyViewController

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
    
    
    captionField = [[UITextField alloc] initWithFrame:CGRectMake(20, 50, 100, 20)];
    captionField.backgroundColor = [UIColor colorWithWhite:0.1 alpha:.05];
    captionField.placeholder = @"Caption";
    captionField.tintColor = [UIColor lightGrayColor];
    [self.view addSubview:captionField];
    
    
    submitSelfy = [[UIButton alloc] initWithFrame:CGRectMake(20, 80, 100, 20)];
    submitSelfy.backgroundColor = [UIColor colorWithWhite:0.5 alpha:.05];
    [submitSelfy setTitle:@"Let Me Take a Selfy" forState:UIControlStateNormal];
    submitSelfy.tintColor = [UIColor lightGrayColor];
    [submitSelfy addTarget:self action:@selector(submitYourSelfy) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitSelfy];
    

    
    // Do any additional setup after loading the view.
}



-(void)submitYourSelfy
{
    
    
    NSDictionary * newSelfy = [[NSDictionary alloc] init];
    
    newSelfy[@"caption"] = captionField.text;
    
    
    
    
    
    [self.delegate addNewSelfy:newSelfy];
    
    
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
