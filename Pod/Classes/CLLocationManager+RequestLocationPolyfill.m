//
//  CLLocationManager+RequestLocationPolyfill.m
//  Pods
//
//  Created by James Campbell on 25/01/2016.
//
//

#import "CLLocationManager+RequestLocationPolyfill.h"

#import <objc/runtime.h>

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

//For iPhone 8.0 SDK
#ifndef __IPHONE_9_0
#ifdef __IPHONE_8_0

@implementation CLLocationManager (RequestLocationPolyfill)

@end

#endif
#endif

void polly_requestLocation(CLLocationManager * self, SEL _cmd)
{
    [self startUpdatingLocation];
    [self stopUpdatingLocation];
}

@implementation CLLocationManager (RequestLocationPolyfill)

+ (void)load
{    
    if (NSFoundationVersionNumber <= SYSTEM_VERSION_LESS_THAN(@"9.0"))
    {
        BOOL success = class_addMethod(self.class,
                                       @selector(requestLocation),
                                       (IMP)polly_requestLocation,
                                       @encode(void));
        
        if (!success)
        {
            NSLog(@"Couldn't install request location polyfill");
        }
        else
        {
            NSLog(@"Installed request location polyfill");
        }
    }
}

- (void)polly_requestLocation
{
    if (NSFoundationVersionNumber <= SYSTEM_VERSION_LESS_THAN(@"9.0"))
    {
        polly_requestLocation(self, @selector(requestLocation));
    }
    else
    {
        [self requestLocation];
    }
}

@end
