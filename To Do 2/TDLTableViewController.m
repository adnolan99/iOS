//
//  TDLTableViewController.m
//  To Do 2
//
//  Created by Austin Nolan on 4/8/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TDLTableViewController.h"

#import "TDLTableViewCell.h"

@interface TDLTableViewController ()

@end

@implementation TDLTableViewController

{
    UITextField * itemField;
    NSMutableArray * listItems;
}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
      
        
        listItems = [@[]mutableCopy];
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        
        header.backgroundColor = [UIColor whiteColor];
        self.tableView.tableHeaderView = header;
        itemField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 160, 20)];
        itemField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:.05];
        itemField.layer.cornerRadius = 6;
        itemField.placeholder = @" To Do Item";
        
        [header addSubview:itemField];
        
        UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 30, 30)];
        button1.backgroundColor= [UIColor greenColor];
        button1.layer.cornerRadius = 15;
        [button1 addTarget:self action:@selector(newItem) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:button1];
        
        UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(240, 20, 30, 30)];
        button2.backgroundColor= [UIColor yellowColor];
        button2.layer.cornerRadius = 15;
        [button2 addTarget:self action:@selector(newItem) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:button2];
        
        UIButton * button3 = [[UIButton alloc] initWithFrame:CGRectMake(280, 20, 30, 30)];
        button3.backgroundColor= [UIColor redColor];
        button3.layer.cornerRadius = 15;
        [button3 addTarget:self action:@selector(newItem) forControlEvents:UIControlEventTouchUpInside];
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
    
    [self.tableView reloadData];
}
- (BOOL) textFieldShouldReturn:(UITextField *) textField
{
[self newItem];
    
    return YES;

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


- (UITableView *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) cell = [[ TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = listItems[indexPath.row];
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

@end
