//
//  RVBFirstViewController.h
//  RedVsBlue
//
//  Created by Austin Nolan on 5/7/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RVBFirstViewControllerDelegate;

@interface RVBFirstViewController : UIViewController

-(void)displayBlueTeamScore;
-(void)displayRedTeamScore;


@end
