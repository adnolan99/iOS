//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by Austin Nolan on 4/17/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "BBAViewController.h"

#import "BBALevelController.h"

@interface BBAViewController ()

@end

@implementation BBAViewController

{
    BBALevelController * level;
    

    
    UIButton * startButton;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
        
        [self.view addSubview:level.view];
        
        
        
        
        startButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 3), (SCREEN_HEIGHT / 4), (SCREEN_WIDTH / 3), (SCREEN_WIDTH / 3))];
        startButton.backgroundColor = [UIColor whiteColor];
        startButton.tintColor =        startButton.layer.cornerRadius = (SCREEN_WIDTH / 6);
        [startButton setTitle:@"Start" forState:UIControlStateNormal];
        [startButton addTarget:self action:@selector(pressStartButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:startButton];
        
        

        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.view addSubview:<#(UIView *)#>]
    
    
}


-(void)pressStartButton
{
    [startButton removeFromSuperview];
    [level resetLevel];
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
