//
//  UITraitCollection+ForceTouchCapabilityPolyfill.h
//  Pods
//
//  Created by James Campbell on 05/01/2016.
//
//
// This pollyfill implements the `forceTouchCapability` property for iOS 8.
// It will of course return UIForceTouchCapabilityUnavailable.

#import <UIKit/UIKit.h>

//For iPhone 8.0 SDK
#ifndef __IPHONE_9_0
#ifdef __IPHONE_8_0

typedef NS_ENUM(NSInteger, UIForceTouchCapability) {
    UIForceTouchCapabilityUnknown = 0,
    UIForceTouchCapabilityUnavailable = 1,
    UIForceTouchCapabilityAvailable = 2
};

@interface UITraitCollection (ForceTouchCapabilityPolyfill)

@property(nonatomic, readonly) UIForceTouchCapability forceTouchCapability;

@end

#endif
#endif

@interface UITraitCollection (ForceTouchCapabilityPolyfill)

@property(nonatomic, readonly) UIForceTouchCapability polly_forceTouchCapability;

@end