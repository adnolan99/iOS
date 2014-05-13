//
//  TDLSingleton.h
//  To Do
//
//  Created by Austin Nolan on 5/6/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDLSingleton : NSObject

+ (TDLSingleton *)sharedSingleton;

-(void)addListItem:(NSDictionary *)listitem;
-(void)removeListItem:(NSDictionary *)listItem;
-(void)removeListItemAtIndex: (NSInteger)index;

-(NSArray *)allListItems;


@end
