//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by Austin Nolan on 4/17/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "BBALevelController.h"

@interface BBALevelController () <UICollisionBehaviorDelegate>

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
@property (nonatomic) UIDynamicItemBehavior * ballsDynamicsProperties;
@property (nonatomic) UIDynamicItemBehavior * bricksDynamicProperties;

//item attachement
@property (nonatomic) UIAttachmentBehavior * attacher;


@end



@implementation BBALevelController

{
    float paddleWidth;
    
    float ballWidth;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.bricks = [@[] mutableCopy];
        self.balls = [@[] mutableCopy];
        
        
        paddleWidth = 50;
        
        ballWidth = 10;

        
        self.view.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1.0];
        
        
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)resetLevel
{
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];

    [self createPaddle];
    [self createBall];
    
    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    
    self.collider.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.collider];
    
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
    self.paddle = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth) / 2, SCREEN_HEIGHT - 15, paddleWidth, 6)];
    
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.7];
    
    self.paddle.layer.cornerRadius = 3;
    
    [self.view addSubview:self.paddle];
}

-(void)createBricks
{
   
    
    
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
    
    self.pusher.pushDirection = CGVectorMake(0.05, 0.05);
    
    self.pusher.active = YES;
    
    [self.animator addBehavior:self.pusher];
    
    
}


@end
