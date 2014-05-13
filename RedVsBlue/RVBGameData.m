//
//  RVBGameData.m
//  RedVsBlue
//
//  Created by Austin Nolan on 5/7/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "RVBGameData.h"

@implementation RVBGameData


+ (RVBGameData *)gameData;
{
    
    static dispatch_once_t activate;
    static RVBGameData * singleton = nil;
    
    dispatch_once(&activate, ^{
       
        singleton = [[RVBGameData alloc] init];
    });
    return singleton;
}


- (NSInteger *)totalScore
{
    
   return _redScore + _blueScore;
    
    
}





@end
