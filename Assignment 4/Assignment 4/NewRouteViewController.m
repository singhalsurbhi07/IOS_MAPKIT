//
//  NewRouteViewController.m
//  Assignment 4
//
//  Created by Surbhi on 5/19/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import "NewRouteViewController.h"

@interface NewRouteViewController ()

@end

@implementation NewRouteViewController
@synthesize routeMap,srcLat,srcLon,desLat,desLon;

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
    NSLog(@"Entered ViewLoad_______>>>>>");
    self.routeMap.delegate=self;
    NSLog(@"srclatitude-->>%d",srcLat);
    NSLog(@"srclong-->>%d",srcLon);
    
   // NSLog(@"Destination string:%@",destinationString);
    CLLocationDegrees srcLatnew=37.776142;
    CLLocationDegrees srcLonnew=-122.424774;
    CLLocationDegrees desLonnew=-122.373962;
    CLLocationDegrees desLatnew=37.73787;
    
    
    
    
    
    
    
    MKPlacemark *source = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(srcLatnew, srcLonnew) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    
    MKMapItem *srcMapItem = [[MKMapItem alloc]initWithPlacemark:source];
    [srcMapItem setName:@""];
    
    MKPlacemark *destination = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(desLatnew, desLonnew) addressDictionary:[NSDictionary dictionaryWithObjectsAndKeys:@"",@"", nil] ];
    
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

-(void)showRoute:(MKDirectionsResponse *)response
{
    NSLog(@"entered show route");
    for (MKRoute *route in response.routes)
    {
        [self.routeMap
         addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in route.steps)
        {
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

@end
