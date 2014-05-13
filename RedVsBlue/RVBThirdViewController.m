//
//  RVBThirdViewController.m
//  RedVsBlue
//
//  Created by Austin Nolan on 5/7/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "RVBThirdViewController.h"

#import "RVBGameData.h"

@interface RVBThirdViewController ()

@end

@implementation RVBThirdViewController

{
    
    
    int points;
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScreen:)];
        
        self.view.frame = CGRectMake(0, 241, 320, 240);
        self.view.backgroundColor = [UIColor blueColor];
        
        [self.view addGestureRecognizer:tap];
        
        
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



-(void)tapScreen:(UITapGestureRecognizer *)scoreForBlue
{
   
//    NSLog(@"Tap Blue");
//    
//    points += 0;
//    
//    NSLog(@"Blue Points %d", points++);
    
    
    
    
    NSLog(@"Tap Blue");
    
    [RVBGameData gameData].redScore +=1;
    
    NSLog(@"Red Points %d", [RVBGameData gameData].redScore);
    
    NSLog(@"Total Score : %d", [RVBGameData gameData].totalScore);

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
