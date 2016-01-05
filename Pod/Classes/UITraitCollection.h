//
//  UITraitCollection.h
//  Pods
//
//  Created by James Campbell on 05/01/2016.
//
//

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