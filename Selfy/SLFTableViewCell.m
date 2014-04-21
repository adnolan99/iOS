//
//  SLFTableViewCell.m
//  Selfy
//
//  Created by Austin Nolan on 4/21/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "SLFTableViewCell.h"

@implementation SLFTableViewCell

{
    UILabel * userId;
    UILabel * caption;
    UIImageView * userAvatar;
    UIImageView * otherImage;
    
    
    
}




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
        
        
        
        
        userId = [[UILabel alloc] initWithFrame:(CGRectMake(50, 20, 100, 30))];
        userId.textColor = [UIColor darkGrayColor];
        userId.font = [UIFont systemFontOfSize:22];
        [self.contentView addSubview:userId];
        
        
        caption = [[UILabel alloc] initWithFrame:CGRectMake(200, 20, 100, 30)];
        caption.textColor = [UIColor blackColor];
        caption.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:caption];
        
        userAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 75, 75)];
        [self.contentView addSubview:userAvatar];
        
        
        
        //otherImage

        
        
        
        
    
    }
    return self;
}


-(void)setProfile:(NSDictionary *)profile
{
    
    NSURL * imageUrl = [NSURL URLWithString:profile[@"avatar"]];
    NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage * image = [UIImage imageWithData:imageData];
    userAvatar.image = image;
    
    userId.text = profile[@"USER_ID"];
    caption.text = profile[@"caption"];
    //userAvatar.image = [UIImage imageWithData:profile[@"avatar"]];
    
    _profile = profile;
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
