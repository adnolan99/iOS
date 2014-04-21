//
//  TIAViewController.h
//  TweetIt
//
//  Created by Austin Nolan on 4/21/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TIAViewController : UIViewController




@property (nonatomic) NSDictionary * tweet;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;



@end
