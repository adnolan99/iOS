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
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
        [self.view addGestureRecognizer:tap];
        
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
    
    //self.collider.translatesReferenceBoundsIntoBoundary = YES;
    
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;

    
    
    [self.collider addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(w, 0)];
    [self.collider addBoundaryWithIdentifier:@"leftWall" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(0, h)];
    [self.collider addBoundaryWithIdentifier:@"rightWall" fromPoint:CGPointMake(w, 0) toPoint:CGPointMake(w, h)];
    [self.collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0, h + 10) toPoint:CGPointMake(w, h + 10)];

    
    
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
                   
                   
                   [brick removeFromSuperview];
                   [self.collider removeItem:brick];
                   
                   [UIView animateWithDuration:0.4 animations:^{pointLabel.alpha = 0.0;}
                                    completion:^(BOOL finished) {[pointLabel removeFromSuperview];
                                                                }];
               }
            brick.alpha = 0.5;
        }
    }
    
    
    NSLog(@"Total Points = %f",points);
    
    if(tempBrick != nil) [self.bricks removeObjectIdenticalTo:tempBrick];
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if ([(NSString *)identifier isEqualToString:@"floor"])
    {
        UIView * ball =(UIView *)item;
        
        [ball removeFromSuperview];
        [self.collider removeItem:ball];
    

    if (
        [self.delegate respondsToSelector:@selector(gameDone)])
        [self.delegate gameDone];
     
    }
}


    //[self.view removeFromeSuperview];
    //
    




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
    
    self.pusher.pushDirection = CGVectorMake(0.01, 0.01);
    
    self.pusher.active = YES;
    
    [self.animator addBehavior:self.pusher];
    
    
}



-(void)tapScreen:(UITapGestureRecognizer *)gr
{
    CGPoint location = [gr locationInView:self.view];
    
    self.attacher.anchorPoint = CGPointMake(location.x, self.attacher.anchorPoint.y);

}

@end
