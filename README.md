# Polly

Polyfills for iOS.

[![CI Status](http://img.shields.io/travis/James Campbell/Polly.svg?style=flat)](https://travis-ci.org/James Campbell/Polly)
[![Version](https://img.shields.io/cocoapods/v/Polly.svg?style=flat)](http://cocoapods.org/pods/Polly)
[![License](https://img.shields.io/cocoapods/l/Polly.svg?style=flat)](http://cocoapods.org/pods/Polly)
[![Platform](https://img.shields.io/cocoapods/p/Polly.svg?style=flat)](http://cocoapods.org/pods/Polly)

## Usage

Just import the umbrella header somewhere (I recommend the main.m file) and all polyfills are applied:

```objective-c
#import<Polly/Polly-umbrella>
```

##Polyfills

- UITraitCollection.forceTouchCapability : On iOS 8 this property is implemented and returns `UIForceTouchCapabilityUnavailable`. If you want to use the polyfill in swift then we expose a `polly_forceTouchCapability` property.


## Requirements

## Installation

Polly is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Polly"
```

## Author

James Campbell, james@supmenow.com

## License

Polly is available under the MIT license. See the LICENSE file for more info.
