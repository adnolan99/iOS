//
//  TLATableViewController.h
//  TweetLike
//
//  Created by Austin Nolan on 4/23/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TLATableViewController : UITableViewController


@property (nonatomic,getter = isTweetItemsEmpty,readonly) BOOL tweetItemsEmpty;

@property (nonatomic) NSMutableArray * tweetItems;

-(void)createNewTweet:(NSString *) tweets;


@end
