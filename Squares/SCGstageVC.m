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
    UIButton * newGameButton;
    UIButton * homeButton;
    UIView * homeScreen;
    UIView * gameScreen;
    UIView * gameBoard;
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
        
        homeScreen = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        homeScreen.backgroundColor = [UIColor redColor];
        gameScreen = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        gameScreen.backgroundColor = [UIColor yellowColor];
        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    newGameButton= [[UIButton alloc] initWithFrame:CGRectMake(110, 160, 200, 40)];
    [newGameButton setTitle:@"Start New Game" forState:UIControlStateNormal];
    newGameButton.tag = 2;
    newGameButton.backgroundColor= [UIColor blackColor];
    newGameButton.layer.cornerRadius = 20;
    [newGameButton addTarget:self action:@selector(createGameBoard) forControlEvents:UIControlEventTouchUpInside];
    
    [homeScreen addSubview:newGameButton];
    [self.view addSubview:homeScreen];
    
    
    
    
    homeButton= [[UIButton alloc] initWithFrame:CGRectMake(110, 5, 200, 40)];
    [homeButton setTitle:@"HOME" forState:UIControlStateNormal];
    homeButton.tag = 2;
    homeButton.backgroundColor= [UIColor blackColor];
    homeButton.layer.cornerRadius = 20;
    [homeButton addTarget:self action:@selector(backToHomeScreen) forControlEvents:UIControlEventTouchUpInside];
    
    [gameScreen addSubview:homeButton];
    
    
}

-(void) createGameBoard
{
    gameSize = 12;

    float circleWidth = (SCREEN_WIDTH - 50) / gameSize;
    float squareWidth = circleWidth / 2;

    gameBoard = [[UIView alloc] initWithFrame:CGRectMake(25, (SCREEN_HEIGHT - SCREEN_WIDTH + 50) / 2, SCREEN_WIDTH - 50, SCREEN_WIDTH - 50)];
    gameBoard.backgroundColor = [UIColor blueColor];
    
    for (int sRow = 0; sRow <gameSize -1; sRow++)
    {
        for (int sCol = 0; sCol < gameSize -1; sCol++)
        {
            float squareX = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sCol);
            float squareY = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sRow);
            
            SCGSquare * square = [[SCGSquare alloc] initWithFrame:CGRectMake(squareX, squareY, squareWidth, squareWidth)];
            square.backgroundColor = [UIColor lightGrayColor];
            
            NSString * key = [NSString stringWithFormat: @"c%dr%d", sCol, sRow];
            allSquares [key] = square;
            
            
            [gameBoard addSubview:square];
            
        }
    }
    
    
    //create circles
    for (int row =0; row < gameSize; row++)
    {
        for (int col = 0; col < gameSize; col++)
        {
            float circleX = circleWidth * col;
            float circleY = (circleWidth * row);
            SCGCircle * circle = [[SCGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];
            circle.position = (CGPoint){col,row};
            circle.delegate = self;
            NSString * key = [NSString stringWithFormat: @"c%dr%d",col,row];
            tappedDots [key] = @2;
            [gameBoard addSubview:circle];
        }
    }
    
    
    [homeScreen removeFromSuperview];
    [gameScreen addSubview:gameBoard];
    [gameScreen addSubview:homeButton];
    [self.view addSubview:gameScreen];
    
}


-(void)backToHomeScreen
{
    

    [self.view addSubview:homeScreen];
    [gameScreen removeFromSuperview];
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
 
    int pX = position.x;
    int pY = position.y;
    
    // x= col and y =row
    
    BOOL above = (position.y > 0);
    BOOL below = (position.y < gameSize -1);
    BOOL left =(position.x > 0);
    BOOL right=(position.x < gameSize -1);
    
    
    if (above && left)
    {
        
        [self checkQuadrantForPosition:(CGPoint){pX-1,pY-1}];
    }
    
    if (above && right)
    {
        [self checkQuadrantForPosition:(CGPoint){pX,pY-1}];

    
    }
    if(below && left)
    {
        [self checkQuadrantForPosition:(CGPoint){pX-1,pY}];

    }
    
    if(below && right)
    {
        [self checkQuadrantForPosition:(CGPoint){pX,pY}];

    }
}


- (void)checkQuadrantForPosition:(CGPoint)position
{
    int pX = position.x;
    int pY = position.y;
    
//    for (UIColor * color in playerColors)
//    {
//        int player =[playerColors indexOfObject:color];
    
        NSString * topLeftDot = [NSString stringWithFormat:@"c%dr%d",pX,pY];
        NSString * topRightDot = [NSString stringWithFormat:@"c%dr%d",pX+1,pY];
        NSString * bottomLeftDot = [NSString stringWithFormat:@"c%dr%d",pX,pY+1];
        NSString * bottomRightDot = [NSString stringWithFormat:@"c%dr%d",pX+1,pY+1];
        
        BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]);
        BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);
        BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);
        
        if(topDotsSame && bottomDotsSame && leftDotsSame && [tappedDots[topLeftDot] isEqualToValue:@(playerTurn)])
        {
            SCGSquare * currentSquare = allSquares [topLeftDot];
            
            currentSquare.backgroundColor = playerColors[playerTurn];
        }
//    }
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
