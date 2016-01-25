//
//  CLLocationManager+RequestLocationPolyfill.h
//  Pods
//
//  Created by James Campbell on 25/01/2016.
//
//

#import <CoreLocation/CoreLocation.h>

//For iPhone 8.0 SDK
#ifndef __IPHONE_9_0
#ifdef __IPHONE_8_0

@interface CLLocationManager (RequestLocationPolyfill)

- (void)requestLocation;

@end

#endif
#endif

@interface CLLocationManager (RequestLocationPolyfill)

- (void)polly_requestLocation;

@end