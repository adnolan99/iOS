//
//  DLAStage.m
//  DrawLinesApp
//
//  Created by Austin Nolan on 4/15/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "DLAStageLines.h"

@implementation DLAStageLines

{
    
    UIButton * undoButton;
    
    UIButton * clearButton;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.lines = [@[] mutableCopy];
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [[UIColor redColor]set];
    
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    [self.lineColor set];
    
    for (NSDictionary * line in self.lines)
    {
        CGContextSetLineWidth(context, [line[@"width"]floatValue]);
        
        [(UIColor *)line[@"color"] set];
        
        CGPoint start = [line[@"points"][0] CGPointValue];
        CGPoint end = [line[@"points"][1] CGPointValue];
        
        CGContextMoveToPoint(context, start.x, start.y);

        CGContextAddLineToPoint(context, end.x, end.y);
        
        CGContextStrokePath(context);
    }
}

-(void)clearStage
{
    [self.lines removeAllObjects];
    
    [self setNeedsDisplay];
}


-(void)undo
{
    [self.lines removeLastObject];
    
    [self setNeedsDisplay];
}






-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
//        [self.lines addObject:[@[
//                            [NSValue valueWithCGPoint:location],
//                            [NSValue valueWithCGPoint:location],
//                            ] mutableCopy]];
        
        [self.lines addObject:[@{
                                @"color" : self.lineColor,
                                @"width" : @(self.lineWidth),
                                @"points" :[@[[NSValue valueWithCGPoint:location],
                                              [NSValue valueWithCGPoint:location]
                                              ]mutableCopy]
                                } mutableCopy]];
        
        NSLog(@"Touches X : %f Y %f,",location.x,location.y);

        [self setNeedsDisplay];
    }
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [self.lines lastObject][@"points"][1] = [NSValue valueWithCGPoint:location];
        
        NSLog(@"Touches X : %f Y %f,",location.x,location.y);
    }
    [self setNeedsDisplay];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [self.lines lastObject][@"points"][1] = [NSValue valueWithCGPoint:location];

        NSLog(@"Touches X : %f Y %f,",location.x,location.y);
    }
    [self setNeedsDisplay];
}

@end
