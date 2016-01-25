//
//  UIViewController+RegisterForPreviewingWithDelegatePolyfill.m
//  Pods
//
//  Created by James Campbell on 25/01/2016.
//
//

#import "UIViewController+RegisterForPreviewingWithDelegatePolyfill.h"

#import <objc/runtime.h>

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
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_8_4)
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
    if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_8_4)
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
