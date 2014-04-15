//
//  DLAViewController.m
//  DrawLinesApp
//
//  Created by Austin Nolan on 4/15/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "DLAViewController.h"

#import "DLAStageLines.h"

#import "DLAStageScribble.h"

@interface DLAViewController ()

@end

@implementation DLAViewController

{
    
    
    UIButton * undoButton;
    UIButton * redButton;
    UIButton * blueButton;
    UIButton * greenButton;
    UIColor * lineColor;
    UISlider * lineWidthSlider;
    UIView * colorsDrawer;
    
    DLAStageScribble * scribbleView;
    
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
//        self.view = [[DLAStageLines alloc] initWithFrame:self.view.frame];
//        self.view= [[DLAStageScribble alloc] initWithFrame:self.view.frame];
        
        
//        undoButton = [[UIButton alloc] initWithFrame: CGRectMake(10, 10, 100, 20)];
//        [undoButton addTarget:self]
//         [[self.view addSubview:undoButton];
//        
//        
//        redButton = [[UIButton alloc] initWithFrame: CGRectMake(20, 100, 30, 30)];
//        redButton.backgroundColor= [UIColor redColor];
//        [redButton setTitle:@"R" forState:UIControlStateNormal];
//        redButton.layer.cornerRadius = 15;
//        [redButton addTarget:self action:@selector(changeLineColorRed:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:redButton];
//        
//        
//        blueButton = [[UIButton alloc] initWithFrame: CGRectMake(20, 140, 30, 30)];
//        blueButton.backgroundColor= [UIColor blueColor];
//        [blueButton setTitle:@"B" forState:UIControlStateNormal];
//        blueButton.layer.cornerRadius = 15;
//        [blueButton addTarget:self action:@selector(changeLineColorBlue:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:blueButton];
//        
//        greenButton = [[UIButton alloc] initWithFrame: CGRectMake(20, 180, 30, 30)];
//        greenButton.backgroundColor= [UIColor greenColor];
//        [greenButton setTitle:@"G" forState:UIControlStateNormal];
//        greenButton.layer.cornerRadius = 15;
//        [greenButton addTarget:self action:@selector(changeLineColorGreen:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:greenButton];
//        
        
        lineWidthSlider =[[UISlider alloc] initWithFrame:CGRectMake(40, 300, 100, 40)];
        
        lineWidthSlider.minimumValue = 2.0;
        lineWidthSlider.maximumValue = 20.0;
        
        [lineWidthSlider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventValueChanged];
        
        lineWidthSlider.backgroundColor = [UIColor grayColor];
        
        [self.view addSubview:lineWidthSlider];

    
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    scribbleView = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:scribbleView];
    
    colorsDrawer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    NSArray * colors = @[
                         [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f],
                         [UIColor colorWithRed:0.008f green:0.353f blue:0.431f alpha:1.0f],
                         [UIColor colorWithRed:0.016f green:0.604f blue:0.671f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.988f blue:0.910f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.298f blue:0.153f alpha:1.0f]
                         ];
    
    
    float buttonWidth = 320 / [colors count];
    
    for (UIColor * color in colors)
    {
    
        int index = [colors indexOfObject:color];
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, 40)];
        
        button.backgroundColor = color;
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        
        [colorsDrawer addSubview:button];
    }
    
    [self.view addSubview:colorsDrawer];
};

-(void)changeSize:(UISlider *)sender
{
    scribbleView.lineWidth = sender.value;
}

-(void)changeColor:(UIButton *)sender
{
    scribbleView.lineColor = sender.backgroundColor;
}



-(void)changeLineColorRed:(UIButton *)sender

{
    
    UIColor *newColor = sender.backgroundColor;
    
    [scribbleView setLineColor:newColor];
    
    
    NSLog(@"change to Red");
}


-(void)changeLineColorBlue:(UIButton *)sender
{
    UIColor *newColor = sender.backgroundColor;
    
    [scribbleView setLineColor:newColor];
    
    NSLog(@"change to Blue");
    
}



-(void)changeLineColorGreen:(UIButton *)sender
{
    UIColor *newColor = sender.backgroundColor;
    
   [scribbleView setLineColor:newColor];

    NSLog(@"change to Green");
}





//-(void)changeLineColor:(UIButton *)sender
//{
//    UIColor *newColor = sender.backgroundColor;
//    
//    [(DLAStageScribble*)(self.view) setLineColor:newColor];
//    
//    NSLog(@"change to Green");
//
//    
//}

//-(void)undoLastMove
//{
//    
//    [scribbles removeLastObject];
//    
//}



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
