//
//  ViewController.m
//  Polly
//
//  Created by James Campbell on 05/01/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

#import "ViewController.h"

#import <Polly/Polly-umbrella.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate, UIViewControllerPreviewingDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self registerForPreviewingWithDelegate:self
                                 sourceView:self.view];
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        NSLog(@"Force Touch Avaliable");
    }
    else
    {
        NSLog(@"No Force Touch Unavaliable");
    }
    
    [self.locationManager requestLocation];
}

#pragma mark - <CLLocationManagerDelegate>

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //This may fire up to 3 times per request as iOS recieves more accurate location.
    NSLog(@"Location Updated");
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Did fail to update location: %@", error);
}

#pragma mark - <UIViewControllerPreviewingDelegate>

@end
