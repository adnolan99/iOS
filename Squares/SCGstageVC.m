//
//  SCGstageVC.m
//  Squares
//
//  Created by Austin Nolan on 4/11/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "SCGStageVC.h"

#import "SCGSquare.h"



@implementation SCGStageVC

{
    int gameSize;
    
    
    NSArray * playerColors;
    
    int playerTurn;
    
    NSMutableDictionary * tappedDots;
    
    NSMutableDictionary * allSquares;
    
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        playerColors = @[BLUE_COLOR, ORANGE_COLOR];
        
        playerTurn = 0;
        
        tappedDots = [@{} mutableCopy];
        
        allSquares = [@{} mutableCopy];

    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    gameSize = 4;
    float circleWidth = SCREEN_WIDTH / gameSize;
    float squareWidth = circleWidth / 2;
    for (int sRow = 0; sRow <gameSize -1; sRow++)
    {
        for (int sCol = 0; sCol < gameSize -1; sCol++)
        {
            float squareX = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sCol);
            float squareY = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sRow) +((SCREEN_HEIGHT - SCREEN_WIDTH) /2);
        
            
            SCGSquare * square = [[SCGSquare alloc] initWithFrame:CGRectMake(squareX, squareY, squareWidth, squareWidth)];
            square.backgroundColor = [UIColor lightGrayColor];
            
            NSString * key = [NSString stringWithFormat: @"c%dr%d", sCol, sRow];
            allSquares [key] = square;
            
            [self.view addSubview:square];
        }
    }
    
    
    //create circles
    for (int row =0; row < gameSize; row++)
    {
        for (int col = 0; col < gameSize; col++)
        {
        float circleX = circleWidth * col;
        float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH) / 2);
        SCGCircle * circle = [[SCGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];
        circle.position = (CGPoint){col,row};
        circle.delegate = self;
        NSString * key = [NSString stringWithFormat: @"c%dr%d",col,row];
        tappedDots [key] = @2;
        [self.view addSubview:circle];
        }
    }
}


- (UIColor *)circleTappedWithPosition: (CGPoint)position
{
    NSString * key = [NSString stringWithFormat: @"c%dr%d", (int)position.x, (int)position.y];
    tappedDots[key] = @(playerTurn);
    
    [self checkForSquareAroundPosition:position];
    
    UIColor * currentColor = playerColors[playerTurn];
    playerTurn = (playerTurn) ? 0 : 1;
    return currentColor;
    
}

-(void) checkForSquareAroundPosition: (CGPoint)position
{
 
//    @{
//      @"r0c0" : @0,
//      @"r0c1" : @1,
//      @"r0c2" : @2
//      };
    
    int pX = position.x;
    int pY = position.y;
    
    // x= col and y =row
    
    BOOL above = (position.y > 0);
    BOOL below = (position.y < gameSize -1);
    BOOL left =(position.x > 0);
    BOOL right=(position.x < gameSize -1);
    
    
    if (above && left)
    {
        //0,0 0,1 1,0 1,1
        
        for (UIColor * color in playerColors)
        {
            int player =[playerColors indexOfObject:color];
            
            NSString * topLeftDot = [NSString stringWithFormat:@"c%dr%d",pX-1,pY-1];
            NSString * topRightDot = [NSString stringWithFormat:@"c%dr%d",pX,pY-1];
            NSString * bottomLeftDot = [NSString stringWithFormat:@"c%dr%d",pX-1,pY];
            NSString * bottomRightDot = [NSString stringWithFormat:@"c%dr%d",pX,pY];

            BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]);
            BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);
            BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);
        
            if(topDotsSame && bottomDotsSame && leftDotsSame && [tappedDots[topLeftDot] isEqualToValue:@(player)])
            {
                SCGSquare * currentSquare = allSquares [topLeftDot];
                
                currentSquare.backgroundColor = color;
            }
        }
    }
    
    if (above && right)
    {
        NSString * topLeftDot = [NSString stringWithFormat:@"c%dr%d",pX,pY+1];
        NSString * topRightDot = [NSString stringWithFormat:@"c%dr%d",pX+1,pY+1];
        NSString * bottomLeftDot = [NSString stringWithFormat:@"c%dr%d",pX,pY];
        NSString * bottomRightDot = [NSString stringWithFormat:@"c%dr%d",pX+1,pY];
        
//        BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]);
//        BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);
//        BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);
    }
    
    if(below && left)
    {
        NSString * topLeftDot = [NSString stringWithFormat:@"c%dr%d",pX-1,pY];
        NSString * topRightDot = [NSString stringWithFormat:@"c%dr%d",pX,pY];
        NSString * bottomLeftDot = [NSString stringWithFormat:@"c%dr%d",pX-1,pY-1];
        NSString * bottomRightDot = [NSString stringWithFormat:@"c%dr%d",pX,pY-1];
        
//        BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]);
//        BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);
//        BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);
    }
    
    if(below && right)
    {
     
        NSString * topLeftDot = [NSString stringWithFormat:@"c%dr%d",pX,pY];
        NSString * topRightDot = [NSString stringWithFormat:@"c%dr%d",pX+1,pY];
        NSString * bottomLeftDot = [NSString stringWithFormat:@"c%dr%d",pX,pY-1];
        NSString * bottomRightDot = [NSString stringWithFormat:@"c%dr%d",pX+1,pY+1];
        
//        BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]);
//        BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);
//        BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);
    }
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

-(BOOL)prefersStatusBarHidden { return YES; }


@end
