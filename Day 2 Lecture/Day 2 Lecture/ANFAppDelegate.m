//
//  ANFAppDelegate.m
//  Day 2 Lecture
//
//  Created by Austin Nolan on 4/1/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "ANFAppDelegate.h"

#import "ANFRootViewController.h"

@implementation ANFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions


{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[ANFRootViewController alloc] init];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}





@end
