//
//  PLAFilterController.h
//  Photo Library App
//
//  Created by Austin Nolan on 5/1/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PLAFilterControllerDelegate;


@interface PLAFilterController : UIViewController

@property (nonatomic, assign) id<PLAFilterControllerDelegate> delegate;

@property (nonatomic) UIImage * imageToFilter;

@end

@protocol PLAFilterControllerDelegate <NSObject>

-(UIImage *)getFilterImage;


-(void)updateCurrentImageWithFilteredImage:(UIImage *)image;


@end
