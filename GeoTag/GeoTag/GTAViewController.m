//
//  GTAViewController.m
//  GeoTag
//
//  Created by Austin Nolan on 5/23/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "GTAViewController.h"

#import "GTATableViewController.h"

#import <CoreLocation/CoreLocation.h>

@interface GTAViewController ()

@end

@implementation GTAViewController
{
    
    CLLocationManager * lManager;
    
    UIButton * signInButton;
    
    GTATableViewController * gtaTVC;
    
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        signInButton = [[UIButton alloc]initWithFrame:CGRectMake(85, 150, 150, 150)];
        [signInButton addTarget:self action:@selector(pushToTVC) forControlEvents:UIControlEventTouchUpInside];
        [signInButton setTitle:@"GO" forState:UIControlStateNormal];
        signInButton.layer.cornerRadius = 75;
        
        signInButton.backgroundColor = [UIColor blueColor];
        
        [self.view addSubview:signInButton];
        
        
        
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pushToTVC
{
    NSLog(@"Start");
    
    
    
    gtaTVC = [[GTATableViewController alloc] initWithStyle:UITableViewStylePlain];
        
    [self.navigationController pushViewController:gtaTVC animated:YES];

    self.navigationController.toolbarHidden = YES;


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
