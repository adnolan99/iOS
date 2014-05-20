//
//  TDLAppDelegate.m
//  To Do
//
//  Created by Austin Nolan on 4/2/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TDLAppDelegate.h"
#import "TDLMainViewController.h"
#import "TDLTableViewController.h"

@implementation TDLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

//    
//    TDLTableViewController * rootViewController = [[TDLTableViewController alloc] initWithStyle:UITableViewStylePlain];
//    
//    UINavigationController * navController = [[UINavigationController alloc] initWithNibName:nil bundle:nil];

    
    
    
    
    
    TDLTableViewController * rootViewController = [[TDLTableViewController alloc] initWithStyle:UITableViewStylePlain];

    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];

    self.window.rootViewController = navController;

    
    
    
    
    
    
    self.window.backgroundColor = [UIColor colorWithRed:153/255.0 green:178/255.0 blue:183/255.0 alpha:1.0];
    
    [self.window makeKeyAndVisible];
    return YES;
    
    
    
    
}






@end
