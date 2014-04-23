//
//  TLANavController.m
//  TweetLike
//
//  Created by Austin Nolan on 4/23/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TLANavController.h"

@interface TLANavController ()

@end

@implementation TLANavController



- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    
    self = [super initWithRootViewController:rootViewController];
    
    if (self)
    {
        
        self.navigationBar.barTintColor = [UIColor blueColor];
        
        UIButton * addNewButton = [[UIButton alloc] initWithFrame:CGRectMake(85, 30, 150, 30)];
        addNewButton.backgroundColor = [UIColor orangeColor];
        addNewButton.layer.cornerRadius = 15;
        [addNewButton setTitle:@" forState:<#(UIControlState)#>]
        [self.view addSubview:addNewButton];
    
        
        
        // custom
    }
    
    return self;
}






- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
