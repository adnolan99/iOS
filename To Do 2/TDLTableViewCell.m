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
        
       
        
        taskName = [[UILabel alloc] initWithFrame:(CGRectMake(100, 20, 200, 30))];
        taskName.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:taskName];
        
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
