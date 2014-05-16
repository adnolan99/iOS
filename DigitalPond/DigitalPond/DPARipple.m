//
//  DPARipple.m
//  DigitalPond
//
//  Created by Austin Nolan on 5/14/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "DPARipple.h"

@implementation DPARipple

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)didMoveToWindow
{
    for (int i = 0; i < self.rippleCount; i++)
    {
        float delayAmoiunt = (self.rippleLifeTime/self.rippleCount) * i;
        [self rippleLineWithDelay:delayAmoiunt];
    }
}


-(void)rippleLineWithDelay:(float)delay
{
    
    UIView * rippleLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    rippleLine.backgroundColor = self.tintColor; //[UIColor colorWithWhite:0.5 alpha:0.5];
    
    [self addSubview:rippleLine];
    
    [UIView animateWithDuration:self.rippleLifeTime delay:delay options:UIViewAnimationOptionCurveEaseOut animations:^{
        rippleLine.frame = CGRectMake(-40, -40, 80, 80);
    }
    completion:^(BOOL finished)
    {
        [rippleLine removeFromSuperview];
    }];
     
     }


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
