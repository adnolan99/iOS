//
//  TDLTableViewController.m
//  To Do
//
//  Created by Austin Nolan on 4/2/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TDLTableViewController.h"

#import "TDLTableViewCell.h"

@implementation TDLTableViewController

{
    NSArray *listItems;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        
        
        //NSDictionary * list = [NSDictionary alloc] initWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>;
        
        //NSDictionary * lsit = @{
        //                        @"name" : @"Savitha Redding", @"image" : [UIImage imageNamed:@"savitharedding"]
        //
        //                        };
        
        listItems = @[
                      @{@"name":@"Ed Salter", @"image" : [UIImage imageNamed:@"edsalter"], @"github":@"https://github.com/MadArkitekt"},
                      @{@"name":@"Austin Nolan", @"image" : [UIImage imageNamed:@"austinnolan"], @"github":@"https://github.com/adnolan99"},
                      @{@"name":@"Jisha Obukwelu", @"image" : [UIImage imageNamed:@"jishaobukwelu"], @"github":@"https://github.com/Jiobu"},
                      @{@"name":@"John Yam", @"image" : [UIImage imageNamed:@"johnyam"], @"github":@"https://github.com/yamski"},
                      @{@"name":@"Austen Johnson", @"image" : [UIImage imageNamed:@"austenjohnson"], @"github":@"https://github.com/ajohnson21"},
                      @{@"name":@"Ashby", @"image" : [UIImage imageNamed:@"ashby"], @"github":@"https://github.com/athornwell"},
                      @{@"name":@"Savitha Reddy", @"image" : [UIImage imageNamed:@"savithareddy"], @"github":@"https://github.com/savithareddy"},
                      @{@"name" : @"Jeff King", @"image" : [UIImage imageNamed:@"jeffking"], @"github":@"https://github.com/rampis"},
                      @{@"name" : @"Ali Houshmand", @"image" : [UIImage imageNamed:@"alihoushmand"], @"github":@"https://github.com/HoushmandA06"},
                      @{@"name" : @"Jon Fox", @"image" : [UIImage imageNamed:@"jonfox"], @"github":@"https://github.com/FoxJon"},
                      @{@"name" : @"Teddy Conyers", @"image" : [UIImage imageNamed:@"teddyconyers"], @"github":@"https://github.com/talented76"},
                      @{@"name" : @"Jeffery Moulds", @"image" : [UIImage imageNamed:@"jefferymoulds"], @"github":@"https://github.com/jdmgithub"},
                      @{@"name" : @"Derek Weber", @"image" : [UIImage imageNamed:@"derekweber"], @"github":@"https://github.com/dweber03"},
                      @{@"name" : @"T.J. Mercer", @"image" : [UIImage imageNamed:@"tjmercer"], @"github":@"https://github.com/gwanunig14"},
                      @{@"name" : @"Just a Girl Coding", @"image" : [UIImage imageNamed:@"justagirlcoding"], @"github":@"https://github.com/justagirlcoding"},
                      ];

        
//        listItems = @[@"Ed Salter",
//                      @"Austin Nolan",
//                      @"Jisha Obukwelu",
//                      @"John Yam",
//                      @"Austen Johnson",
//                      @"Ashby",
//                      @"Savitha Reddy",
//                      @"Jeff King",
//                      @"Ali Houshmand",
//                      @"Jon Fox",
//                      @"Teddy Conyers",
//                      @"Jeffery Moulds",
//                      @"Derek Weber",
//                      @"T.J. Mercer",
//                      @"Just a Girl Coding",
//                      ];
        
                      
                      
                      //@"Ali Houshmand", @"Jeffery Moulds", @"Savitha Reddy", @"Jeff King", @"Derek Weber", @"Ashby", @"Austin Nolan", @"Austen Johnson", @"Jon Fox", @"Teddy Conyers", @"T.J. Mercer", @"Just a Girl Coding", @"John Yam", @"Ed Salter", @"Jisha Obukwelu"
                      
//                      
//        listImages = @[
//                       [UIImage imageNamed:@"edsalter"],
//                       [UIImage imageNamed:@"austinnolan"],
//                       [UIImage imageNamed:@"jishaobukwelu"],
//                       [UIImage imageNamed:@"johnyam"],
//                       [UIImage imageNamed:@"austenjohnson"],
//                       [UIImage imageNamed:@"ashby"],
//                       [UIImage imageNamed:@"savithareddy"],
//                       [UIImage imageNamed:@"jeffking"],
//                       [UIImage imageNamed:@"alihoushmand"],
//                       [UIImage imageNamed:@"jonfox"],
//                       [UIImage imageNamed:@"teddyconyers"],
//                       [UIImage imageNamed:@"jefferymoulds"],
//                       [UIImage imageNamed:@"derekweber"],
//                       [UIImage imageNamed:@"tjmercer"],
//                       [UIImage imageNamed:@"justagirlcoding"],
//                       ];
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.tableView.rowHeight = 100;
        
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        
        header.backgroundColor = [UIColor darkGrayColor];
        
         self.tableView.tableHeaderView = header;
        
        
        
        
        
        UITextField * nameField = [[UITextField alloc] initWithFrame:(CGRectMake(20, 60, 160, 30))];
        
        nameField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.1];
        nameField.layer.cornerRadius = 6;
        nameField.textColor = [UIColor colorWithRed:127/255 green:255/255 blue:0/255 alpha:1.0];
        nameField.font = [UIFont fontWithName:@"Noteworthy-Bold" size:20];
        nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
        nameField.leftViewMode = UITextFieldViewModeAlways;
        
        [header addSubview:nameField];
        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 60, 90, 30)];
        [submitButton setTitle:@"New User" forState:UIControlStateNormal];
        submitButton.titleLabel.font = [UIFont systemFontOfSize:18];
        submitButton.backgroundColor = [UIColor colorWithRed:127/255 green:255/255 blue:0/255 alpha:1.0];
        submitButton.layer.cornerRadius = 6;
        [header addSubview:submitButton];
        
        
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 280, 30)];
        titleHeader.text = @"Contacts";
        titleHeader.textColor = [UIColor whiteColor];
        titleHeader.font = [UIFont fontWithName:@"Noteworthy-Bold" size:26];

        [header addSubview:titleHeader];
        
        
        UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        
        footer.backgroundColor = [UIColor darkGrayColor];
        
        UILabel * titleFooter = [[UILabel alloc] initWithFrame:
                                 CGRectMake(80, 10, 300, 30)];
        
        titleFooter.text = @"ATL iOS Class 2014";
        titleFooter.textColor = [UIColor whiteColor];
        
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
    
    
    int index = [indexPath row];
    
    NSDictionary * listItem = listItems[index];
    
    cell.profileInfo = listItem;
    

   //cell.textLabel.text = listItem[@"name"];
   //cell.imageView.image =  listItem[@"image"];

    
    return cell;
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
