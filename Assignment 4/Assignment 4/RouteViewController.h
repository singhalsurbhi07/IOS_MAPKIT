//
//  RouteViewController.h
//  Assignment 4
//
//  Created by Surbhi on 5/19/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"

@interface RouteViewController : UIViewController
<MKMapViewDelegate>
//@property (weak, nonatomic) IBOutlet MKMapView *routeMap;
@property (strong, nonatomic) IBOutlet MKMapView *routeMap;
@property (nonatomic,strong) CLGeocoder *srcgeocoder;
@property (nonatomic,strong) CLGeocoder *desgeocoder;
//@property (strong, nonatomic) MKMapItem *destination;
//@property (strong,nonatomic) MKMapItem *source;
@property (nonatomic) CLLocationDegrees srcLat;
@property (nonatomic) CLLocationDegrees srcLon;
@property (nonatomic) CLLocationDegrees desLat;
@property (nonatomic) CLLocationDegrees desLon;
@property (nonatomic) NSString *source;
@property (nonatomic) NSString *destination;




@end
