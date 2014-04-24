//
//  TLATableViewController.m
//  TweetLike
//
//  Created by Austin Nolan on 4/23/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "TLATableViewController.h"

#import "TLATableViewCell.h"


@interface TLATableViewController ()

@end

@implementation TLATableViewController

{
   // NSMutableArray * tweetItems;
    
    UIView * tableScreen;
    
    
    //UIView * header;
    UIButton * addNewButton;
    
    UIImage * heartIcon;
    
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        
        self.tweetItems = [@[
                        @{
                            @"text": @"This is a tweet text",
                            @"likes": @87,
                              },
                        @{
                            @"text": @"This is a tweet text",
                            @"likes": @99,
                            
                        }] mutableCopy];
        
        
        
        self.tableView.rowHeight = 80;
        
        
        // Custom initialization
    }
    return self;
}




//Make Submit Button Work


//-(void)submitEntry
//{
//    
//    {
//        NSString * tweet = tweetText.text;
//        tweetText.text = @" ";
//        if(![tweet isEqualToString:@""])
//        {
//            [tweetItems addObject:@{@"tweet":tweet,@"likes" : @0} atIndex:0];
//        }
//        
//        NSLog(@"%@", tweet);
//        [self.tableView reloadData];
//    }
//}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.view = tableScreen;
    
    //tableScreen.backgroundColor = [UIColor blueColor];
    
    
    
//    UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
//    header.backgroundColor = [UIColor blueColor];
//    self.tableView.tableHeaderView = header;
    
//    UIButton * addNewButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 25, 100, 25)];
//    headerTitle.text = @"Tweet Like";
//    [header addSubview:headerTitle];
    
    
    
    
    

    
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.tweetItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLATableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil)
    {
        cell = [[TLATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.tweet = self.tweetItems[indexPath.row];
    

    return cell;
}




-(void)createNewTweet:(NSString *)tweets
{
    if ([tweets isEqualToString:@""]) return;
    
    [self.tweetItems insertObject:@{
                                   @"likes":@0,
                                   @"text": tweets
                                   } atIndex:0];
    
    
    [self.tableView reloadData];
    
   
}



-(BOOL)isTweetItemsEmpty
{
    return [self.tweetItems count] == 0;
    
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

- (BOOL)prefersStatusBarHidden { return YES; }

                      
@end
