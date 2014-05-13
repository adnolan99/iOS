//
//  PNAWorld2ViewController.m
//  Pixel Noise App
//
//  Created by Austin Nolan on 5/6/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "PNAWorld2ViewController.h"

#import "PNAPixelSounds.h"

@interface PNAWorld2ViewController () <UICollisionBehaviorDelegate>


@property (nonatomic) UIDynamicAnimator * animator;
@property (nonatomic) UIGravityBehavior * gravity;
@property (nonatomic) UICollisionBehavior * collision;
@property (nonatomic) UIDynamicItemBehavior * shardBehavior;
@property (nonatomic) UICollisionBehavior * shardCollision;

@end

@implementation PNAWorld2ViewController

{
    
    PNAPixelSounds * sounds;
    
    NSArray * splatterDirections;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //initiate sounds variable
        sounds = [[PNAPixelSounds alloc] init];
        
        //splash
        splatterDirections = @[
                               [NSValue valueWithCGPoint:CGPointMake(-1.0, -0.5)],
                               [NSValue valueWithCGPoint:CGPointMake(-0.5, -0.5)],
                               [NSValue valueWithCGPoint:CGPointMake(0.0, -0.9)],
                               [NSValue valueWithCGPoint:CGPointMake(0.5, -0.5)],
                               [NSValue valueWithCGPoint:CGPointMake(1.0, -0.5)]
                               ];
        
        //initiate animator
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
        //initiate gravity behavior
        self.gravity = [[UIGravityBehavior alloc] init];
        
        //add gravity behavior to animator
        [self.animator addBehavior:self.gravity];
        
        self.collision = [[UICollisionBehavior alloc] init];
        
        //sets boundry
        self.collision.TranslatesReferenceBoundsIntoBoundary = YES;
        
        //initiate collision delegate
        self.collision.collisionDelegate = self;
        
        //add collision as behavior
        [self.animator addBehavior:self.collision];
        
        //create a block
        UIView * block = [[UIView alloc] initWithFrame:CGRectMake(160, 50, 20, 20)];
        block.backgroundColor = [UIColor blueColor];
        
        //add block to subview before adding to collision
        [self.view addSubview:block];
        
        //add block to gravity behavior
        [self.gravity addItem:block];
        
        //add block to collision behavior
        [self.collision addItem:block];
        
        
        self.shardBehavior = [[UIDynamicItemBehavior alloc] init];
        
        self.shardBehavior.density = 10;
        [self.animator addBehavior:self.shardBehavior];
        
        
        self.shardCollision = [[UICollisionBehavior alloc] init];
        self.shardCollision.TranslatesReferenceBoundsIntoBoundary = YES;
        self.shardCollision.collisionDelegate = self;
        [self.animator addBehavior:self.shardCollision];
        
        
        
        
        // Custom initialization
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    for (UITouch * touch in touches)
        [self createBlockWithLocation:[touch locationInView:self.view]];
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
        [self createBlockWithLocation:[touch locationInView:self.view]];
    
    
}



-(void)createBlockWithLocation:(CGPoint) location
{
    UIView * block = [[UIView alloc] initWithFrame:CGRectMake(location.x, location.y, 20, 20)];
    block.backgroundColor = [UIColor blueColor];
    [self.view addSubview:block];
    [self.gravity addItem:block];
    [self.collision addItem:block];
    
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    
    if([behavior isEqual:self.collision])
    {
    [sounds playSoundWithName:@"analogue_deny"];

    [self createShardsWithLocation:p];
    UIView * collidedBlock = (UIView *) item;
    
    [self.gravity removeItem:collidedBlock];
    [self.collision removeItem:collidedBlock];
    
    
    
    [collidedBlock removeFromSuperview];

    }



    if ([behavior isEqual:self.shardCollision])
    {

        UIView * collidedShard = (UIView *) item;
        
        [self.gravity removeItem:collidedShard];
        [self.shardBehavior removeItem:collidedShard];

        [self.shardCollision removeItem:collidedShard];
        
        [collidedShard removeFromSuperview];
    }

}




-(void)createShardsWithLocation:(CGPoint)location
{
    for (NSValue * pointValue in splatterDirections)
    
    {
        CGPoint direction = [pointValue CGPointValue];
        
        UIView * shard = [[UIView alloc] initWithFrame:CGRectMake(location.x, location.y - 30, 15, 15)];
        shard.backgroundColor = [UIColor redColor];
        self.shardBehavior.allowsRotation = YES;
        
        [self.view addSubview:shard];
        [self.gravity addItem:shard];
        
        [self.shardBehavior addItem:shard];
        
        [self.shardCollision addItem:shard];

        UIPushBehavior * pusher = [[UIPushBehavior alloc] initWithItems:@[shard] mode:UIPushBehaviorModeInstantaneous];
        
        [self.animator addBehavior:pusher];
        
        pusher.pushDirection = CGVectorMake(direction.x, direction.y);
        
        
    
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




@end
