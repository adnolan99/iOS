//
//  TDLTableViewCell.m
//  To Do
//
//  Created by Austin Nolan on 4/3/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TDLTableViewCell.h"


@implementation TDLTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
    
    }
    return self;
}

-(void)setProfileInfo:(NSDictionary *)profileInfo
{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    
    imageView.image = profileInfo [@"image"];
    imageView.layer.cornerRadius = 30;
    imageView.layer.masksToBounds = YES;
    
    
    [self.contentView addSubview:imageView];
    
    _profileInfo = profileInfo;
}










- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
