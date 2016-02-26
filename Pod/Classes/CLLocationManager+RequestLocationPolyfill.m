//
//  CLLocationManager+RequestLocationPolyfill.m
//  Pods
//
//  Created by James Campbell on 25/01/2016.
//
//

#import "CLLocationManager+RequestLocationPolyfill.h"

#import <objc/runtime.h>

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
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_8_4)
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
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_8_4)
    {
        polly_requestLocation(self, @selector(requestLocation));
    }
    else
    {
        [self requestLocation];
    }
}

@end
