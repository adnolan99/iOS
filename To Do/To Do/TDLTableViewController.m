//
//  TDLTableViewController.m
//  To Do
//
//  Created by Austin Nolan on 4/2/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TDLTableViewController.h"

#import "TDLTableViewCell.h"

#import "TDLGitHubRequest.h"

@implementation TDLTableViewController

{
    NSMutableArray *listItems;
    UITextField * nameField;
}


//-(void)toggleEdit
//{
//    [self.tableView setEditing:!self.tableView.editing animated:YES];
//}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
//        UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(toggleEdit)];
//        
//        self.navigationItem.rightBarButtonItem =editButton;
        
        listItems = [@[] mutableCopy];
        
        [self loadListItems];
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.tableView.rowHeight = 100;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        header.backgroundColor = [UIColor colorWithRed:217/255.0 green:206/255.0 blue:178/255.0 alpha:1.0];
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 280, 30)];
        titleHeader.text = @"iOS Class";
        titleHeader.textColor = [UIColor colorWithRed:122/255.0 green:106/255.0 blue:83/255.0 alpha:1.0];
        titleHeader.font = [UIFont fontWithName:@"Noteworthy-Bold" size:26];
        [header addSubview:titleHeader];
        self.tableView.tableHeaderView = header;
        
        nameField = [[UITextField alloc] initWithFrame:(CGRectMake(20, 60, 160, 30))];
        nameField.backgroundColor = [UIColor colorWithRed:213/255.0 green:222/255.0 blue:217/255.0 alpha:1.0];
        nameField.layer.cornerRadius = 6;
        nameField.textColor = [UIColor colorWithRed:122/255.0 green:106/255.0 blue:83/255.0 alpha:1.0];
        nameField.font = [UIFont fontWithName:@"Noteworthy-Bold" size:20];
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
        nameField.leftViewMode = UITextFieldViewModeAlways;
        [header addSubview:nameField];
        nameField.delegate = self;
        nameField.placeholder = @"Type Here..";
        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 60, 90, 30)];
        [submitButton setTitle:@"New User" forState:UIControlStateNormal];
        submitButton.titleLabel.font = [UIFont fontWithName:@"Noteworthy-Bold" size:18];
        submitButton.backgroundColor = [UIColor colorWithRed:213/255.0 green:222/255.0 blue:217/255.0 alpha:1.0];
        submitButton.titleLabel.textColor = [UIColor colorWithRed:106/255.0 green:122/255.0 blue:83/255.0 alpha:1.0];
        submitButton.layer.cornerRadius = 6;
        [submitButton addTarget:self action:@selector(newUser) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:submitButton];
        
        UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        footer.backgroundColor = [UIColor colorWithRed:217/255.0 green:206/255.0 blue:178/255.0 alpha:1.0];
        UILabel * titleFooter = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 300, 30)];
        titleFooter.text = @"Atlanta 2014";
        titleFooter.textColor = [UIColor colorWithRed:106/255.0 green:122/255.0 blue:83/255.0 alpha:1.0];
        titleFooter.font = [UIFont fontWithName:@"Noteworthy-Bold" size:22];
        [footer addSubview:titleFooter];
        self.tableView.tableFooterView = footer;
    }
    return self;
}


- (void)newUser
{
    NSString * username = nameField.text;
    nameField.text = @"";
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUsername:username];
    if([[userInfo allKeys]count] == 3)
    {
     [listItems addObject:userInfo];
    }
        
    else
    {
        
    NSLog(@"Not enough data!");
    
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Bad Information" message:@"Unable to Add User" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        
        [alertView show];
    }
        [nameField resignFirstResponder];
    [self.tableView reloadData];
    
    [self saveData];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self newUser];
    return YES;
}


- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    textField.placeholder = @"";
}


- (void) textFieldDidEndEditing:(UITextField *)textField
{
    textField.placeholder = @"Type Here..";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [listItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) cell = [[ TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.profileInfo = [self getListItem:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * listItem = [self getListItem:indexPath.row];
    NSLog(@"%@", listItem);
    UIViewController * webController = [[UIViewController alloc] init];
    UIWebView * webView = [[UIWebView alloc] init];
    webController.view = webView;
    [self.navigationController pushViewController:webController animated:YES];
    NSURL * url = [NSURL URLWithString:listItem[@"github"]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

    
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * listItem = [self getListItem:indexPath.row];
    [listItems removeObjectIdenticalTo:listItem];
    //[self.tableView reloadData];
    
    TDLTableViewCell * cell = (TDLTableViewCell *) [tableView cellForRowAtIndexPath:indexPath];
    cell.alpha = 0;
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    NSLog(@"%@", listItems);
    
    [self saveData];
}
                       
                       
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if (sourceIndexPath == destinationIndexPath) return;
    NSDictionary * sourceItem = [self getListItem:sourceIndexPath.row];
    NSDictionary * toItem = [self getListItem:destinationIndexPath.row];
    [listItems removeObjectIdenticalTo:sourceItem];
    [listItems insertObject:sourceItem atIndex:[listItems indexOfObject:toItem]];
    [self saveData];

}


- (NSDictionary *)getListItem: (NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}

- (void) saveData
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:listItems];
    [data writeToFile:path options:NSDataWritingAtomic error:nil];
}


- (NSString *) listArchivePath
{
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentDirectory = documentDirectories[0];
    return [documentDirectory stringByAppendingString:@"listdata.data"];
}


- (void) loadListItems
{
    NSString *path = [self listArchivePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        listItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    
}





@end
