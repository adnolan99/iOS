//
//  PNAPixelSounds.h
//  Pixel Noise App
//
//  Created by Austin Nolan on 5/5/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AVFoundation/AVFoundation.h>

@interface PNAPixelSounds : NSObject <AVAudioPlayerDelegate>

@property (nonatomic) AVAudioPlayer * player;

-(void)playSoundWithName: (NSString *)soundName;

-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player;

@end
