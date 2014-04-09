//
//  TDLTableViewController.m
//  To Do 2
//
//  Created by Austin Nolan on 4/8/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TDLTableViewController.h"

#import "TDLTableViewCell.h"

#import "MOVE.h"

@interface TDLTableViewController ()

@end

@implementation TDLTableViewController

{
    UITextField * itemField;
    NSMutableArray * listItems;
    UIButton * button1;
    UIButton * button2;
    UIButton * button3;
    NSArray * priorityColors;

}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
      
        
        
        priorityColors = @[TAN_COLOR, YELLOW_COLOR, ORANGE_COLOR, RED_COLOR];
        
        
        listItems = [@[
                       
                   @{@"name":@"Workshop",@"priority" : @3},
                   @{@"name":@"Go to Blogging thing",@"priority" : @2},
                   @{@"name":@"Learn objective C",@"priority" : @1},
                   @{@"name":@"Finish Github app",@"priority" : @0}
                   
                   ] mutableCopy];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        self.tableView.rowHeight = 50;
        
        
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
        
        header.backgroundColor = [UIColor whiteColor];
        self.tableView.tableHeaderView = header;
        itemField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 160, 40)];
        itemField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.05];
        itemField.layer.cornerRadius = 6;
        itemField.leftViewMode = UITextFieldViewModeAlways;
        itemField.leftView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        itemField.placeholder = @" To Do Item";
        itemField.tintColor = RED_COLOR;
        
        [header addSubview:itemField];
        
        button1 = [[UIButton alloc] initWithFrame:CGRectMake(185, 20, 40, 40)];
        [button1 setTitle:@"L" forState:UIControlStateNormal];
        button1.tag = 1;
        button1.backgroundColor= YELLOW_COLOR;
        button1.layer.cornerRadius = 20;
        [button1 addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:button1];
        
        button2 = [[UIButton alloc] initWithFrame:CGRectMake(230, 20, 40, 40)];
        [button2 setTitle:@"M" forState:UIControlStateNormal];
        button2.tag = 2;
        button2.backgroundColor= ORANGE_COLOR;
        button2.layer.cornerRadius = 20;
        [button2 addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:button2];
        
        button3 = [[UIButton alloc] initWithFrame:CGRectMake(275, 20, 40, 40)];
        [button3 setTitle:@"H" forState:UIControlStateNormal];
        button3.tag = 3;
        button3.backgroundColor= RED_COLOR;
        button3.layer.cornerRadius = 20;
        [button3 addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:button3];

    }
    return self;
}


- (void)newItem
{
    NSString * itemName = itemField.text;
    itemField.text = @"";
    
    [itemField resignFirstResponder];
    
    [listItems insertObject:itemName atIndex:0];
    
    NSLog(@"%@", listItems);
    
    NSLog(@"Clicking");
    
    [self.tableView reloadData];
}


- (BOOL) textFieldShouldReturn:(UITextField *) textField
{
[self newItem];
    
    return YES;

}


- (void) addNewListItem: (id)sender
{
    
    UIButton * button = (UIButton *) sender;
    
    NSString * name = itemField.text;
    itemField.text = @" ";
    
    if(![name isEqualToString:@""])
    {
        [listItems insertObject:@{@"name":name,@"priority" : @(button.tag)} atIndex:0];
    }
    
    NSLog(@"%@",sender);
    
    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    
    return [listItems count];
    // Return the number of rows in the section.
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) cell = [[ TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary * listItem = listItems[indexPath.row];
    
    cell.bgView.backgroundColor = priorityColors[[listItem[@"priority"] intValue]];
    
    if ([listItem[@"priority"] intValue]== 0)
    {
        cell.strikeThrough.alpha = 1;
        cell.circleButton.alpha = 0;
    } else {
        cell.strikeThrough.alpha = 0;
        cell.circleButton.alpha = 1;
    }
    
    
    cell.nameLabel.text = listItem[@"name"];
    
    //cell.nameLabel.textColor = [UIColor whiteColor];
    //cell.textLabel.textAlignment =
    
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
                                           [cell addGestureRecognizer:swipeLeft];
                                           
                                           
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight; [cell addGestureRecognizer:swipeRight];
                                           
    return cell;
    
    
    // Configure the cell...
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    // if () return;
    
    //NSInteger index = [self.tableView indexPathForCell:cell].row;
    
    cell.bgView.backgroundColor = priorityColors [0];
    cell.strikeThrough.alpha = 1;
    cell.circleButton.alpha = 0;
    
    
    
    NSDictionary * updateListItem = @{@"name": listItems [indexPath.row][@"name"],
                                      @"priority" : @0
                                      };
    
    //remove old dictionary cell
    [listItems removeObjectAtIndex:indexPath.row];
    
    // add new dictionary for cell
    [listItems insertObject:updateListItem atIndex:indexPath.row];
    
    
}




-(void) swipeCell:(UISwipeGestureRecognizer *) gesture
{
    //NSLog(@"%@", gesture);

    TDLTableViewCell * cell = (TDLTableViewCell *) gesture.view;
    
    switch (gesture.direction){
        case 1: //right
            NSLog(@"swiping right");
            
            [MOVE animateView:cell.bgView properties:@{@"x" : @10,@"duration" : @0.5}];
        [cell hideCircleButtons];
            break;
            
        case 2: //left
            NSLog(@"swiping left");
            
            [MOVE animateView:cell.bgView properties:@{@"x" : @-120,@"duration" : @0.5}];
            [cell showCircleButtons];
            
            break;
            
        default:
            break;
    }
    
}





- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
