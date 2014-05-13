//
//  RVBFirstViewController.m
//  RedVsBlue
//
//  Created by Austin Nolan on 5/7/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "RVBFirstViewController.h"

#import "RVBSecondViewController.h"

#import "RVBThirdViewController.h"

#import "RVBGameData.h"

@interface RVBFirstViewController () <RVBFirstViewControllerDelegate>

@end

@implementation RVBFirstViewController
{
    
    RVBSecondViewController * secondVC;
    
    RVBThirdViewController * thirdVC;
    
   
    
    UILabel * blueScoreDisplay;
    
    UILabel * redScoreDisplay;
    
    
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        secondVC = [[RVBSecondViewController alloc]initWithNibName:nil bundle:nil];
        
        [self.view addSubview:secondVC.view];
        
        
        thirdVC = [[RVBThirdViewController alloc]initWithNibName:nil bundle:nil];
        [self.view addSubview:thirdVC.view];
    
        
        blueScoreDisplay = [[UILabel alloc]initWithFrame:CGRectMake(110, 55, 100, 100)];
        blueScoreDisplay.backgroundColor = [UIColor clearColor];
        
//        [UIView animateWithDuration:0.8 animations:^{blueScoreDisplay.alpha = 0.0;}
//                         completion:^(BOOL finished) {[blueScoreDisplay removeFromSuperview];
//                         }];
        
        //blueScoreDisplay.text = [RVBGameData gameData].blueScore;
        [self.view addSubview:blueScoreDisplay];

        
        
        redScoreDisplay = [[UILabel alloc] initWithFrame:CGRectMake(110, 295, 100, 100)];
        redScoreDisplay.backgroundColor = [UIColor clearColor];
//        
//        [UIView animateWithDuration:0.8 animations:^{redScoreDisplay.alpha = 0.0;}
//                         completion:^(BOOL finished) {[redScoreDisplay removeFromSuperview];
//                         }];
        
        redScoreDisplay.text = [@([RVBGameData gameData].redScore) stringValue];

        [self.view addSubview:redScoreDisplay];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    
    
    
    
   
    
    
    // redScoreDisplay.text = [RVBGameData gameData].redScore;

    
    
    

    // Do any additional setup after loading the view.
}


-(void)displayBlueTeamScore
{
    [UIView animateWithDuration:0.8 animations:^{blueScoreDisplay.alpha = 0.0;}
                     completion:^(BOOL finished) {[blueScoreDisplay removeFromSuperview];
                     }];
    
}





-(void)displayRedTeamScore
{
    [UIView animateWithDuration:0.8 animations:^{redScoreDisplay.alpha = 0.0;}
                     completion:^(BOOL finished) {[redScoreDisplay removeFromSuperview];
                     }];
    
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
