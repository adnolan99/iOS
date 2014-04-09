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
        
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, -8, 200, 57)];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:26];
        
        [self.bgView addSubview:self.nameLabel];
        
        self.circleButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width -50,10,20,20)];
        self.circleButton.layer.cornerRadius = 10;
        self.circleButton.backgroundColor = [UIColor whiteColor];
        
        [self.bgView addSubview:self.circleButton];
        
        
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
