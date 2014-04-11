//
//  SCGCircle.h
//  Squares
//
//  Created by Austin Nolan on 4/11/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SCGCircle.h"

@protocol SCGCircleDelegate;

@interface SCGCircle : UIView

@property (nonatomic,assign) id<SCGCircleDelegate> delegate;

@property (nonatomic) CGPoint position;

@end



@protocol SCGCircleDelegate <NSObject>

- (UIColor *)circleTappedWithPosition: (CGPoint)position;

@end