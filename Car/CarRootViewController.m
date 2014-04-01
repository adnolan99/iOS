//
//  CarRootViewController.m
//  Car
//
//  Created by Austin Nolan on 4/1/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "CarRootViewController.h"
#import "Window.h"
#import "Bumper.h"
#import "Ignition.h"
#import "GasPedal.h"
#import "Brake.h"
#import "Wheel.h"


@interface CarRootViewController ()

@end

@implementation CarRootViewController

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
    // Do any additional setup after loading the view.
    
    Window *passWindow = [[Window alloc] init];
    Window *backPassWindow = [[Window alloc] init];
    Window *windsheild = [[Window alloc] init];
    Window *backWindow = [[Window alloc] init];
    
    Brake *brkpedal = [[Brake alloc] init];
    Bumper *frontBumper = [[Bumper alloc] init];
    GasPedal *gsPedal = [[GasPedal alloc] init];
    Wheel *rim1 = [[Wheel alloc] init];
    Wheel *rim2 = [[Wheel alloc] init];
    Wheel *rim3 = [[Wheel alloc] init];
    Wheel *rim4 = [[Wheel alloc] init];
    Wheel *spare = [[Wheel alloc] init];
    Ignition *starter = [[Ignition alloc] init];
    
    
    
    
    passWindow.width = 1;
    passWindow.tinted = YES;
    passWindow.typeMaterial = @"glass";
    passWindow.frame = CGRectMake(75, 175, 40, 40);
    
    backPassWindow.width = 1;
    backPassWindow.tinted = YES;
    backPassWindow.typeMaterial = @"glass";
    backPassWindow.frame = CGRectMake(175, 175, 40, 40);
    
    windsheild.width = 1;
    windsheild.tinted = YES;
    windsheild.typeMaterial = @"glass";
    windsheild.frame = CGRectMake(240, 165, 10, 45);
    
    backWindow.width = 1;
    backWindow.tinted = YES;
    backWindow.typeMaterial = @"glass";
    backWindow.frame = CGRectMake(50, 165, 10, 45);
    
    brkpedal.resistance = @"light";
    brkpedal.length = 4;
    brkpedal.color = @"black";
    brkpedal.frame = CGRectMake(190, 230, 10, 10);
    [brkpedal setTitle:@"X" forState:UIControlStateNormal];
    
    [brkpedal addTarget:self action:@selector(pressBrake) forControlEvents:UIControlEventTouchUpInside];
    
    frontBumper.length = 4;
    frontBumper.shape = @"round";
    frontBumper.color = @"chrome";
    
    gsPedal.resistance = @"heavy";
    gsPedal.length = 5;
    gsPedal.color = @"black";
    gsPedal.frame = CGRectMake(190, 250, 10, 10);
    [gsPedal setTitle:@"G" forState:UIControlStateNormal];
    
    [gsPedal addTarget:self action:@selector(pressGasPedal) forControlEvents:UIControlEventTouchUpInside];
    
    rim1.rimSize = 18;
    rim1.flat = NO;
    rim1.brand = @"stock";
    rim1.frame = CGRectMake(200, 250, 40, 40);
    
    rim2.rimSize = 18;
    rim2.flat = NO;
    rim2.brand = @"stock";
    rim2.frame = CGRectMake(150, 250, 40, 40);
    
    rim3.rimSize = 18;
    rim3.flat = NO;
    rim3.brand = @"stock";
    rim3.frame = CGRectMake(100, 250, 40, 40);
    
    rim4.rimSize = 18;
    rim4.flat = NO;
    rim4.brand = @"stock";
    rim4.frame = CGRectMake(50, 250, 40, 40);
    
    spare.rimSize = 17;
    spare.flat = NO;
    spare.brand = @"Emergency Spare";
    spare.frame = CGRectMake(20, 200, 25, 25);
    
    starter.pushStart = @"Yes";
    starter.light = @"Yes";
    starter.color = @"Black w/ Orange Backlight";
    starter.frame = CGRectMake(190, 200, 15, 15);
    [starter setTitle:@"Start" forState:UIControlStateNormal];
    
    [starter addTarget:self action:@selector(pressStarter) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:passWindow];
    [self.view addSubview:backPassWindow];
    [self.view addSubview:windsheild];
    [self.view addSubview:backWindow];
    [self.view addSubview:brkpedal];
    [self.view addSubview:frontBumper];
    [self.view addSubview:gsPedal];
    [self.view addSubview:rim1];
    [self.view addSubview:rim2];
    [self.view addSubview:rim3];
    [self.view addSubview:rim4];
    [self.view addSubview:spare];
    [self.view addSubview:starter];

}


- (void)pressGasPedal
{
    NSLog(@"pressed gas");
}

- (void)pressBrake
{
    NSLog(@"pressed brake");
}

- (void)pressStarter;
{
    NSLog(@"pressed starter");
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
