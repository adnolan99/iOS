//
//  STASmileyViewController.m
//  Status
//
//  Created by Austin Nolan on 5/19/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "STASmileyViewController.h"

#import "STABigSmileyVC.h"

#import "STAViewController.h"

@interface STASmileyViewController ()

@end

@implementation STASmileyViewController
{
    UIButton * arrow;
    
    STABigSmileyVC * bigSmileyView;
    
    NSArray * yellowSmiliesArray;

    NSArray * redSmiliesArray;

    NSArray * chooseAnArray;
    
    UIImageView * highlight;
    
    int faceTag;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        arrow = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT -100, 100, 100)];
        
        [arrow setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        
        
        [arrow addTarget:self action:@selector(pushToBigSmiley) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        yellowSmiliesArray = @[ @"smilies_1", @"smilies_2", @"smilies_3", @"smilies_4", @"smilies_5", @"smilies_6", @"smilies_7", @"smilies_8", @"smilies_9",
                    ];
        
        
        redSmiliesArray = @[ @"angry_1",@"angry_2",@"angry_3",@"angry_4",@"angry_5",@"angry_6",@"angry_7",@"angry_8",@"angry_9",
                             ];
        
        chooseAnArray = @[
                          yellowSmiliesArray,
                          redSmiliesArray,
                          yellowSmiliesArray,
                          yellowSmiliesArray,
                          yellowSmiliesArray,
                          yellowSmiliesArray,
                          yellowSmiliesArray,
                          yellowSmiliesArray,
                          yellowSmiliesArray,
                           ];
        
        
        
        [self.view addSubview:arrow];

        
        [self createSmileySquareFrames:yellowSmiliesArray];
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}



-(void)pushToBigSmiley
{
    bigSmileyView = [[STABigSmileyVC alloc]initWithNibName:nil bundle:nil];
    
    bigSmileyView.view.backgroundColor = [UIColor whiteColor];

    
    [self.navigationController pushViewController:bigSmileyView animated:YES];
    
    self.navigationController.navigationBarHidden = NO;
    

}




-(void)createSmileySquareFrames:(NSArray *)array
{
    
    int csfCols = 3;
    int csfRows = 3;
    
    float csfWidth = 64;
    float csfHeight = 64;
    
    for (int c =0; c < csfCols; c++)
    {
        for (int r = 0; r < csfRows; r++)
        {
            float csfX = ((csfWidth + 10)*c) + (SCREEN_WIDTH / 6);
            float csfY = ((csfHeight + 10)*r) + (SCREEN_HEIGHT /5);
            
            
            
            
            UIButton * ssFrame = [[UIButton alloc]initWithFrame:CGRectMake(csfX, csfY, csfWidth, csfHeight)];
            ssFrame.tag = (r * csfCols) + c;
            
            [ssFrame addTarget:self action:@selector(chooseFace:) forControlEvents:UIControlEventTouchUpInside];

            
            
            //ssFrame.highlighted = NO;
            
            int index = (r * csfCols) + c;
            
            //faceTag = index;
            
            
            
            //ssFrame setImage:[UIImage imageNamed:yellowSmiliesArray[index]] forState:UIControlStateNormal];

            [ssFrame setImage:[UIImage imageNamed:chooseAnArray[passColorTag][index]] forState:UIControlStateNormal];
                               
            [self.view addSubview:ssFrame];
        }
    }
    
    highlight = [[UIImageView alloc]initWithFrame:CGRectMake(-8, -8, 80, 80)];
    
    highlight.image = [UIImage imageNamed:@"squares"];



}



//[ssFrame setImage:[UIImage imageNamed:chosenArray [[(r * csfCols) + c][(r * csfCols) + c]]] forState:UIControlStateNormal];

-(void)chooseFace:(UIButton *)sender
{
    faceTag = sender.tag;

    [sender insertSubview:highlight atIndex:0];

    UIImageView * selectedSmileyFace = [[UIImageView alloc] init];
    
    [selectedSmileyFace setImage:[UIImage imageNamed:chooseAnArray[passColorTag][faceTag]]];


    passThroughSmileyFace = selectedSmileyFace.image;
    
    
    NSLog(@" This is the ColorTag %d", passColorTag);
    NSLog(@"This is the FaceTag %d", faceTag);

    NSLog(@"This is the sender.tag %d", sender.tag);

    
    
    //chooseAnArray[passButtonTag][index]] = tempArray;
    
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
