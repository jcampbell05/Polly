//
//  UIViewController+RegisterForPreviewingWithDelegatePolyfill.m
//  Pods
//
//  Created by James Campbell on 25/01/2016.
//
//

#import "UIViewController+RegisterForPreviewingWithDelegatePolyfill.h"

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

//For iPhone 8.0 SDK
#ifndef __IPHONE_9_0
#ifdef __IPHONE_8_0

@implementation UIViewController (RegisterForPreviewingWithDelegatePolyfill)

@end

#endif
#endif

id <UIViewControllerPreviewing> polly_registerForPreviewingWithDelegatePolyfill(id self, SEL _cmd, id<UIViewControllerPreviewingDelegate> delegate, UIView *sourceView)
{
    return nil;
}


@implementation UIViewController (RegisterForPreviewingWithDelegatePolyfill)

+ (void)load
{
    if (SYSTEM_VERSION_LESS_THAN(@"9.0"))
    {
        BOOL success = class_addMethod(self.class,
                                       @selector(registerForPreviewingWithDelegate:sourceView:),
                                       (IMP)polly_registerForPreviewingWithDelegatePolyfill,
                                       @encode(id <UIViewControllerPreviewing>));
        
        
        if (!success)
        {
            NSLog(@"Couldn't install register for previewing polyfill");
        }
        else
        {
            NSLog(@"Installed register for previewing polyfill");
        }
    }
}

- (id <UIViewControllerPreviewing>)polly_registerForPreviewingWithDelegate:(id<UIViewControllerPreviewingDelegate>)delegate sourceView:(UIView *)sourceView
{
    if (SYSTEM_VERSION_LESS_THAN(@"9.0"))
    {
        return polly_registerForPreviewingWithDelegatePolyfill(self, @selector(polly_registerForPreviewingWithDelegate:sourceView:), delegate, sourceView);
    }
    else
    {
        return [self registerForPreviewingWithDelegate:delegate
                                            sourceView:sourceView];
    }
}

@end
