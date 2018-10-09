#import "RNExploreYoutubeManager.h"
#import "RNExploreVideo.h"
#import <React/RCTBridge.h>

@implementation RNExploreYoutubeManager

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;

- (UIView *)view
{
    return [[RNExploreVideo alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

- (NSDictionary *)customDirectEventTypes
{
    return @{
            RNExploreVideoEndEvent: @{
                    @"registrationName": @"onVideoEnd"
            }
     };
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_VIEW_PROPERTY(identifier, NSString);
@end

