//
//  TIAViewController.m
//  TweetIt
//
//  Created by Austin Nolan on 4/21/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TIAViewController.h"

@interface TIAViewController ()



@end

@implementation TIAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    self.nameLabel.text = self.tweet[@"name"];
    self.tweetLabel.text = self.tweet[@"text"];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
