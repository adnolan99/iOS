//
//  ControlsViewController.h
//  
//
//  Created by Savitha Reddy on 5/2/14.
//
//

#import <UIKit/UIKit.h>

@protocol ControlsViewControllerDelegate;

@interface ControlsViewController : UIViewController

@property (nonatomic,assign) id<ControlsViewControllerDelegate> delegate;

@end

@protocol ControlsViewControllerDelegate <NSObject>

-(void) selectFilterTool: (UIButton *) button1;
-(void) selectHsbTool: (UIButton *) button2;
-(void) selectBlurTool : (UIButton *) button3;

@end

