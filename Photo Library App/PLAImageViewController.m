//
//  PLAImageViewController.m
//  Photo Library App
//
//  Created by Austin Nolan on 4/30/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "PLAImageViewController.h"

#import "PLAFilterController.h"

#import "HSBColorControlVC.h"

#import "ControlsViewController.h"

#import "BlurViewController.h"

@interface PLAImageViewController () <UINavigationControllerDelegate,  UIImagePickerControllerDelegate, PLAFilterControllerDelegate, HSBColorControlVCDelegate,ControlsViewControllerDelegate, BlurViewControllerDelegate>

@property (nonatomic) UIImage * originalImage;


@end

@implementation PLAImageViewController
{
    
    
    UIImageView * imageView;
    
    
    UIScrollView * scroller;
    
    
    UIView * footer;
    
    UIView * header;
    
    UIView * navBar;
    
    
    UIButton * whiteSquare;
    
    UIButton * libraryButton;
    
    UIImagePickerController * photoLibrary;
    
    
    
    HSBColorControlVC * hsbVC;
    
    BlurViewController * blurVC;
    
    PLAFilterController * filterVC;
    
    
    
    //UIView * picDisplay;
    
    //UIButton * fetchPic;

}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
        
        
        
        
        // Custom initialization
    }
    return self;
}


-(void)updateCurrentImageWithFilteredImage:(UIImage *)image
{
    imageView.image = image;
}

-(void)setOriginalImage:(UIImage *)originalImage
{
    
    _originalImage = originalImage;
    filterVC.imageToFilter = originalImage;
    imageView.image = originalImage;
}



- (void)viewDidLayoutSubviews
{
    [super viewDidLoad];
    
    
    
    imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    
    
    navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 560, 50)];
    
    navBar.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:navBar];
    
    
    
    libraryButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 20, 30, 30)];
    
    libraryButton.backgroundColor= [UIColor blackColor];
    
    [libraryButton addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    [navBar addSubview:libraryButton];
    
    
    footer = [[UIView alloc] initWithFrame:CGRectMake(0, 320, 320, 50)];
    
    footer.backgroundColor = [UIColor blackColor];
    
    footer.alpha = 0.2;
    
    [self.view addSubview:footer];
    
    
    hsbVC = [[HSBColorControlVC alloc] initWithNibName:nil bundle:nil];
    
    hsbVC.delegate = self;
    
    hsbVC.view.frame = CGRectMake(0, 380, 320 , 100);
    
    
    
    
    blurVC = [[BlurViewController alloc]initWithNibName:nil bundle:nil];
    
    blurVC.delegate = self;
    
    blurVC.view.frame = CGRectMake(0, 380, 320, 100);
    
    

    filterVC = [[PLAFilterController alloc] initWithNibName:nil bundle:nil];
    
    filterVC.delegate = self;
    
    filterVC.view.frame = CGRectMake(0, 380, 320 , 100);
    

    
//    scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 375, 320, 100)];
//    scroller.backgroundColor = [UIColor blackColor];
//    scroller.contentSize = CGSizeMake(2000, 100);
//    scroller.scrollEnabled = YES;
//    [self.view addSubview:scroller];
    
    
//    [self drawSquares];
    
    
    
    
    
    //[scroller addSubview:whiteSquare];

    
    
    //Below is waht I did, above is waht Jo did
//    header =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
//    
//    header.backgroundColor = [UIColor redColor];
//    
//    [self.view addSubview:header];
    
//    
//    fetchPic =[[UIButton alloc] initWithFrame:CGRectMake(110,25 , 100, 25)];
//    
//    fetchPic.backgroundColor = [UIColor blackColor];
//    [fetchPic setTitle:@"Get Pic" forState:UIControlStateNormal];
//    
//    [fetchPic addTarget:self action:@selector(getPic) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:fetchPic];
    
    
    // Do any additional setup after loading the view.
}


//below is where I made the white squares in a for loop
//-(void)drawSquares
//{
//    
//    for (int s = 0; s<= 20; s++)
//        
//    {
//        float squareX = ((80 + 10) * s);
//        
//        
//        whiteSquare = [[UIButton alloc] initWithFrame:CGRectMake(squareX, 10, 80, 80)];
//        
//        whiteSquare.backgroundColor = [UIColor whiteColor];
//        
//        
//        [scroller addSubview:whiteSquare];
//
//        
//    }
//}




-(void)choosePhoto
{
    
    NSLog(@"press");

    
    
    photoLibrary = [[UIImagePickerController alloc] init];
    
    photoLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    photoLibrary.allowsEditing = YES;
    photoLibrary.delegate = self;
    
    

    [self presentViewController:photoLibrary animated:YES completion:nil];
    
    
    

    
    /// below is my stuff, above is jo
//    UIImagePickerController * picker;
//    
//    picker = [[UIImagePickerController alloc] init];
//    
//    picker.delegate = self;
//
//    [self presentViewController:picker animated:YES completion:nil];
//
//    NSLog(@"Fetch");
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
   
    NSLog(@"%@",info);
    
    
    
    self.originalImage = info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:^{

    
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    
//    [self.view addSubview:imageView];
    
    
//    if (info[UIImagePickerControllerEditedImage] != nil)
    
        
        
//    imageView.image = info[UIImagePickerControllerOriginalImage];

        
        
        
    }];
    
    
    //// below is what I have, above is what jo put
//    picDisplay = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 320, self.view.frame.size.height -50)];
//    
//    picDisplay.backgroundColor = [UIColor greenColor];
//    
//    
//    [picDisplay addSubview:picker];
//
//    [self.view addSubview:picDisplay];
    
}

- (void)updateCurrentImageWithHSB: (UIImage * )image;
{
    
    
    hsbVC.currentImage = image;
    
    blurVC.imageToFilter = image;
    
    filterVC.imageToFilter = image;
    
}



-(void) selectHsbTool: (UIButton *) button2;
{
    [self.view addSubview:hsbVC.view];

}

-(void) selectBlurTool : (UIButton *) button3;
{
    [self.view addSubview:blurVC.view];

}

-(void) selectFilterTool: (UIButton *) button1;
{
    [self.view addSubview:filterVC.view];

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
