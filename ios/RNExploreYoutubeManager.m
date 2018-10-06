#import <MapKit/MapKit.h>

#import <React/RCTViewManager.h>
//#import <XCDYouTubeKit/XCDYouTubeKit.h>

@interface RNExploreYoutubeManager : RCTViewManager
/*@property (nonatomic, strong) XCDYouTubeVideoPlayerViewController *videoPlayerViewController;
@property (nonatomic, weak) IBOutlet UIView *videoContainerView;*/
@end

@implementation RNExploreYoutubeManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
/*    self.videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"9bZkp7q19f0"];
    [self.videoPlayerViewController presentInView:self.videoContainerView];
    [self.videoPlayerViewController.moviePlayer play];

    return self.videoContainerView;*/
    return [[MKMapView alloc] init];
}

@end

