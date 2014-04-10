//
//  TDLTableViewCell.h
//  To Do 2
//
//  Created by Austin Nolan on 4/8/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDLTableViewCellDelegate;

@interface TDLTableViewCell : UITableViewCell

@property (nonatomic,assign) id<TDLTableViewCellDelegate> delegate;
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
-(void)resetLayout;

@end

@protocol TDLTableViewCellDelegate <NSObject>

-(void)deleteItem: (TDLTableViewCell *)cell;
-(void)setItemPriority: (int)priority withItem:(TDLTableViewCell *)cell;

@optional

-(void)optionalMethod;

@end

