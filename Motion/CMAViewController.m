//
//  CMAViewController.m
//  Motion
//
//  Created by Austin Nolan on 5/22/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "CMAViewController.h"

#import <CoreMotion/CoreMotion.h>




@interface CMAViewController ()

@end

@implementation CMAViewController

{
    
    
    CMMotionManager * mManager;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        mManager = [[CMMotionManager alloc]init];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float wh = (SCREEN_WIDTH - 30) / 2.0;
    
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, wh, wh)];
    topView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:topView];
    
    
    UIView * sideView = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH + 10) / 2, 10, wh, wh)];
    sideView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:sideView];
    
    
    UIView * topDot = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(topView.frame) - 10, CGRectGetMidY(topView.frame) - 10, 30, 30)];
    topDot.backgroundColor = [UIColor redColor];
    topDot.layer.cornerRadius = 15;
    [self.view addSubview:topDot];
    
    
    UIView * sideDot = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(sideView.frame) - 10, CGRectGetMidY(topView.frame) - 10, 30, 30)];
    sideDot.backgroundColor = [UIColor redColor];
    sideDot.layer.cornerRadius = 15;
    [self.view addSubview:sideDot];
    
    
    [mManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error)
        {
            NSLog(@"x : %f",accelerometerData.acceleration.x);
            NSLog(@"y : %f",accelerometerData.acceleration.y);
            NSLog(@"z : %f",accelerometerData.acceleration.z);

//            float x = accelerometerData.acceleration.x;
//            float y = - accelerometerData.acceleration.y;
//            float z = - accelerometerData.acceleration.z -1;
                        
            float tx = accelerometerData.acceleration.x;
            float ty = - accelerometerData.acceleration.y;
            
            float mintx = CGRectGetMinX(topView.frame);
            float maxtx = CGRectGetMinX(topView.frame);
            
            if(tx + topDot.frame.origin.x < mintx) tx = 0;
            if(tx + topDot.frame.origin.x > maxtx) tx = 0;

            float minty = CGRectGetMinX(topView.frame);
            float maxty = CGRectGetMinX(topView.frame);
            
            if(ty + topDot.frame.origin.y < minty) ty = 0;
            if(ty + topDot.frame.origin.y > maxty) ty = 0;
            
            topDot.frame = CGRectOffset(topDot.frame, tx, ty);
            
    
            
            float sx =  accelerometerData.acceleration.x;
            float sz = - accelerometerData.acceleration.z -1;
            
            float minsx = CGRectGetMinX(sideView.frame);
            float maxsx = CGRectGetMinX(sideView.frame);
            
            if(sx + sideDot.frame.origin.x < minsx) sx = 0;
            if(sx + sideDot.frame.origin.x > maxsx -20) sx = 0;
            
            float minsz = CGRectGetMinX(sideView.frame);
            float maxsz = CGRectGetMinX(sideView.frame);
            
            if(sz + sideDot.frame.origin.x < minsz) sz = 0;
            if(sz + sideDot.frame.origin.x > maxsz -20) sz = 0;
            
            sideDot.frame = CGRectOffset(sideDot.frame, sx, sz);

            
            
            
        }];
    
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

@end
