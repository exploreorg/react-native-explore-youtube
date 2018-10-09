//
//  RNExploreVideo.m
//  RNExploreYoutube
//
//  Created by Daniel Wilhelmsen on 10/8/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCDYouTubeKit/XCDYouTubeKit.h>
#import <React/RCTEventDispatcher.h>

#import "UIView+React.h"
#import "RNExploreVideo.h"

NSString *const RNExploreVideoEndEvent = @"exploreorg_youtubeplayer_videoEnd";

@implementation RNExploreVideo {
    XCDYouTubeVideoPlayerViewController *_moviePlayer;
    RCTEventDispatcher *_eventDispatcher;
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    if((self = [super init])) {
        _eventDispatcher = eventDispatcher;
    }
    
    return self;
}

- (void)setIdentifier:(NSString *)video
{
    _moviePlayer = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:video];
    [_moviePlayer presentInView:self];
    [_moviePlayer.moviePlayer play];
    [_moviePlayer.moviePlayer setFullscreen:YES];
}

- (void)attachListeners
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

- (void)playbackFinished:(NSNotification*)notification {
    [_eventDispatcher sendInputEventWithName:RNExploreVideoEndEvent body:@{
                                                                           @"target":self.reactTag
                                                                           }];
}

#pragma mark - React View Management

- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex
{
    //RCTLogError(@"video cannot have any subviews");
    return;
}

- (void)removeReactSubview:(UIView *)subview
{
    //RCTLogError(@"video cannot have any subviews");
    return;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [CATransaction begin];
    [CATransaction setAnimationDuration:0];
    _moviePlayer.view.frame = self.bounds;
    [CATransaction commit];
}

- (void)removeFromSuperview
{
    
    //[_moviePlayer pause];
    _moviePlayer = nil;
    _eventDispatcher = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [super removeFromSuperview];
}
@end
