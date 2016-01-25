//
//  UITraitCollection+ForceTouchCapabilityPolyfill.m
//  Pods
//
//  Created by James Campbell on 05/01/2016.
//
//

#import "UITraitCollection+ForceTouchCapabilityPolyfill.h"

#import <objc/runtime.h>

//For iPhone 8.0 SDK
#ifndef __IPHONE_9_0
#ifdef __IPHONE_8_0

@implementation UITraitCollection (ForceTouchCapabilityPolyfill)

@end

#endif
#endif

UIForceTouchCapability polly_forceTouchCapability (id self, SEL _cmd)
{
    return  UIForceTouchCapabilityUnavailable;
}

@implementation UITraitCollection (ForceTouchCapabilityPolyfill)

+ (void)load
{    
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_8_4)
    {
        BOOL success = class_addMethod(self.class,
                                       @selector(forceTouchCapability),
                                       (IMP)polly_forceTouchCapability,
                                       @encode(UIForceTouchCapability));
        
        
        if (!success)
        {
            NSLog(@"Couldn't install force touch capability polyfill");
        }
    }
}

- (UIForceTouchCapability)polly_forceTouchCapability
{
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_8_4)
    {
        return polly_forceTouchCapability(self, @selector(forceTouchCapability));
    }
    else
    {
        return self.forceTouchCapability;
    }
}

@end