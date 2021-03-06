//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by Austin Nolan on 4/17/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "BBAViewController.h"

#import "BBALevelController.h"

@interface BBAViewController () <BBALevelDelegate>

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
        
        self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];

        
        //[self.view addSubview:level.view];
        
        startButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 3), (SCREEN_HEIGHT / 4), (SCREEN_WIDTH / 3), (SCREEN_WIDTH / 3))];
        startButton.backgroundColor = [UIColor blackColor];
        //startButton.tintColor =
        startButton.layer.cornerRadius = (SCREEN_WIDTH / 6);
        [startButton setTitle:@"Start" forState:UIControlStateNormal];
        [startButton addTarget:self action:@selector(pressStartButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:startButton];
//    
//        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 1, SCREEN_WIDTH, 20)];
//        header.backgroundColor = [UIColor greenColor];
//        [self.view  addSubview:header];
        
        
        

    }
    return self;
}





- (void)viewDidLoad
{
    [super viewDidLoad];
}


-(void)pressStartButton
{
    level = [[BBALevelController alloc]initWithNibName:nil bundle:nil];
    
    level.delegate = self;
    
    level.view.frame = CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:level.view];
    
    
    
    
    [startButton removeFromSuperview];
    [level resetLevel];
    
    
}


-(void)gameDone
{
    [level.view removeFromSuperview];
    [self.view addSubview:startButton];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//[userDefaults setObject:@(topscore) forKey:@"topScore"];
//[userDefaults synchronize];
//
//
//NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
//topScore = [[userDefaults objectForKey:@"topScore"]intValue];

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
