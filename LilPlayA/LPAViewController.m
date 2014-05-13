//
//  LPAViewController.m
//  LilPlayA
//
//  Created by Austin Nolan on 5/13/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "LPAViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface LPAViewController ()


@property (nonatomic) NSObject * pressed;

@end



@implementation LPAViewController
{
    
    AVAudioPlayer * player;
    UIButton * playButton;
    UIButton * stopButton;
    
    UIView * progressBar;
    UIView * playedBar;
    UIButton * seekButton;
    
    
    
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        

        playButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 50, 50)];
        playButton.backgroundColor = [UIColor greenColor];
        
        [playButton setImage: [UIImage imageNamed: @"play"] forState:UIControlStateNormal];
        [playButton setImage: [UIImage imageNamed: @"pause"] forState:UIControlStateSelected];
        playButton.layer.cornerRadius = 25;

        
        [self.view addSubview:playButton];
        

        stopButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 200, 50, 50)];
        stopButton.backgroundColor = [UIColor redColor];
        [stopButton setImage: [UIImage imageNamed: @"stop"] forState:UIControlStateNormal];
        stopButton.layer.cornerRadius = 25;

        [self.view addSubview:stopButton];

        progressBar = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 250, 10)];
        progressBar.backgroundColor = [UIColor lightGrayColor];
        progressBar.layer.cornerRadius = 5;
        [self.view addSubview:progressBar];

        seekButton = [[UIButton alloc]initWithFrame:CGRectMake(0, -5, 20, 20)];
        seekButton.backgroundColor = [UIColor blueColor];
        seekButton.layer.cornerRadius = 10;
        //[seekButton addTarget:self action:@selector(touchesBegan:withEvent:) forControlEvents:UIControlEventTouchUpInside];

        [progressBar addSubview:seekButton];
        
        
        
        UISlider * volume= [[UISlider alloc] initWithFrame:CGRectMake(50, 30, 200, 10)];
        [volume addTarget:self action:@selector(changeVolume:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:volume];
        
        
        //NSTimer * timer = [[NSTimer alloc]init];
        
        
        
        // these dispatches allow us to operate on diferent threads
        // the first jumps on to a secondary thread, the second comes back to the main thread
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long) NULL),^{
        
        
        NSURL * url = [NSURL URLWithString:@"https:api.soundcloud.com/tracks/147445565/download?client_id=2d87025c8392069f828c446b965862e3"];
        
        NSData * data = [NSData dataWithContentsOfURL:url];
        
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                player = [[AVAudioPlayer alloc] initWithData:data error:nil];

                [playButton addTarget:self action:@selector(pressPausePlay:) forControlEvents:UIControlEventTouchUpInside];
                NSLog(@"log");
                [stopButton addTarget:self action:@selector(pressStop:) forControlEvents:UIControlEventTouchUpInside];
            
//        [player play];
            });
        });
    }
    return self;
}




-(void)changeVolume: (UISlider *)slider
{
    
    player.volume = slider.value;
}



-(void)pressPausePlay: (UIButton *)sender
{
    if ( sender.selected== NO) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(updateProgressBar) userInfo:nil repeats:YES];
        NSLog(@"playpress");

        [player play];
        sender.selected = YES;

    } else {
        [player stop];
        sender.selected = NO;
    }
    
}

-(void)pressStop: (UIButton *)sender
{
    
    NSLog(@"log");
    
    [player stop];
    player.currentTime = 0.0;
    
    playButton.selected = NO;
    
}


-(void)updateProgressBar
{
    NSTimeInterval playtime = [player currentTime];
    NSTimeInterval duration = [player duration];
    duration = progressBar.frame.size.width;
    float x = progressBar.frame.origin.x + playtime -20; //* progressBar.frame.size.width;
    //float positionX = playtime/duration;

    
    playedBar = [[UIView alloc]initWithFrame:CGRectMake(x, 0, 250, 10)];
    playedBar.backgroundColor =[UIColor redColor];
    [progressBar addSubview:playedBar];
    [playedBar addSubview:seekButton];
    NSLog(@"%f",x);
    
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"touches Began");
    [player pause];
    [self.timer invalidate];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:playedBar];
        //playedBar.frame = CGRectMake(location.x, 0, 250, 10);

        seekButton.frame = CGRectMake(location.x, -5, 20, 20);
        NSLog(@"touches move");
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches end");
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:playedBar];
        //playedBar.frame = CGRectMake(location.x, 0, 250, 10);
        seekButton.frame = CGRectMake(location.x, -5, 20, 20);
        player.currentTime = location.x;
    [player play];
    
    }
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
