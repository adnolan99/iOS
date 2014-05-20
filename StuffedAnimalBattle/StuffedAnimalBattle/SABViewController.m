//
//  SABViewController.m
//  StuffedAnimalBattle
//
//  Created by Austin Nolan on 5/15/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "SABViewController.h"

#import <SpriteKit/SpriteKit.h>

#import "SABGameScene.h"

@interface SABViewController ()

@end

@implementation SABViewController




/* HomeWork
create singleton for player health
 track wins per player
 move buttons and bars outside of scene
 when a plater os hit update singleton and also update health bar
 notification or singleton delegate

 
 
 */



-(id)init
{
    self = [super init];
    if (self)
    {
        SKView * skView = [[SKView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        [self.view addSubview:skView];
        
        SABGameScene * skScene = [[SABGameScene alloc] initWithSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
    
        
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
    
        [skView presentScene:skScene];

        UIButton * buttonA = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 110, SCREEN_HEIGHT -95, 40, 40)];
        [buttonA addTarget:skScene action:@selector(buttonAClick:) forControlEvents:UIControlEventTouchUpInside];
        buttonA.backgroundColor = [UIColor redColor];
        [self.view addSubview:buttonA];
        
        UIButton * buttonB = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, SCREEN_HEIGHT -110, 40, 40)];
        [buttonB addTarget:skScene action:@selector(buttonBClick:) forControlEvents:UIControlEventTouchUpInside];
        buttonB.backgroundColor = [UIColor redColor];
        [self.view addSubview:buttonB];
       
        UIButton * dpadUp = [[UIButton alloc] initWithFrame:CGRectMake(60,SCREEN_HEIGHT -125, 40, 40)];
        [dpadUp addTarget:skScene action:@selector(upClick:) forControlEvents:UIControlEventTouchUpInside];
        dpadUp.backgroundColor = [UIColor blackColor];
        [self.view addSubview:dpadUp];
        
        UIButton * dpadDown = [[UIButton alloc] initWithFrame:CGRectMake(60, SCREEN_HEIGHT -75, 40, 40)];
        [dpadDown addTarget:skScene action:@selector(downClick:) forControlEvents:UIControlEventTouchUpInside];
        dpadDown.backgroundColor = [UIColor blackColor];
        [self.view addSubview:dpadDown];
        
        UIButton * dpadLeft = [[UIButton alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT -90, 40, 40)];
        [dpadLeft addTarget:skScene action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
        dpadLeft.backgroundColor = [UIColor blackColor];
        [self.view addSubview:dpadLeft];
        
        UIButton * dpadRight = [[UIButton alloc] initWithFrame:CGRectMake(110, SCREEN_HEIGHT -90, 40, 40)];
        [dpadRight addTarget:skScene action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
        dpadRight.backgroundColor = [UIColor blackColor];
        [self.view addSubview:dpadRight];
    }
    return self;
}



//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(BOOL)prefersStatusBarHidden {return YES;}

@end
