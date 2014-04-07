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

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
    
        
//        listItems = [@[
//                      @{@"name":@"Ed Salter", @"image" : [UIImage imageNamed:@"edsalter"], @"github":@"https://github.com/MadArkitekt"},
//                      @{@"name":@"Austin Nolan", @"image" : [UIImage imageNamed:@"austinnolan"], @"github":@"https://github.com/adnolan99"},
//                      @{@"name":@"Jisha Obukwelu", @"image" : [UIImage imageNamed:@"jishaobukwelu"], @"github":@"https://github.com/Jiobu"},
//                      @{@"name":@"John Yam", @"image" : [UIImage imageNamed:@"johnyam"], @"github":@"https://github.com/yamski"},
//                      @{@"name":@"Austen Johnson", @"image" : [UIImage imageNamed:@"austenjohnson"], @"github":@"https://github.com/ajohnson21"},
//                      @{@"name":@"Ashby Thornwell", @"image" : [UIImage imageNamed:@"ashby"], @"github":@"https://github.com/athornwell"},
//                      @{@"name":@"Savitha Reddy", @"image" : [UIImage imageNamed:@"savithareddy"], @"github":@"https://github.com/savithareddy"},
//                      @{@"name" : @"Jeff King", @"image" : [UIImage imageNamed:@"jeffking"], @"github":@"https://github.com/rampis"},
//                      @{@"name" : @"Ali Houshmand", @"image" : [UIImage imageNamed:@"alihoushmand"], @"github":@"https://github.com/HoushmandA06"},
//                      @{@"name" : @"Jon Fox", @"image" : [UIImage imageNamed:@"jonfox"], @"github":@"https://github.com/FoxJon"},
//                      @{@"name" : @"Teddy Conyers", @"image" : [UIImage imageNamed:@"teddyconyers"], @"github":@"https://github.com/talented76"},
//                      @{@"name" : @"Jeffery Moulds", @"image" : [UIImage imageNamed:@"jefferymoulds"], @"github":@"https://github.com/jdmgithub"},
//                      @{@"name" : @"Derek Weber", @"image" : [UIImage imageNamed:@"derekweber"], @"github":@"https://github.com/dweber03"},
//                      @{@"name" : @"T.J. Mercer", @"image" : [UIImage imageNamed:@"tjmercer"], @"github":@"https://github.com/gwanunig14"},
//                      @{@"name" : @"Heidi Proske", @"image" : [UIImage imageNamed:@"justagirlcoding"], @"github":@"https://github.com/justagirlcoding"},
//                      ]
        
        listItems = [@[] mutableCopy];
        
        
        
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
        submitButton.titleLabel.textColor = [UIColor colorWithRed:122/255.0 green:106/255.0 blue:83/255.0 alpha:1.0];
        submitButton.layer.cornerRadius = 6;
        [submitButton addTarget:self action:@selector(newUser) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:submitButton];
        
        
        UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        footer.backgroundColor = [UIColor colorWithRed:213/255.0 green:222/255.0 blue:217/255.0 alpha:1.0];
        UILabel * titleFooter = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 300, 30)];
        titleFooter.text = @"Atlanta 2014";
        titleFooter.textColor = [UIColor colorWithRed:106/255.0 green:122/255.0 blue:83/255.0 alpha:1.0];
        titleFooter.font = [UIFont fontWithName:@"Noteworthy-Bold" size:22];
        [footer addSubview:titleFooter];
        self.tableView.tableFooterView = footer;
        

    }
        

        //long way to create array
        //listItems = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday", @"Wednesday",nil];

{
    //listItems = @[@"Ali Houshmand", @"Jeffery Moulds", @"Savitha Reddy", @"Jeff King", @"Derek Weber", @"Ashby", @"Austin Nolan", @"Austen Johnson", @"Jon Fox", @"Teddy Conyers", @"T.J. Mercer", @"Just a Girl Coding", @"John Yam", @"Ed Salter", @"Jisha Obukwelu"];
    // NSLog(@"listItems : %@ .... %@",listItems, listItems[1]);
}
    
    return self;
}

- (void)newUser
{
    
    NSString * username = nameField.text;
    nameField.text = @"";
    
//    [listItems addObject:@{@"name" : username,
//                           //@"image" : [UIImage imageNamed:@"new_user"],
//                           @"github":[NSString stringWithFormat:@"https://github.com/%@", username]}
//                            ];
    
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUsername:username];
    
    [listItems addObject:userInfo];
    
    [nameField resignFirstResponder];
    [self.tableView reloadData];
    
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
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
//    int index = indexPath.row;
//    
//    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
//    
//    NSDictionary * listItem = reverseArray[index];
    
//    NSDictionary * listItem = [self getListItem:indexPath.row];
    
    cell.profileInfo = [self getListItem:indexPath.row];
    

   //cell.textLabel.text = listItem[@"name"];
   //cell.imageView.image =  listItem[@"image"];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSDictionary * listItem = [self getListItem:indexPath.row];
    
    NSLog(@"%@", listItem);
    
    UIViewController * webController = [[UIViewController alloc] init];
    
    UIWebView * webView = [[UIWebView alloc] init];
    
    webController.view = webView;
    
    UIWindow * window = [[UIApplication sharedApplication].windows firstObject];
    
    UINavigationController * navController = (UINavigationController *)window.rootViewController;
    
    [navController pushViewController:webController animated:YES];
    
    NSURL * url = [NSURL URLWithString:listItem[@"github"]];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:listItem[@"github"]]]];
    
    
}

- (NSDictionary *)getListItem: (NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
    
}


@end
