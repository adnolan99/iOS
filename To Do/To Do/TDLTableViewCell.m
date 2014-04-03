//
//  TDLTableViewCell.m
//  To Do
//
//  Created by Austin Nolan on 4/3/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TDLTableViewCell.h"


@implementation TDLTableViewCell

//Synthesization happens behind the scenes with an @property
@synthesize profileInfo=_profileInfo;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
    
    }
    return self;
}


- (NSDictionary *)profileInfo
{
    if (_profileInfo == nil)
    {
        _profileInfo = @{@"name":@"Default Name",@"image":[UIImage imageNamed:@"default"]};
    
    }
    return _profileInfo;
}



-(void)setProfileInfo:(NSDictionary *)profileInfo
{
 if(profileInfo != nil) _profileInfo = profileInfo;
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
