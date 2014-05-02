//
//  TLANavController.m
//  TweetLike
//
//  Created by Austin Nolan on 4/23/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TLANavController.h"


#import "TLATableViewController.h"

@interface TLANavController () <UITextViewDelegate>

@end

@implementation TLANavController
{
    
    
    UIButton * addNewButton;
    
    UIView * blueBox;
    
    UITextView * tweetText;
    
    UIImageView * tweetLikeLogo;
    
    UIButton * submitButton;
    
    UIButton * cancelButton;
    
    UIView * newForm;
    
    TLATableViewController * TVC;
    
    
}


- (void)keyboardReturn
{
    [tweetText resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(0, 0, 320, self.view.frame.size.height);
    }];
    

}


-(BOOL)textViewShouldBeginEditing:(UITextView *) textView
{
    
    [UIView animateWithDuration:0.4 animations:^{
        newForm.frame = CGRectMake(0, -100, 320, self.view.frame.size.height);
     }];
    return YES;
}


-(void)textViewDidChange:(UITextView *)textView
{
    
}


- (void)newItem: (UIButton *)sendor
{
    
    [UIView animateWithDuration:0.4 animations:^{
        blueBox.frame = self.view.frame;
    } completion:^(BOOL finished){
        
    }];
    
  
    
    //[self.navigationBar addSubview:blueBox];
    
    [blueBox addSubview:newForm];
    
    addNewButton.alpha = 0.0;
    
}


- (void)cancelEntry
{
    [newForm removeFromSuperview];
    [UIView animateWithDuration:0.4 animations:^{
        blueBox.frame = self.navigationBar.frame;
    } completion:^(BOOL finished){
        
    }];
    
    //blueBox.frame = self.navigationBar.frame;

    //[blueBox removeFromSuperview];
    
    addNewButton.alpha = 1.0;

    newForm.frame = self.view.frame;
    
//    [cancelButton removeFromSuperview];
//    
//    [submitButton removeFromSuperview];
//    
//    [tweetLikeLogo removeFromSuperview];
//    
//    [tweetText removeFromSuperview];
//    
    
    
    //[self.view addSubview:self.navigationBar];
}




//Make Submit Button Work

-(void)submitEntry
{
//    if([tweetText.text isEqualToString:@""]) return;
//    [self cancelEntry];
//
//    [TVC.tweetItems insertObject:@{
//                                @"likes":@0,
//                                @"text": tweetText.text
//                                } atIndex:0];
//                                
    
    [TVC createNewTweet: tweetText.text];
    
    tweetText.text = @"";
    
    [self cancelEntry];
    
    
//    {
//        NSString * tweet = tweetText.text;
//        tweetText.text = @" ";
//        if(![tweet isEqualToString:@""])
//        {
//            [tweetItems addObject:@{@"tweet":tweet,@"likes" : @int} atIndex:0];
//        }
//        
//        NSLog(@"%@",);
//        [self.tableView reloadData];
//    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
    blueBox.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:blueBox];
    
    newForm = [[UIView alloc] initWithFrame:self.view.frame];
    newForm.backgroundColor = [UIColor clearColor];
    
//    [blueBox addSubview:newForm];
    
    addNewButton = [[UIButton alloc] initWithFrame:CGRectMake(85, 10, 150, 30)];
    addNewButton.backgroundColor = [UIColor orangeColor];
    addNewButton.layer.cornerRadius = 15;
    [addNewButton setTitle:@"Add New" forState:UIControlStateNormal];
    [addNewButton addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [blueBox addSubview:addNewButton];
    
    tweetText = [[UITextView alloc] initWithFrame:CGRectMake(30, 170, 260, 150)];
    tweetText.backgroundColor = [UIColor whiteColor];
    tweetText.textColor = [UIColor blueColor];
    tweetText.layer.cornerRadius = 20;
    tweetText.delegate = self;
    
    tweetLikeLogo = [[UIImageView alloc] initWithFrame:CGRectMake(30, 100, 260, 70)];
    tweetLikeLogo.image = [UIImage imageNamed:@"tweetLikeLogo"];
    
    submitButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 330,120, 20)];
    submitButton.backgroundColor = [UIColor greenColor];
    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    submitButton.layer.cornerRadius = 10;
    [submitButton addTarget:self action:@selector(submitEntry) forControlEvents:UIControlEventTouchUpInside];
    
    
    cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(170, 330, 120, 20)];
    cancelButton.backgroundColor = [UIColor redColor];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    cancelButton.layer.cornerRadius = 10;
    [cancelButton addTarget:self action:@selector(cancelEntry) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardReturn)];
    [self.view addGestureRecognizer:tap];

    
    
    [newForm addSubview:tweetText];
    
    [newForm addSubview:tweetLikeLogo];
    
    [newForm addSubview:submitButton];
    
    [newForm addSubview:cancelButton];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addTableViewController:(TLATableViewController *)viewController
{
    
    TVC = viewController;
    
    [self pushViewController:viewController animated:NO];
    
    if ([TVC isTweetItemsEmpty])
    {
        
        [self submitEntry];
    }
    
    
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
