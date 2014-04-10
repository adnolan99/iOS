//
//  TDLTableViewCell.m
//  To Do 2
//
//  Created by Austin Nolan on 4/8/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TDLTableViewCell.h"

#import "MOVE.h"


@implementation TDLTableViewCell

{
    UIButton * button1;
    UIButton * button2;
    UIButton * button3;
}

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
        
        self.strikeThrough = [[UIView alloc] initWithFrame:CGRectMake(5, 22, self.frame.size.width -30, 1)];
        self.strikeThrough.backgroundColor = [UIColor whiteColor];
        self.strikeThrough.alpha = 0;
        [self.bgView addSubview:self.strikeThrough];
        
        self.circleButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width -50,10,20,20)];
        self.circleButton.layer.cornerRadius = 10;
        self.circleButton.backgroundColor = [UIColor whiteColor];
        [self.bgView addSubview:self.circleButton];
    }
    return self;
}

-(void)resetLayout
{
//    
//    if (self.swiped)
//    {
//        [self createButtons];
//        self.swiped = YES;
//    }

    
    self.bgView.frame = CGRectMake(10, 15, self.frame.size.width - 20, 40);
    [button1 removeFromSuperview];
    [button2 removeFromSuperview];
    [button3 removeFromSuperview];
    self.swiped = NO;
}


-(void)createButtons
{
    button1 = [[UIButton alloc] initWithFrame:CGRectMake(185, 15, 40, 40)];
    [button1 setTitle:@"L" forState:UIControlStateNormal];
    button1.tag = 1;
    button1.alpha = 0;
    button1.backgroundColor= YELLOW_COLOR;
    button1.layer.cornerRadius = 20;
    [button1 addTarget:self action:@selector(pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button1];
    
    button2 = [[UIButton alloc] initWithFrame:CGRectMake(230, 15, 40, 40)];
    [button2 setTitle:@"M" forState:UIControlStateNormal];
    button2.tag = 2;
    button2.alpha = 0;
    button2.backgroundColor= ORANGE_COLOR;
    button2.layer.cornerRadius = 20;
    [button2 addTarget:self action:@selector(pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button2];
    
    button3 = [[UIButton alloc] initWithFrame:CGRectMake(275, 15, 40, 40)];
    [button3 setTitle:@"H" forState:UIControlStateNormal];
    button3.tag = 3;
    button3.alpha = 0;
    button3.backgroundColor= RED_COLOR;
    button3.layer.cornerRadius = 20;
    [button3 addTarget:self action:@selector(pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button3];
}


-(void)pressPriorityButton: (id)sender
{
    UIButton * button = (UIButton *)sender;
    [self.delegate setItemPriority:(int)button.tag withItem:self];
}


-(void)showCircleButtons
{
    [self createButtons];
    
    [MOVE animateView: button1 properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.3}];
    [MOVE animateView: button2 properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.2}];
    [MOVE animateView: button3 properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.1}];
}


-(void)hideCircleButtons
{
    [MOVE animateView: button1 properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.0, @"remove":@YES}];
    [MOVE animateView: button2 properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.1, @"remove":@YES}];
    [MOVE animateView: button3 properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.2, @"remove":@YES}];
}


-(void)showDeleteButton
{
    button3 = [[UIButton alloc] initWithFrame:CGRectMake(275, 15, 40, 40)];
    [button3 setTitle:@"X" forState:UIControlStateNormal];
    button3.titleLabel.font =[UIFont fontWithName:@"HelveticaNeue" size:34];
    button3.titleLabel.textColor = TAN_COLOR;
    button3.tag = 3;
    button3.alpha = 0;
    button3.backgroundColor= RED_COLOR;
    button3.layer.cornerRadius = 20;
    [button3 addTarget:self action:@selector(pressDeleteButton) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button3];
    
    [MOVE animateView: button3 properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.15}];
}


-(void)pressDeleteButton
{
    [self.delegate deleteItem:self];
}


-(void)hideDeleteButton
{
    [MOVE animateView: button3 properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.0, @"remove":@YES}];
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
