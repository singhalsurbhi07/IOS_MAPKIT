//
//  NewRouteViewController.h
//  Assignment 4
//
//  Created by Surbhi on 5/19/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"

@interface NewRouteViewController : UIViewController
<MKMapViewDelegate>
//@property (strong, nonatomic) MKMapItem *destinationString;
//@property (strong,nonatomic) MKMapItem *sourceString;
@property (strong, nonatomic) IBOutlet MKMapView *routeMap;

@property (nonatomic) CLLocationDegrees srcLat;
@property (nonatomic) CLLocationDegrees srcLon;
@property (nonatomic) CLLocationDegrees desLat;
@property (nonatomic) CLLocationDegrees desLon;




@end
