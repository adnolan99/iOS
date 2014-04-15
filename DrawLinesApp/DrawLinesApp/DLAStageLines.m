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
    NSMutableArray * lines;
    
    UIButton * undoButton;
    
    UIButton * clearButton;

}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        lines = [@[] mutableCopy];
        
        
//        undoButton = [[UIButton alloc] initWithFrame: CGRectMake(10, 10, 100, 20)];
//        
//        
//        [undoButton addTarget:self
//        
//        
//        [self addSubview:undoButton];
        
        
        
    }
    return self;
}



//-(void)undoLastMove
//{
//
//    
//
//}





- (void)drawRect:(CGRect)rect
{
 
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    [[UIColor redColor]set];
    
    CGContextSetLineWidth(context, 10.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    
    for (NSArray * line in lines)
    {
     
        CGPoint start = [line[0] CGPointValue];
        CGPoint end = [line[1] CGPointValue];
        
        CGContextMoveToPoint(context, start.x, start.y);

        CGContextAddLineToPoint(context, end.x, end.y);
        

        CGContextStrokePath(context);

    }
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        
        [lines addObject:[@[
                            [NSValue valueWithCGPoint:location],
                            [NSValue valueWithCGPoint:location],
                            ] mutableCopy]];
        
        
        
        
        NSLog(@"Touches X : %f Y %f,",location.x,location.y);

    
        [self setNeedsDisplay];

        
    }
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [lines lastObject][1] = [NSValue valueWithCGPoint:location];
        
        
        
        NSLog(@"Touches X : %f Y %f,",location.x,location.y);
    }
    
    [self setNeedsDisplay];

}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        
        [lines lastObject][1] = [NSValue valueWithCGPoint:location];

        
        NSLog(@"Touches X : %f Y %f,",location.x,location.y);
    }
    
    
    [self setNeedsDisplay];

}



@end
