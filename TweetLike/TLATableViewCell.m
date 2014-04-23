//
//  TLATableViewCell.m
//  TweetLike
//
//  Created by Austin Nolan on 4/23/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TLATableViewCell.h"

@implementation TLATableViewCell

{
    UILabel * textLabel;

    UILabel * likesLabel;

    
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        UIImageView * heart = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 20, 20)];
        
        
        heart.image = [UIImage imageNamed:@"heart"];
        
        [self.contentView addSubview:heart];
        
        
        
        likesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        likesLabel.textColor = [UIColor purpleColor];
        likesLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:likesLabel];
        
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 10, 100, 50)];
        textLabel.text = @"Some text will go here that will be really long and wrap around something.";
        textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        textLabel.numberOfLines = 0;

        [self.contentView addSubview:textLabel];

        
        //self.tableView.rowHeight = 80;
        
    }
    return self;
}


- (void)setTweet:(NSDictionary *)tweet
{
    
    
    _tweet = tweet;
    
    likesLabel.text = [tweet[@"likes"] stringValue];
    textLabel.text = tweet[@"text"];
    
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
