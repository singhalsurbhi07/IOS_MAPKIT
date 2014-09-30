//
//  ViewController.h
//  Assignment 4
//
//  Created by Surbhi on 5/19/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CoreLocation/CoreLocation.h"
#import "RouteViewController.h"

@interface ViewController :UIViewController{
    CLGeocoder *_geocoder;
    __weak UITextField *_srcStreet;
    __weak UITextField *srcCity;
    __weak UITextField *srcCountry;
    __weak UITextField *srcZip;
    __weak UITextField *desStreet;
    __weak UITextField *desCity;
    __weak UITextField *desCountry;
    __weak UITextField *desZip;
    
}
@property (strong, nonatomic) NSArray *mapItems;

@property (nonatomic,strong) CLGeocoder *srcgeocoder;
@property (nonatomic,strong) CLGeocoder *desgeocoder;
@property (nonatomic,weak) IBOutlet UITextField *srcStreet;
@property (nonatomic,weak) IBOutlet UITextField *srcCity;
@property (nonatomic,weak) IBOutlet UITextField *srcCountry;
@property (nonatomic,weak) IBOutlet UITextField *srcZip;
@property (nonatomic,weak) IBOutlet UITextField *desStreet;
@property (nonatomic,weak) IBOutlet UITextField *desCity;
@property (nonatomic,weak) IBOutlet UITextField *desCountry;
@property (nonatomic,weak) IBOutlet UITextField *desZip;

- (IBAction)get:(id)sender;
-(IBAction)textFieldReturn:(id)sender;



@end
