//
//  STABigSmileyVC.m
//  Status
//
//  Created by Austin Nolan on 5/19/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "STABigSmileyVC.h"

#import "STASmileyViewController.h"

#import "STAViewController.h"

#import "STTwitter.h"



@interface STABigSmileyVC ()


@property (nonatomic) BOOL pressed;

@end

@implementation STABigSmileyVC
{
    
    UIImageView * bigSmiley;
    
    UIButton * facebookButton;
    
    UIButton * twitterButton;
    
    UIButton * googlePlus;
    
    UIButton * check;
    
    UIButton * arrowBack;
    
    
    STTwitterAPI * twitter;
    
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        check = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT -100, 100, 100)];
        
        [check setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
        
        
        [check addTarget:self action:@selector(postTweet) forControlEvents:UIControlEventTouchUpInside];
        
       
        
        arrowBack = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 6, SCREEN_HEIGHT -100, 100, 100)];
        
        [arrowBack setImage:[UIImage imageNamed:@"arrowLeft"] forState:UIControlStateNormal];
        
        
        [arrowBack addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.view addSubview:check];
        
        [self.view addSubview:arrowBack];


        
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    bigSmiley = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 100, 150, 200, 200)];
//
//    [bigSmiley setImage:[UIImage imageNamed:@"big_smilie"]];
    
    [self displayBigSmiley];
    
    
    [self.view addSubview:bigSmiley];
    
    
    facebookButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 200, 50, 50, 50)];
    
    _pressed = NO;
    
    [facebookButton setImage:[UIImage imageNamed:@"sm_facebook_g"]forState:UIControlStateNormal];

    [facebookButton addTarget:self action:@selector(selectFacebook) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:facebookButton];
    
    
    twitterButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 125, 50, 50, 50)];

    _pressed = NO;
    
    [twitterButton setImage:[UIImage imageNamed:@"sm_twitter_g"]forState:UIControlStateNormal];

    [twitterButton addTarget:self action:@selector(selectTwitter) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:twitterButton];
    
    
//    googlePlus = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 100, 50, 50, 50)];
//    
//    [googlePlus setImage:[UIImage imageNamed:@"sM_google"] forState:UIControlStateNormal];
//    
//    [self.view addSubview:googlePlus];
    
    
    self.navigationController.navigationBarHidden = NO;

    
    
    
    

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayBigSmiley
{
    
//    bigSmiley = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 100, 150, 200, 200)];
//    
//    [bigSmiley setImage:[UIImage imageNamed:@"big_smilie"]];
//    
//    [self.view addSubview:bigSmiley];
    
    bigSmiley = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 100, 150, 200, 200)];

    
    
    
    
    
    [bigSmiley setImage:passThroughSmileyFace];
    
    [self.view addSubview:bigSmiley];
}




-(void)selectFacebook
{
    if (_pressed == NO)
    {
        _pressed = YES;
        [facebookButton setImage:[UIImage imageNamed:@"sm_facebook"]forState:UIControlStateNormal];
    }
    else
    {
        _pressed = NO;
        [facebookButton setImage:[UIImage imageNamed:@"sm_facebook_g"]forState:UIControlStateNormal];
    }
    
}

-(void)selectTwitter
{
    
    
    if (_pressed == NO)
    {
        _pressed = YES;
        [twitterButton setImage:[UIImage imageNamed:@"sm_twitter"]forState:UIControlStateNormal];
    }
    else
    {
        _pressed = NO;
        [twitterButton setImage:[UIImage imageNamed:@"sm_twitter_g"]forState:UIControlStateNormal];
    }

    twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];
    [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
        NSLog(@"%@", username);
    } errorBlock:^(NSError *error) {
        NSLog(@"%@", error.userInfo);
    }];

}



-(void)postTweet
{
    
    [twitter postStatusUpdate:nil inReplyToStatusID:nil latitude:nil longitude:nil placeID:nil displayCoordinates:nil trimUser:nil successBlock:^(NSDictionary *status) {
        NSLog(@"%@", status);
    } errorBlock:^(NSError *error) {
        NSLog(@"%@", error.userInfo);
    }];
}

-(void)goBack

{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    
    //[self.navigationController popToViewController:[array objectAtIndex:1] animated:YES];
    
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
