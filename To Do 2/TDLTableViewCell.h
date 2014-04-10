//
//  TDLTableViewCell.h
//  To Do 2
//
//  Created by Austin Nolan on 4/8/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDLTableViewCell : UITableViewCell

@property (nonatomic) NSDictionary * taskInfo;

@property (nonatomic) UILabel * nameLabel;
@property (nonatomic) UIView * bgView;
@property (nonatomic) UIButton * circleButton;
@property (nonatomic) UIView * strikeThrough;
@property (nonatomic) BOOL struck;

@property (nonatomic) BOOL swiped;

-(void)showCircleButtons;

-(void)hideCircleButtons;

-(void)showDeleteButton;
-(void)hideDeleteButton;


@end
