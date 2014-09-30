//
//  ViewController.m
//  Assignment 4
//
//  Created by Surbhi on 5/19/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize srcgeocoder=_srcgeocoder;
@synthesize desgeocoder=_desgeocoder;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSLog(@"entered prepare for seague");
    RouteViewController *routeController =[segue destinationViewController];
    
    
    NSString *srcaddress = [NSString stringWithFormat:@"%@, %@, %@", self.srcStreet.text, self.srcCity.text, self.srcCountry.text];
    routeController.source=srcaddress;
    
    
    NSString *desaddress = [NSString stringWithFormat:@"%@, %@, %@", self.desStreet.text, self.desCity.text, self.desCountry.text];
    routeController.destination=desaddress;
    
    
    //
//   routeController.srcLon=-122.424774;
//  routeController.srcLat=37.776142;
//    routeController.desLat=37.73787;
//    routeController.desLon=-122.373962;
//
//    
    
    
    
}
//-(float)getLatitude:(NSString*)address{
//    NSLog(@"getLatitude param=%@",address);
//    __block float returnVal;
//    if (!self.geocoder) {
//        self.geocoder = [[CLGeocoder alloc] init];
//    }
//    [self.geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
//        if ([placemarks count] > 0) {
//            CLPlacemark *placemark = [placemarks objectAtIndex:0];
//            CLLocation *location = placemark.location;
//            CLLocationCoordinate2D coordinate = location.coordinate;
//            
//           // NSString *coordinates= [NSString stringWithFormat:@"%f, %f", coordinate.latitude, coordinate.longitude];
//            NSLog(@"src coordinates= %f %f",coordinate.latitude,coordinate.longitude);
//
//            returnVal=coordinate.latitude;
//            
//            //if ([placemark.areasOfInterest count] > 0) {
//            //    NSString *areaOfInterest = [placemark.areasOfInterest objectAtIndex:0];
//            //    self.nameLabel.text = areaOfInterest;
//            // }
//        }
//        
//        //self.fetchCoordinatesButton.enabled = YES;
//    }];
//    NSLog(@"returnVal=%f",returnVal);
//    
//    
//    return returnVal;
//}
//
//-(float)getLongitude:(NSString*)address{
//    NSLog(@"getLongitude param=%@",address);
//    __block float returnVal;
//    if (!self.geocoder) {
//        self.geocoder = [[CLGeocoder alloc] init];
//    }
//    [self.geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
//        if ([placemarks count] > 0) {
//            CLPlacemark *placemark = [placemarks objectAtIndex:0];
//            CLLocation *location = placemark.location;
//            CLLocationCoordinate2D coordinate = location.coordinate;
//            
//            NSString *coordinates= [NSString stringWithFormat:@"%f, %f", coordinate.latitude, coordinate.longitude];
//            returnVal=coordinate.longitude;
//            NSLog(@"src coordinates= %@",coordinates);
//            
//            //if ([placemark.areasOfInterest count] > 0) {
//            //    NSString *areaOfInterest = [placemark.areasOfInterest objectAtIndex:0];
//            //    self.nameLabel.text = areaOfInterest;
//            // }
//        }
//        
//        //self.fetchCoordinatesButton.enabled = YES;
//    }];
//    NSLog(@"returnVal=%f",returnVal);
//    
//    
//    return returnVal;
//}


- (IBAction)get:(id)sender{
    NSLog(@"Entered Get method");
//    if (!self.geocoder) {
//        self.geocoder = [[CLGeocoder alloc] init];
//    }
//    
//    NSString *address = [NSString stringWithFormat:@"%@, %@, %@", self.srcStreet.text, self.srcCity.text, self.srcCountry.text];
//    
//    
//    [self.geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
//        if ([placemarks count] > 0) {
//            CLPlacemark *placemark = [placemarks objectAtIndex:0];
//            CLLocation *location = placemark.location;
//            CLLocationCoordinate2D coordinate = location.coordinate;
//            
//            //NSString *coordinates= [NSString stringWithFormat:@"%f, %f", coordinate.latitude, coordinate.longitude];
//            NSLog(@"src coordinates= %f,%f",coordinate.latitude,coordinate.longitude);
//            
//            
//        }
//        
//        //self.fetchCoordinatesButton.enabled = YES;
//    }];
    NSLog(@"exiting get method");
}

@end
