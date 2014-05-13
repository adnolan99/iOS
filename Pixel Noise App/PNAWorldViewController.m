//
//  PNAWorldViewController.m
//  Pixel Noise App
//
//  Created by Austin Nolan on 5/5/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "PNAWorldViewController.h"
#import "PNAPixelSounds.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface PNAWorldViewController () <UICollisionBehaviorDelegate>


@property (nonatomic) UIDynamicAnimator * animator;

@property (nonatomic, weak) UIView * square;

@property (nonatomic) UICollisionBehavior * collider;

@property (nonatomic) UIPushBehavior * pusher;

@property (nonatomic) NSMutableArray * miniSquares;



//@property (nonatomic) UIDynamicItemBehavior * squareProperties;


@end

@implementation PNAWorldViewController
{
    UIView * square;
    
    
    
    PNAPixelSounds * sounds;
    
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        
        self.miniSquares = [@[] mutableCopy];
        
//        int w = self.view.frame.size.width;
//        int h = self.view.frame.size.height;
        
        //[self.collider addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(w, 0)];
        //[self.collider addBoundaryWithIdentifier:@"leftWall" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(0, h)];
        //[self.collider addBoundaryWithIdentifier:@"rightWall" fromPoint:CGPointMake(w, 0) toPoint:CGPointMake(w, h)];
        //[self.collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0, h - 50) toPoint:CGPointMake(w, h - 50)];
        
        //[self.animator addBehavior:self.collider];
        
        {
            sounds = [[PNAPixelSounds alloc]init];
        }
        
        
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}






-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    
    UITouch * touch = [touches allObjects][0];
    
    CGPoint location = [touch locationInView:self.view];
    
    square = [[UIView alloc] initWithFrame:CGRectMake(location.x, location.y, 10, 10)];
    square.backgroundColor = [UIColor blackColor];
    [self.view addSubview:square];
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;

    UIDynamicAnimator * animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[square]];
    
    UICollisionBehavior * collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[square]];
    collisionBehavior.collisionDelegate = self;
    
    
    //collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [collisionBehavior addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0, h) toPoint:CGPointMake(w, h)];

   
    
    [sounds playSoundWithName:@"analogue_deny"];
    
    
    [animator addBehavior:gravityBehavior];
    [animator addBehavior:collisionBehavior];

    self.animator = animator;
    
    NSLog(@"break");


}

-(void)playSoundWithName:(NSString *)soundName
{
    
    NSString * file = [[NSBundle mainBundle]pathForResource:soundName ofType:@"wav"];
    
    NSData * fileData = [NSData dataWithContentsOfFile:file];
    
    self.player = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
    
    self.player.numberOfLoops = 0;
    
    [self.player play];
}




-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withBoundaryIdentifier:(id<UIDynamicItem>)identifier atPoint:(CGPoint)p
{
    
    if ([(NSString *) identifier isEqual:@"floor"])
    {
        [self playSoundWithName:@"analogue_deny"];

        square = (UIView *) item1;
        
        [square removeFromSuperview];
        
        
        CGRect frame = self.square.frame;
        
        UIView * splashSquare = [[UIView alloc] initWithFrame:CGRectMake((frame.origin.x), frame.origin.y, 5, 5)];
        
        [self.view addSubview:splashSquare];
        
        


        
    }


}

-(void)createSplash
{
    
    
    
    
    
    CGRect frame = self.square.frame;
                                    
    UIView * splashSquare = [[UIView alloc] initWithFrame:CGRectMake((frame.origin.x), frame.origin.y, 5, 5)];
    
    
    

    
    
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
