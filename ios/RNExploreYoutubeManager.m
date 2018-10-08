#import "RNExploreYoutubeManager.h"
#import <MapKit/MapKit.h>
#import <React/RCTViewManager.h>

#import "RNTMapView.h"
#import "RCTConvert+Mapkit.h"
#import <XCDYouTubeKit/XCDYouTubeKit.h>

@interface RNExploreYoutubeManager ()
@property (nonatomic, strong) XCDYouTubeVideoPlayerViewController *videoPlayerViewController;
@end

@implementation RNExploreYoutubeManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(zoomEnabled, BOOL) 
RCT_EXPORT_VIEW_PROPERTY(onRegionChange, RCTBubblingEventBlock)

RCT_CUSTOM_VIEW_PROPERTY(region, MKCoordinateRegion, MKMapView)
{
  [view setRegion:json ? [RCTConvert MKCoordinateRegion:json] : defaultView.region animated:YES];
}

- (UIView *)view
{
    if (_view == nil) {
        /*XCDYouTubeVideoPlayerViewController *movieController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"9bZkp7q19f0"];
        movieController.view.frame = CGRectMake(10, 10, 300, 300);
        UIView *viewWrap = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        [movieController presentInView:viewWrap];
        [self.view addSubview:viewWrap];
        [movieController.moviePlayer play];
        _view = viewWrap;*/
        
        
        self.videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"9bZkp7q19f0"];
        self.videoPlayerViewController.view.contentMode = UIViewContentModeTopLeft;
        self.videoPlayerViewController.view.frame = CGRectMake(10, 10, 300, 300);
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        v.contentMode = UIViewContentModeTopLeft;
        [self.videoPlayerViewController presentInView:v];
        [self.videoPlayerViewController.moviePlayer play];
        _view = v;
    }
    
    return _view;
    [self.videoContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"9bZkp7q19f0"];
    [self.videoPlayerViewController presentInView:self.videoContainerView];
    [self.videoPlayerViewController.moviePlayer play];

    return self.videoContainerView;
    RNTMapView *map = [RNTMapView new];
    map.delegate = self;
    return map;
}

#pragma mark MKMapViewDelegate

- (void)mapView:(RNTMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
  if (!mapView.onRegionChange) {
    return;
  }

  MKCoordinateRegion region = mapView.region;
  mapView.onRegionChange(@{
    @"region": @{
      @"latitude": @(region.center.latitude),
      @"longitude": @(region.center.longitude),
      @"latitudeDelta": @(region.span.latitudeDelta),
      @"longitudeDelta": @(region.span.longitudeDelta),
    }
  });
}

@end

