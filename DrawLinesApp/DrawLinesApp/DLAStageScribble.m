//
//  DLAStageScribble.m
//  DrawLinesApp
//
//  Created by Austin Nolan on 4/15/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "DLAStageScribble.h"

@implementation DLAStageScribble




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.lines = [@[] mutableCopy];
        
        self.backgroundColor = [UIColor whiteColor];
        self.lineWidth = 2.0;
        self.lineColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    }
    return self;
}

/* Afternoon work,
 1. Add properties to the UI view:
  -integer value line width
  -line color
 2. In View controller add subview
    - UISlider -changes line width on UIView
    -3 buttons - should change line color property based on color of button
 3. Override setter method inside of UIView subclass. Run self set needs display after the color changes and the line width changes (automatic method)
 self.lineWidth property, self.color property.
*/


- (void)drawRect:(CGRect)rect
{
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
    
    
    for (NSDictionary * scribble in self.lines)
    {
        CGContextSetLineWidth(context, [scribble[@"width"]floatValue]);
        
        [(UIColor *)scribble[@"color"] set];
        
        NSArray * points = scribble[@"points"];
        
        CGPoint start = [points[0] CGPointValue];
        
        //CGPoint start = [scribble[0] CGPointValue];
        
        CGContextMoveToPoint(context, start.x, start.y);
        
            for (NSValue * value in points)
        {
            
            CGPoint point = [value CGPointValue];
            
            
                CGContextAddLineToPoint(context, point.x, point.y);
        }
        
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



-(void)setLineWidth:(float)lineWidth;
{
    _lineWidth = lineWidth;
    
    [self setNeedsDisplay];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    for (UITouch * touch in touches)
        
         {
             CGPoint location = [touch locationInView:self];
             
//             [self.lines addObject:[@[
//                                    [NSValue valueWithCGPoint:location]
//                                    ] mutableCopy]];
             [self.lines addObject:[@{
                                     @"color" : self.lineColor,
                                     @"width" : @(self.lineWidth),
                                     @"points" :[@[[NSValue valueWithCGPoint:location]] mutableCopy]
                                                  } mutableCopy]];
             
             
             [self setNeedsDisplay];
         }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        //[[self.lines lastObject] addObject:[NSValue valueWithCGPoint:location]];
        
        [[self.lines lastObject][@"points"] addObject:[NSValue valueWithCGPoint:location]];

        [self setNeedsDisplay];
    
    }
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
    
        //[[self.lines lastObject] addObject:[NSValue valueWithCGPoint:location]];
        
        [[self.lines lastObject][@"points"] addObject:[NSValue valueWithCGPoint:location]];


        [self setNeedsDisplay];
        
    }
        
}

-(void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    
    [self setNeedsDisplay];
}

@end
    
