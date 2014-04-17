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

    float points;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.bricks = [@[] mutableCopy];
        self.balls = [@[] mutableCopy];
        
        paddleWidth = 50;
        
        ballWidth = 10;
        
        points= 0;

        self.view.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1.0];
        
        
       
        
        
        
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
    [self createBricks];
    
    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    
    self.collider.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:self.collider];
    
    
   // self.ballsDynamicsProperties = [[UIDynamicItemBehavior alloc] initWithItems:self.balls];
    
    
    self.ballsDynamicProperties = [self createPropertiesForItems:self.balls];
    self.bricksDynamicProperties = [self createPropertiesForItems:self.bricks];
    self.paddleDynamicProperties = [self createPropertiesForItems:@[self.paddle]];

    self.paddleDynamicProperties.density = 100000;
    self.bricksDynamicProperties.density = 100000;
    
    
    self.ballsDynamicProperties.elasticity = 1.0;
    self.ballsDynamicProperties.resistance = 0.0;

    
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    UIView * tempBrick;
    
    UILabel * pointLabel;
    
    for (UIView * brick in self.bricks)
    {
        if ([item1 isEqual:brick] || [item2 isEqual:brick])
        {
            
            if(brick.alpha == 0.5)
               {
        
                   tempBrick = brick;
                   
                   
                   
                   UILabel * pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(tempBrick.frame.origin.x, 10, 50, 50)];
                   pointLabel.textColor = [UIColor whiteColor];
                   pointLabel.text =@"+100";
                   pointLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
                   [self.view addSubview:pointLabel];
                   
                   points += 100;
                   
                   
                   [brick removeFromSuperview];
                   [self.collider removeItem:brick];
                   
                   //[self pointLabel]
                
               }
            brick.alpha = 0.5;
        }
    }
    
    
    NSLog(@"Total Points = %f",points);
    
    if(tempBrick != nil) [self.bricks removeObjectIdenticalTo:tempBrick];
    
    
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
    self.paddle = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth) / 2, SCREEN_HEIGHT - 15, paddleWidth, 6)];
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.7];
    self.paddle.layer.cornerRadius = 3;
    [self.view addSubview:self.paddle];
}

-(void)createBricks
{
   
    int brickCols = 10;
    float brickWidth = (SCREEN_WIDTH - (10 *(brickCols +1))) / brickCols;
    
    for (int i = 0; i < brickCols; i++)
    {
        float brickX = ((brickWidth +10) *i) +10;
        UIView * brick =[[UIView alloc] initWithFrame:CGRectMake(brickX, 10, brickWidth, 30)];
        brick.layer.cornerRadius = 6;
        brick.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.7];
        
        [self.view addSubview:brick];
        [self.bricks addObject:brick];
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
    
    self.pusher.pushDirection = CGVectorMake(0.02, 0.02);
    
    self.pusher.active = YES;
    
    [self.animator addBehavior:self.pusher];
    
    
}


@end
