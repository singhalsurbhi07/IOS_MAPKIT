//
//  RouteViewController.m
//  Assignment 4
//
//  Created by Surbhi on 5/19/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import "RouteViewController.h"
#import "MapKit/MapKit.h"



@interface RouteViewController ()

@end

@implementation RouteViewController
@synthesize routeMap,srcLon,srcLat,desLon,desLat;
@synthesize srcgeocoder=_srcgeocoder;
@synthesize desgeocoder=_desgeocoder;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.routeMap.delegate=self;
    NSLog(@"entered route view controller view payload");
    NSLog(@"source=%@",self.source);
    NSLog(@"destination=%@",self.destination);
    srcLat=0;
    srcLon=0;
    desLat=0;
    desLon=0;
    __block BOOL flag1=NO;
    __block BOOL flag2=NO;

    
//    CLLocationDegrees srcLatnew=37.776142;
//    CLLocationDegrees srcLonnew=-122.424774;
//    CLLocationDegrees desLonnew=-122.373962;
//    CLLocationDegrees desLatnew=37.73787;
  
    
    
    
    //MKPlacemark *source = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(37.776142, -122.424774) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    
    //MKMapItem *srcMapItem = [[MKMapItem alloc]initWithPlacemark:source];
    //[srcMapItem setName:@""];
    
    
    
    //MKPlacemark *destination = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(37.73787, -122.373962) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    
    //MKMapItem *distMapItem = [[MKMapItem alloc]initWithPlacemark:destination];
    //[distMapItem setName:@""];
    if (!self.srcgeocoder) {
        self.srcgeocoder = [[CLGeocoder alloc] init];
    }
    [self.srcgeocoder geocodeAddressString:self.source completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation *location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;
            srcLat=coordinate.latitude;
            srcLon=coordinate.longitude;
            flag1=YES;
            
            //NSString *coordinates= [NSString stringWithFormat:@"%f, %f", coordinate.latitude, coordinate.longitude];
            NSLog(@"src coordinates--->>>>= %f,%f",coordinate.latitude,coordinate.longitude);
           
            
        }
        
        //self.fetchCoordinatesButton.enabled = YES;
    }];
    
    
    if (!self.desgeocoder) {
        self.desgeocoder = [[CLGeocoder alloc] init];
    }
    
    //NSString *desaddress = [NSString stringWithFormat:@"%@, %@, %@", self.desStreet.text, self.desCity.text, self.desCountry.text];
    //routeController.destination=desaddress;
    
    
    [self.desgeocoder geocodeAddressString:self.destination completionHandler:^(NSArray *placemarks, NSError *error) {
        if ([placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation *location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;
            desLat=coordinate.latitude;
            desLon=coordinate.longitude;
            flag2=YES;
            
            //NSString *coordinates= [NSString stringWithFormat:@"%f, %f", coordinate.latitude, coordinate.longitude];
            NSLog(@"des coordinates--->>>= %f,%f",coordinate.latitude,coordinate.longitude);
            [self getMap];
                       
        }
        
        //self.fetchCoordinatesButton.enabled = YES;
    }];
    
   }
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    _routeMap.showsUserLocation = YES;
//   MKUserLocation *userLocation = _routeMap.userLocation;
//    MKCoordinateRegion region =
//    MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate,
//                                       20000, 20000);
//    [_routeMap setRegion:region animated:NO];
//    _routeMap.delegate = self;
//    [self getDirections];
//}

//- (void)getDirections
//{
//    NSLog(@"entered get direction");
//    MKDirectionsRequest *request =
//    [[MKDirectionsRequest alloc] init];
//    
//    request.source = [MKMapItem mapItemForCurrentLocation];
//    //request.source=_source;
//    
//    request.destination = _destination;
//    request.requestsAlternateRoutes = NO;
//    MKDirections *directions =
//    [[MKDirections alloc] initWithRequest:request];
//    
//    [directions calculateDirectionsWithCompletionHandler:
//     ^(MKDirectionsResponse *response, NSError *error) {
//         if (error) {
//             // Handle error
//             NSLog(@"get Directions error: %@",error);
//         } else {
//             [self showRoute:response];
//         }
//     }];
//}

-(void)getMap{
    MKPlacemark *source = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(srcLat, srcLon) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    
    MKMapItem *srcMapItem = [[MKMapItem alloc]initWithPlacemark:source];
    [srcMapItem setName:@""];
    
    MKPlacemark *destination = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(desLat, desLon) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    
    MKMapItem *distMapItem = [[MKMapItem alloc]initWithPlacemark:destination];
    [distMapItem setName:@""];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc]init];
    [request setSource:srcMapItem];
    [request setDestination:distMapItem];
    [request setTransportType:MKDirectionsTransportTypeAutomobile];
    
    MKDirections *direction = [[MKDirections alloc]initWithRequest:request];
    
    [direction calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         if (error) {
             // Handle error
             NSLog(@"get Directions error: %@",error);
         } else {
             [self showRoute:response];
         }
     }];

}

-(void)showRoute:(MKDirectionsResponse *)response
{
    NSLog(@"entered show route");
    for (MKRoute *route in response.routes)
    {
        [self.routeMap
         addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in route.steps)
        {
            NSLog(@"_____________");
            NSLog(@"%@", step.instructions);
        }
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
     NSLog(@"entered OverLayRenderer");
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor blueColor];
    renderer.lineWidth = 5.0;
    return renderer;
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
