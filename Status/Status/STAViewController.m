//
//  STAViewController.m
//  Status
//
//  Created by Austin Nolan on 5/19/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "STAViewController.h"

#import "STASmileyViewController.h"

@interface STAViewController ()

//@property (nonatomic) NSMutableArray * colors;


@end

@implementation STAViewController
{
    
    UIButton * arrow;
    
    UIButton * csFrame;
    
    STASmileyViewController * smileyView;
    
    NSArray * colorsArray;
    
    UIImageView * highlight;
    
    
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        arrow = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT -100, 100, 100)];
        
        [arrow setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        
        
        [arrow addTarget:self action:@selector(pushToSmileys) forControlEvents:UIControlEventTouchUpInside];
        
        colorsArray = @[ @"colors_1", @"colors_2", @"colors_3", @"colors_4", @"colors_5", @"colors_6", @"colors_7", @"colors_8", @"colors_9",
                         ];
        
        [self.view addSubview:arrow];
        
        [self createColorSquareFrames:colorsArray];
    
        
        
        
        
        
        
        
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


-(void)pushToSmileys
{
    
    smileyView = [[STASmileyViewController alloc]initWithNibName:nil bundle:nil];
    
    smileyView.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:smileyView animated:YES];
    
    self.navigationController.navigationBarHidden = NO;
    


}

-(void)createColorSquareFrames:(NSArray *)array
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
            
            csFrame = [[UIButton alloc]initWithFrame:CGRectMake(csfX, csfY, csfWidth, csfHeight)];
            [csFrame addTarget:self action:@selector(pressColor:) forControlEvents:UIControlEventTouchUpInside];
            [csFrame setImage:[UIImage imageNamed:colorsArray[(r * csfCols) + c]] forState:UIControlStateNormal];

            //csFrame.highlighted = NO;
            
            
            csFrame.tag = (r * csfCols) + c;
            
            passColorTag = csFrame.tag;
            
            
            [self.view addSubview:csFrame];
        }
    }
    highlight = [[UIImageView alloc]initWithFrame:CGRectMake(-8, -8, 80, 80)];
    
    highlight.image = [UIImage imageNamed:@"squares"];
}


-(void)pressColor:(UIButton *)sender
{
    passColorTag = sender.tag;

    NSLog(@"%d", passColorTag);

    [sender insertSubview:highlight atIndex:0];
    
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
