//
//  PNAWorldViewController.h
//  Pixel Noise App
//
//  Created by Austin Nolan on 5/5/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>

@interface PNAWorldViewController : UIViewController

@property (nonatomic) AVAudioPlayer * player;

-(void)playSoundWithName: (NSString *)soundName;



@end
