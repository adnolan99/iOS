//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by Austin Nolan on 4/17/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "BBALevelController.h"

#import "BBASingleton.h"

#import <AVFoundation/AVFoundation.h>

@interface BBALevelController () <UICollisionBehaviorDelegate, AVAudioPlayerDelegate>



//@property (nonatomic) AVAudioPlayer * player;

@property (nonatomic) NSMutableArray * players;



@property (nonatomic) UIView * paddle;
@property (nonatomic) NSMutableArray * balls;
@property (nonatomic) NSMutableArray * bricks;

//dynamics animator
@property (nonatomic) UIDynamicAnimator * animator;

//pushes the ball
@property (nonatomic) UIPushBehavior * pusher;

//handles collisions
@property (nonatomic) UICollisionBehavior * collider;

//item behavior properties
@property (nonatomic) UIDynamicItemBehavior * paddleDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior * ballsDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior * bricksDynamicProperties;

//item attachement
@property (nonatomic) UIAttachmentBehavior * attacher;

//@property (nonatomic) UILabel * pointLabel;

@end

@implementation BBALevelController

{
    float paddleWidth;
    float ballWidth;
    int points;
    int ballCount;
    
    UILabel * score;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.bricks = [@[] mutableCopy];
        self.balls = [@[] mutableCopy];
        
        paddleWidth = 450;
        
        ballWidth = 10;
        
        points= 0;
        
        ballCount = 3;
        
        self.view.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1.0];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
        [self.view addGestureRecognizer:tap];
        
    }
    return self;
}


-(void)playSoundWithName:(NSString *) soundName
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    
    NSURL * url =[[NSURL alloc] initFileURLWithPath:file];
    
    
    
    AVAudioPlayer * player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    
    
    player.delegate = self;
    
    //self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];

    [self.players addObject:player];
    
    [player play];
    
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
    [self.players removeObjectIdenticalTo:player];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    score = [[UILabel alloc] initWithFrame:CGRectMake(5, -20, 100, 20)];
    
    

}


-(void)resetLevel
{
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];

    [self createPaddle];
    [self createBall];
    [self createBricks];
    
    
    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;

    [self.collider addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(w, 0)];
    [self.collider addBoundaryWithIdentifier:@"leftWall" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(0, h)];
    [self.collider addBoundaryWithIdentifier:@"rightWall" fromPoint:CGPointMake(w, 0) toPoint:CGPointMake(w, h)];
    [self.collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0, h + 10) toPoint:CGPointMake(w, h + 10)];

    [self.animator addBehavior:self.collider];
    
    [BBASingleton mainData].currentScore = 0;
    
    
    
   // self.ballsDynamicsProperties = [[UIDynamicItemBehavior alloc] initWithItems:self.balls];
    
    
    self.ballsDynamicProperties = [self createPropertiesForItems:self.balls];
    self.bricksDynamicProperties = [self createPropertiesForItems:self.bricks];
    self.paddleDynamicProperties = [self createPropertiesForItems:@[self.paddle]];

    self.paddleDynamicProperties.density = 100000;
    self.bricksDynamicProperties.density = 100000;
    
    self.ballsDynamicProperties.elasticity = 1.0;
    self.ballsDynamicProperties.resistance = 0.0;
    
    
    [self createHeader];
}




-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    
    
    if([item1 isEqual:self.paddle] || [item2 isEqual:self.paddle])
    {
        [self playSoundWithName:@"triangle_alert"];
    }
    
    
    
    UIView * tempBrick;
    
    for (UIView * brick in self.bricks)
    {
        if ([item1 isEqual:brick] || [item2 isEqual:brick])
        {
            
            if(brick.alpha == 0.5)
               {
                   tempBrick = brick;
                   
                   UILabel * pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(tempBrick.frame.origin.x, tempBrick.frame.origin.y, 50, 50)];
                   pointLabel.textColor = [UIColor whiteColor];
                   pointLabel.text = [NSString stringWithFormat:@"+%d", (int)brick.tag ];
                   pointLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
                   [self.view addSubview:pointLabel];
                   
                   points += brick.tag;
                   
                   
                   NSInteger currentScore = [BBASingleton mainData].currentScore;  //getter
                   
                   
                   [BBASingleton mainData].currentScore = currentScore + brick.tag;  //setter
                   
                   
                   
                   
                   [brick removeFromSuperview];
                   [self.collider removeItem:brick];
                   
                   [UIView animateWithDuration:0.4 animations:^{pointLabel.alpha = 0.0;}
                                    completion:^(BOOL finished) {[pointLabel removeFromSuperview];
                                                                }];
               
               
                   UILabel * pointScore = [[UILabel alloc] initWithFrame:CGRectMake(200, 130, 300, 100)];
                   pointScore.textColor = [UIColor yellowColor];
                   pointScore.alpha = 0.5;
                   pointScore.text = [NSString stringWithFormat:@"SCORE %d", points];
                   pointScore.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:40];
                   //pointScore.text = [BBASingleton mainData].topScore;
                   
                   //pointScore.alpha = 0.5;
                   [self.view addSubview:pointScore];
                   
                   
                   [UIView animateWithDuration:0.8 animations:^{pointScore.alpha = 0.0;}
                                    completion:^(BOOL finished) {[pointScore removeFromSuperview];
                                    }];
                   
                   score.text = [NSString stringWithFormat:@"Score %d", points];
                   [self.view addSubview:score];

                   
               }
            brick.alpha = 0.5;
        }
    }
    
    
    NSLog(@"Total Points = %d",points);
    
    if(tempBrick != nil)
    {
        [self.bricks removeObjectIdenticalTo:tempBrick];
    
    [self playSoundWithName:@"wobble_alert"];
    }
}


-(void)createHeader
{
    
    UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, -40, SCREEN_WIDTH, 40)];
    header.backgroundColor = [UIColor greenColor];
    [self.view  addSubview:header];
   
    }



-(void)keepScore
{
//    UILabel * score = [[UILabel alloc] initWithFrame:CGRectMake(5, -20, 100, 20)];
//    score.text = [NSString stringWithFormat:@"Score %d", points];
//    [self.view addSubview:score];

}




-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if ([(NSString *)identifier isEqualToString:@"floor"])
    {
        UIView * ball =(UIView *)item;
       // UILabel * lives = ballCount;

        
        
        [ball removeFromSuperview];
        [self.collider removeItem:ball];
        ballCount -=1;
        self.createBall;
        //[self.collider addItem:ball];
        
        
        
        if (ballCount == 0)
        {
        [self.delegate respondsToSelector:@selector(gameDone)];
        [self.delegate gameDone];
        }
    
    }
    
    //else (self.createBall);
}






-(UIDynamicItemBehavior *)createPropertiesForItems:(NSArray *)items
{
    UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc] initWithItems:items];
    
    properties.allowsRotation = NO;
    
    properties.friction = 0.0;
    
    [self.animator addBehavior:properties];
    
    return properties;
}


-(NSArray *)allItems
{
    NSMutableArray * items = [@[self.paddle]mutableCopy];
    
    for(UIView * item in self.balls)[items addObject:item];
    
    for(UIView * item in self.bricks) [items addObject:item];

        return items;
}


-(void)createPaddle
{
    self.paddle = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth) / 2, SCREEN_HEIGHT - 55, paddleWidth, 6)];
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.7];
    self.paddle.layer.cornerRadius = 3;
    [self.view addSubview:self.paddle];
    
    self.attacher = [[UIAttachmentBehavior alloc] initWithItem:self.paddle attachedToAnchor:CGPointMake(CGRectGetMidX(self.paddle.frame),CGRectGetMidY(self.paddle.frame))];

    [self.animator addBehavior:self.attacher];
}


-(void)createBricks
{
   
    int brickCols = 10;
    int brickRows = 4;
    
    
    float brickWidth = (SCREEN_WIDTH - (10 *(brickCols +1))) / brickCols;
    float brickHeight = 20;
    
    for (int c = 0; c < brickCols; c++)
    {
        for(int r = 0; r < brickRows; r++)
        {
            float brickX = ((brickWidth +10) *c) +10;
            float brickY = ((brickHeight + 10) *r) +10;
            UIView * brick =[[UIView alloc] initWithFrame:CGRectMake(brickX, brickY, brickWidth, brickHeight)];
            brick.layer.cornerRadius = 6;
            brick.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.7];
        
            int random = (arc4random_uniform(5) +1)* 50;
            
            brick.tag = random;
            
        [self.view addSubview:brick];
        [self.bricks addObject:brick];
        }
    }
}
-(void)createBall
{
    CGRect frame = self.paddle.frame;
    
    UIView * ball = [[UIView alloc] initWithFrame:CGRectMake((frame.origin.x) + ((paddleWidth-ballWidth)/ 2), frame.origin.y - 12, ballWidth, ballWidth)];
    
    ball.backgroundColor = [UIColor whiteColor];
    
    ball.layer.cornerRadius = 5;
    
    [self.view addSubview:ball];
    
    [self.balls addObject:ball];
    
    self.pusher =[[UIPushBehavior alloc] initWithItems:self.balls mode:UIPushBehaviorModeInstantaneous];
    
    self.pusher.pushDirection = CGVectorMake(0.01, -0.01);
    
    self.pusher.active = YES;
    
    [self.animator addBehavior:self.pusher];
    
    
}



-(void)tapScreen:(UITapGestureRecognizer *)gr
{
    CGPoint location = [gr locationInView:self.view];
    
    self.attacher.anchorPoint = CGPointMake(location.x, self.attacher.anchorPoint.y);

}

@end
