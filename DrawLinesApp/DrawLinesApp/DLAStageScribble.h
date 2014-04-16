//
//  DLAStageScribble.h
//  DrawLinesApp
//
//  Created by Austin Nolan on 4/15/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLAStageScribble : UIView

@property (nonatomic) UIColor * lineColor;
@property (nonatomic) float lineWidth;
@property(nonatomic) NSMutableArray * lines;

-(void)clearStage;
-(void)undo;

@end
