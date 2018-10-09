//
//  RNExploreVideo.h
//  RNExploreYoutube
//
//  Created by Daniel Wilhelmsen on 10/8/18.
//  Copyright © 2018 Facebook. All rights reserved.
//
#import <React/RCTView.h>

extern NSString *const RNExploreVideoEndEvent;

@class RCTEventDispatcher;

@interface RNExploreVideo : UIView
- (instancetype) initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;
@end
