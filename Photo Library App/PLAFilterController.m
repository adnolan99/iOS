//
//  PLAFilterController.m
//  Photo Library App
//
//  Created by Austin Nolan on 5/1/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "PLAFilterController.h"

@interface PLAFilterController ()



@property (nonatomic) NSString * currentFilter;


@end

@implementation PLAFilterController

{
    
    UIScrollView * scroller;
    NSArray * filterNames;
    NSMutableArray * filterButtons;
    
    
    float wh;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 75)];
        
        scroller.backgroundColor = [UIColor blackColor];
        
        //scroller.contentSize = CGSizeMake(2000, 100);
        scroller.scrollEnabled = YES;
        
        
        
        
        filterButtons =[@[] mutableCopy];
        filterNames = @[
                        
                        @"CIPhotoEffectTonal",
                        @"CIPhotoEffectTransfer",
                        @"CISepiaTone",
                        @"CIVignette",
                        @"CIVignetteEffect"
                        ];
        
        
        [self.view addSubview:scroller];
        
        // Custom initialization
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    
    wh = self.view.frame.size.height - 20;
    
    
    for(NSString * filterName in filterNames)
    {
        int i = (int)[filterNames indexOfObject:filterName];
        
        int x = (wh + 10) * i + 10;
        
        UIButton * filterButton = [[UIButton alloc] initWithFrame:CGRectMake(x, 10, 80, 80)];
        filterButton.tag = i;
        filterButton.backgroundColor = [UIColor clearColor];
        
        [filterButton addTarget:self action:@selector(switchFilter:) forControlEvents:UIControlEventTouchUpInside];
        [filterButtons addObject:filterButton];
        
        [scroller addSubview:filterButton];
        
    }
    
    
    NSLog(@"%d",(int)self.view.frame.size.height);
    
    scroller.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    
    scroller.contentSize = CGSizeMake((wh + 10) * [filterNames count] + 10, self.view.frame.size.height);
    [super viewDidLoad];

    
    // Do any additional setup after loading the view.
}

//
//- (void)setImageToFilter:(UIImage *)imageToFilter
//{
//    
//    _imageToFilter = imageToFilter;
//    
//    for (UIButton * filterButton in filterButtons)
//    {
//        NSString * filterName = [filterNames objectAtIndex:filterButton.tag];
//        
//        
//        UIImage * smallImage = [self shrinkImage:imageToFilter maxWH:wh];
//        
//        UIImage * image = [self filterImage:smallImage filterName:filterName];
//        
//        [filterButton setImage:image forState:UIControlStateNormal];
//        filterButton.contentMode = UIViewContentModeScaleAspectFill;
//    }
//    
//    
//    
//}


//What does this method do?


- (UIImage *)filterImage:(UIImage *)image filterName:(NSString *) filterName
{
    
    CIImage * ciImage = [CIImage imageWithCGImage:image.CGImage];
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    
    [filter setValue:ciImage forKeyPath:kCIInputImageKey];
    
    CIContext * ciContext = [CIContext contextWithOptions:nil];
    
    CIImage * ciResult = [filter valueForKeyPath:kCIOutputImageKey];
    
    return [UIImage imageWithCGImage: [ciContext createCGImage:ciResult fromRect:[ciResult extent]]];
    
}





-(void)switchFilter:(UIButton *)filterButton
{
    
    
    self.currentFilter = [filterNames objectAtIndex:filterButton.tag];
    
    NSLog(@"%@", self.currentFilter);
    
    UIImage * shrinkedImage = [self shrinkImage:self.imageToFilter maxWH:320];

    
    UIImage * image = [self filterImage:shrinkedImage filterName:self.currentFilter];

    [self.delegate updateCurrentImageWithFilteredImage:image];
//     
//     
//     
//     [UIImage imageWithCGImage:[self filterImage:[self shrinkImage:self.imageToFilter maxWH:320 * 2] filterName:self.currentFilter]]];
//    
    
}

-(UIImage *)shrinkImage:(UIImage *)image maxWH:(int)widthHeight
{
    CGSize size = CGSizeMake(widthHeight, widthHeight / image.size.width * image.size.height);
    
    
    if(image.size.height < image.size.width)
    {
        size = CGSizeMake(widthHeight / image.size.height * image.size.width, widthHeight);
    }
    
  
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage * destImage =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return destImage;
    
}


- (void)setImageToFilter:(UIImage *)imageToFilter
{
    
    _imageToFilter = imageToFilter;
    
    for (UIButton * filterButton in filterButtons)
    {
        NSString * filterName = [filterNames objectAtIndex:filterButton.tag];
        
        
        //UIImage * smallImage = [self shrinkImage:imageToFilter maxWH:wh];
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long) NULL), ^{
           
            
           
            UIImage * smallImage = [self shrinkImage:imageToFilter maxWH:wh];
            UIImage * image = [self filterImage:smallImage filterName:filterName];

            dispatch_async(dispatch_get_main_queue(), ^(void){
            
           [filterButton setImage:image forState:UIControlStateNormal];
           filterButton.contentMode = UIViewContentModeScaleAspectFill;
            });
        });
    }
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
