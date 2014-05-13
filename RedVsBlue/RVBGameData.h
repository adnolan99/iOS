//
//  RVBGameData.h
//  RedVsBlue
//
//  Created by Austin Nolan on 5/7/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RVBGameData : NSObject

+ (RVBGameData *)gameData;

@property (nonatomic) NSInteger redScore;
@property (nonatomic) NSInteger blueScore;
@property (nonatomic) NSInteger totalScore;


@end
