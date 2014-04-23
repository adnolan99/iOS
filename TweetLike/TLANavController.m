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
{
    
    
    UIButton * addNewButton;
    
    UIView * blueBox;
    
    UITextField * tweetText;
    
    UIImageView * tweetLikeLogo;
    
    UIButton * submitButton;
    
    UIButton * cancelButton;
    
    UIView * newForm;
}


- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    
    self = [super initWithRootViewController:rootViewController];
    
    if (self)
    {
        
//        self.navigationBar.barTintColor = [UIColor blueColor];
        
        
        blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
        blueBox.backgroundColor = [UIColor blueColor];
        
        [self.view addSubview:blueBox];
        
        newForm = [[UIView alloc] initWithFrame:self.view.frame];
        newForm.backgroundColor = [UIColor clearColor];
        
        [blueBox addSubview:newForm];
        
        addNewButton = [[UIButton alloc] initWithFrame:CGRectMake(85, 10, 150, 30)];
        addNewButton.backgroundColor = [UIColor orangeColor];
        addNewButton.layer.cornerRadius = 15;
        [addNewButton setTitle:@"Add New" forState:UIControlStateNormal];
        [addNewButton addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];
        
        [blueBox addSubview:addNewButton];
    
        tweetText = [[UITextField alloc] initWithFrame:CGRectMake(30, 180, 260, 150)];
        tweetText.backgroundColor = [UIColor whiteColor];
        tweetText.textColor = [UIColor blueColor];
        tweetText.layer.cornerRadius = 20;
        
        tweetLikeLogo = [[UIImageView alloc] initWithFrame:CGRectMake(30, 70, 260, 70)];
        tweetLikeLogo.image = [UIImage imageNamed:@"tweetLikeLogo"];
        
        submitButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 350,120, 20)];
        submitButton.backgroundColor = [UIColor greenColor];
        [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
        submitButton.layer.cornerRadius = 10;

        cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(170, 350, 120, 20)];
        cancelButton.backgroundColor = [UIColor redColor];
        [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        cancelButton.layer.cornerRadius = 10;
        [cancelButton addTarget:self action:@selector(cancelEntry) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        // custom
    }
    
    return self;
}


- (void)newItem: (UIButton *)sendor
{
    
    [UIView animateWithDuration:0.4 animations:^{
        blueBox.frame = self.view.frame;
    } completion:^(BOOL finished){
        
    }];
    
  
    
    //[self.navigationBar addSubview:blueBox];
    
    //[blueBox addSubview:newForm];
    
    addNewButton.alpha = 0.0;
    
    [newForm addSubview:tweetText];
    
    [newForm addSubview:tweetLikeLogo];
    
    [newForm addSubview:submitButton];
    
    [newForm addSubview:cancelButton];
    
}


- (void)cancelEntry
{
    
    [UIView animateWithDuration:0.4 animations:^{
        blueBox.frame = self.navigationBar.frame;
    } completion:^(BOOL finished){
        
    }];
    
    //blueBox.frame = self.navigationBar.frame;

    //[blueBox removeFromSuperview];
    
    addNewButton.alpha = 1.0;

    
    [cancelButton removeFromSuperview];
    
    [submitButton removeFromSuperview];
    
    [tweetLikeLogo removeFromSuperview];
    
    [tweetText removeFromSuperview];
    
    
    
    //[self.view addSubview:self.navigationBar];
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

- (BOOL)prefersStatusBarHidden { return YES; }

@end
