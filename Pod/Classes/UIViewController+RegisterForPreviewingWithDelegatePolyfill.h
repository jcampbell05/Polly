//
//  UIViewController+RegisterForPreviewingWithDelegatePolyfill.h
//  Pods
//
//  Created by James Campbell on 25/01/2016.
//
//

#import <UIKit/UIKit.h>

//For iPhone 8.0 SDK
#ifndef __IPHONE_9_0
#ifdef __IPHONE_8_0

@interface UIViewController (RegisterForPreviewingWithDelegatePolyfill)

- (id <UIViewControllerPreviewing>)registerForPreviewingWithDelegate:(id<UIViewControllerPreviewingDelegate>)delegate sourceView:(UIView *)sourceView;

@end

#endif
#endif

@interface UIViewController (RegisterForPreviewingWithDelegatePolyfill)

- (id <UIViewControllerPreviewing>)polly_registerForPreviewingWithDelegate:(id<UIViewControllerPreviewingDelegate>)delegate sourceView:(UIView *)sourceView;

@end


