#import "RNExploreYoutubeManager.h"
#import "RNExploreVideo.h"
#import <React/RCTBridge.h>
#import <React/RCTUIManager.h>

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

RCT_EXPORT_METHOD(toggleFullscreen:(nonnull NSNumber *)reactTag)
{
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, RNExploreVideo *> *viewRegistry) {
        RNExploreVideo *view = viewRegistry[reactTag];
        if (![view isKindOfClass:[RNExploreVideo class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting RCTWebViewBridge, got: %@", view);
        } else {
            [view toggleFullscreen];
        }
    }];
}
@end

