//
//  Wheel.m
//  Car
//
//  Created by Austin Nolan on 4/1/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "Wheel.h"

@implementation Wheel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor blackColor];
        self.layer.cornerRadius = 20;
        
    }
    return self;
}



@end
