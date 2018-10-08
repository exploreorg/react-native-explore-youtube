@import UIKit;
#import <React/RCTViewManager.h>
#import <MapKit/MapKit.h>

@interface RNExploreYoutubeManager : RCTViewManager <MKMapViewDelegate>
@property (nonatomic, weak) IBOutlet UIView *videoContainerView;
@property (nonatomic, weak) UIView *view;
@end
