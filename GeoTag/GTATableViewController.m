//
//  GTATableViewController.m
//  GeoTag
//
//  Created by Austin Nolan on 5/23/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "GTATableViewController.h"

#import <CoreLocation/CoreLocation.h>

@interface GTATableViewController () <CLLocationManagerDelegate>

@end

@implementation GTATableViewController
{
    
    CLLocationManager * lManager;
    
//    UILabel * currentLocation;
    
    
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        
        
        lManager = [[CLLocationManager alloc]init];
        
        lManager.delegate = self;
        
        lManager.distanceFilter = 1;
        lManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        [lManager startUpdatingLocation];
        
        CLLocation * testUser1Location = [[CLLocation alloc]initWithLatitude:37.788 longitude:-122.409];
        CLLocation * testUser2Location = [[CLLocation alloc]initWithLatitude:37.7878 longitude:-122.4088];
        CLLocation * testUser3Location = [[CLLocation alloc]initWithLatitude:37.7876 longitude:-122.4086];
        
        
        
        
        CLGeocoder * geoCoder = [[CLGeocoder alloc]init];
        
        
        [geoCoder reverseGeocodeLocation:testUser1Location completionHandler:^(NSArray * friendly1, NSError *error)
         {
             NSLog(@"This is testUser1Location %@", friendly1);

         }];
         
         
         [geoCoder reverseGeocodeLocation:testUser2Location completionHandler:^(NSArray * friendly2, NSError *error)
          {
              NSLog(@"This is testUser2Location %@", friendly2);

          }];
          
          [geoCoder reverseGeocodeLocation:testUser3Location completionHandler:^(NSArray * friendly3, NSError *error)
           {
               NSLog(@"This is testUser3Location %@", friendly3);

           }];

        
        
        // Custom initialization
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

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    for (CLLocation * location in locations)
    {
    NSLog(@"%@", location);
    
    


    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
