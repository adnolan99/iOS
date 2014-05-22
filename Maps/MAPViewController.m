//
//  MAPViewController.m
//  Maps
//
//  Created by Austin Nolan on 5/21/14.
//  Copyright (c) 2014 Austin Nolan. All rights reserved.
//

#import "MAPViewController.h"

#import "MAPKit/MapKit.h"

#import "CoreLocation/CoreLocation.h"

#import "MAPAnnotation.h"

@interface MAPViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation MAPViewController


{
    MKMapView * myMapView;
    
    CLLocationManager * lManager;
    
    

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
        lManager = [[CLLocationManager alloc]init];
        
        lManager.delegate = self;
        
        lManager.distanceFilter = 50;
        lManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        
        [lManager startUpdatingLocation];
        
        
        
        // Custom initialization
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [myMapView removeAnnotations:myMapView.annotations];
    
    for (CLLocation * location in locations)
    {
        //sets marker to current location
        MAPAnnotation * annotation = [[MAPAnnotation alloc]initWithCoordinate:location.coordinate];
        
        //adds marker to mapView
        [myMapView addAnnotation:annotation];
        
        //moves map to center on current location
        [myMapView setCenterCoordinate:location.coordinate animated:YES];

        //Will move map to current region
        //MKCoordinateRegion region = mapView.region;
        
        //specifies where & how much to zoom in
        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));

        //Set custom subtitles
        //annotation.title = @"Title";
        //annotation.subtitle = @"Subtitle";

        region.span = MKCoordinateSpanMake(1.0, 1.0);
        
        [myMapView setRegion:region animated:YES];
        
        //[mapView selectAnnotation:annotation animated:YES];
        
        NSLog(@"%@", location);
        
        CLGeocoder * geoCoder = [[CLGeocoder alloc]init];
        
        [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
         {
     
     for (CLPlacemark * placemark in placemarks)
            {
        
            NSLog(@"%@",placemark.country);
         
         //setting cityState variable to City and State for respective keys for annotation
         NSString * cityState = [NSString stringWithFormat:@"%@, %@",placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
         
         [annotation setTitle:cityState];
         
         [annotation setTitle:placemark.country];
            }
         }];
    }
    //stops pinging location
    //[lManager stopUpdatingLocation];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myMapView = [[MKMapView alloc]initWithFrame:self.view.frame];
    
    myMapView.delegate = self;
    
    [self.view addSubview:myMapView];
    
    
    
    // Do any additional setup after loading the view.
}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView * annotationView =[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];

    if (annotationView == nil)
    {
        //initializing and defining the info within the annotationView (the info) ***always need an annotation, don't necessarily always need an annotationView***
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    } else {
        //reset annotationView property to new annotation location
        annotationView.annotation = annotation;
    }
    
    //Make your pin a specific picture
    //annotationView.image = [UIImage imageNamed:@"NAME OF IMAGE FILE"];
    
    annotationView.draggable = YES;
    annotationView.canShowCallout = YES;

    return annotationView;
}


-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"%@", view.annotation.title);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    //CLLocation * pinLocation;


    for (UITouch * touch in touches)
    {
        
        CGPoint location = [touch locationInView:myMapView];
        
        CLLocationCoordinate2D coordinate = [myMapView convertPoint:location toCoordinateFromView:myMapView];

        
        //moves map to center on current location
        [myMapView setCenterCoordinate:coordinate animated:YES];

        
        //sets marker to current location
        MAPAnnotation * annotation = [[MAPAnnotation alloc]initWithCoordinate:coordinate];
        
        //adds marker to mapView
        [myMapView addAnnotation:annotation];
        
        
        
        
        
        CLGeocoder * geoCoder = [[CLGeocoder alloc]init];
        CLLocation * newLocation = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
        
        [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error)
         {
             
             NSLog(@"%@", placemarks);

             for (CLPlacemark * placemark in placemarks)
             {
                 
                 NSLog(@"%@",placemark.country);
                 
                 //setting cityState variable to City and State for respective keys for annotation
                 NSString * cityState = [NSString stringWithFormat:@"%@, %@",placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
                 
                 [annotation setTitle:cityState];
                 
                 [annotation setTitle:placemark.country];
             }
         }];
        
    }
    }

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
{
    NSLog(@"new state : %d and old state %d",(int)newState,(int)oldState);

    switch ((int)newState)
    {
        case 0: //not dragging
        {
            [mapView setCenterCoordinate:view.annotation.coordinate animated:YES];
            
            CLGeocoder * geoCoder = [[CLGeocoder alloc]init];
            
            CLLocation * location = [[CLLocation alloc] initWithLatitude:view.annotation.coordinate.latitude longitude:view.annotation.coordinate.longitude];
            
            [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
            {
                for (CLPlacemark * placemark in placemarks)
                {
                    NSLog(@"%@",placemark.addressDictionary);
                    
                    //setting cityState variable to City and State for respective keys for annotationView

                    NSString * cityState = [NSString stringWithFormat:@"%@, %@",placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
                    
                    //changes title and subtitle when you drop marker
                    [(MAPAnnotation *) view.annotation setTitle:cityState];
                    
                    [(MAPAnnotation *) view.annotation setSubtitle:placemark.country];
                }
            }];
        }
            break;
        case 1: //starting drag
            
            break;
        case 2: //
            
            break;
        case 4:
            
            break;
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
