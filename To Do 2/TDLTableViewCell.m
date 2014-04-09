//
//  TDLTableViewCell.m
//  To Do 2
//
//  Created by Austin Nolan on 4/8/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TDLTableViewCell.h"


UILabel * taskName;



@implementation TDLTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 15, self.frame.size.width - 20, 40)];
        
        self.bgView.layer.cornerRadius = 6;
        
        [self.contentView addSubview:self.bgView];
        
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 200, 300)];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:26];
        
        [self.contentView addSubview:self.nameLabel];
        // Initialization code
    }
    return self;
}


//-(void) setTaskInfo: (NSDictionary *) taskInfo;
//{
//    
//    taskName.text = taskInfo[@"name"];
//    _taskInfo = taskInfo;
//}





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
