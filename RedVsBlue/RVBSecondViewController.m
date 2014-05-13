//
//  RVBSecondViewController.m
//  RedVsBlue
//
//  Created by Austin Nolan on 5/7/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "RVBSecondViewController.h"

#import "RVBGameData.h"

@interface RVBSecondViewController () <UIGestureRecognizerDelegate>

{
    
    int points;
    
    
}



@end

@implementation RVBSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScreen:)];
        
        self.view.frame = CGRectMake(0, 0, 320, 240);
        self.view.backgroundColor = [UIColor redColor];
        
        [self.view addGestureRecognizer:tap];
        
        

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
    
    NSLog(@"Tap Red");
    
    //points += 0;
    
    //NSLog(@"Blue Points %d", points++);
    
    [RVBGameData gameData].blueScore +=1;
    
    NSLog(@"Blue Points %d", [RVBGameData gameData].blueScore);


    
    NSLog(@"Total Score : %d", [RVBGameData gameData].totalScore);


    
    
//    NSInteger blueScore = [RVBGameData gameData].blueScore;  //getter
//    
//    
//    [RVBGameData gameData].blueScore = blueScore + points;  //setter

    
    
    
//    NSInteger blueScore = [RVBGameData gameData].blueScore;  //getter
//
//    
//    [RVBGameData gameData].blueScore = blueScore + points;  //setter
//    
//    
    
    

}





//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//    //UITouch * tap = [touches allObjects];
//    
//    
//    
//    
//    NSInteger blueScore = [RVBGameData gameData].blueScore;  //getter
//    
//    
//    [RVBGameData gameData].blueScore = blueScore + brick.tag;  //setter
//    
//}








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
