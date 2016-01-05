//
//  ViewController.m
//  Polly
//
//  Created by James Campbell on 05/01/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

#import "ViewController.h"


#import <Polly/Polly-umbrella.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        NSLog(@"Force Touch Avaliable");
    }
    else
    {
        NSLog(@"No Force Touch Unavaliable");
    }
}

@end
