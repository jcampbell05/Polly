//
//  UIViewControllerPreviewing+iOS8Polyfill.swift
//  Pods
//
//  Created by James Campbell on 01/02/2016.
//
//

import UIKit

extension UIViewControllerPreviewing
{
    public var polly_sourceView: UIView {
        if #available(iOS 9.0, *) {
            return sourceView
        } else {
            fatalError("UIViewControllerPreviewing isn't supported on this version of iOS")
        }
    }
    
    public var polly_sourceRect: CGRect {
        
        set {
            if #available(iOS 9.0, *) {
                sourceRect = polly_sourceRect
            } else {
                fatalError("UIViewControllerPreviewing isn't supported on this version of iOS")
            }
        }
        
        get {
            if #available(iOS 9.0, *) {
                return sourceRect
            } else {
                fatalError("UIViewControllerPreviewing isn't supported on this version of iOS")
            }
        }
        
    }
}