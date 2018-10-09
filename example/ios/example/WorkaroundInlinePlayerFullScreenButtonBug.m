@import MediaPlayer;
@import ObjectiveC;

static void (*configureAuxiliaryButtonsIMP)(id, SEL, BOOL);

static void ConfigureAuxiliaryButtons(id self, SEL _cmd, BOOL flag)
{
  configureAuxiliaryButtonsIMP(self, _cmd, flag);
  @try
  {
    id delegate = [self delegate]; // Either nil or MPInlineVideoController (responds to `isFullscreen`) or MPInlineVideoFullscreenViewController (does not respond to `isFullscreen`)
    BOOL isFullscreen = [delegate respondsToSelector:@selector(isFullscreen)] ? [delegate isFullscreen] : YES;
    NSString *imageName = [@[ @"Video", @"Player", @"_", isFullscreen ? @"Exit" : @"Enter", @"Fullscreen" ] componentsJoinedByString:@""];
    SEL imageNamedForControlState = NSSelectorFromString([@[ @"_", @"image", @"Named", @":", @"for", @"Control", @"State", @":" ] componentsJoinedByString:@""]);
    UIImage *normalImage = ((UIImage *(*)(id, SEL, NSString *, UIControlState))objc_msgSend)(self, imageNamedForControlState, imageName, UIControlStateNormal);
    UIImage *highlightedImage = ((UIImage *(*)(id, SEL, NSString *, UIControlState))objc_msgSend)(self, imageNamedForControlState, imageName, UIControlStateHighlighted);
    UIButton *fullscreenButton = [self valueForKey:[@[ @"fullscreen", @"Button" ] componentsJoinedByString:@""]];
    [fullscreenButton setImage:normalImage forState:UIControlStateNormal];
    [fullscreenButton setImage:highlightedImage forState:UIControlStateHighlighted];
  }
  @catch (NSException *exception)
  {
    NSLog(@"Failed to workaround inline player fullscreen button bug: %@", exception);
  }
}

void WorkaroundInlinePlayerFullScreenButtonBug(void)
{
  if (![NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){10, 0, 0}])
    return;
  
  Class MPVideoPlaybackOverlayView = NSClassFromString([@[ @"M", @"P", @"Video", @"Playback", @"Overlay", @"View" ] componentsJoinedByString:@""]);
  SEL configureAuxiliaryButtonsSEL = NSSelectorFromString([@[ @"_", @"configure", @"Auxiliary", @"Buttons", @":" ] componentsJoinedByString:@""]);
  NSMethodSignature *methodSignature = [MPVideoPlaybackOverlayView instanceMethodSignatureForSelector:configureAuxiliaryButtonsSEL];
  if (methodSignature.numberOfArguments != 3)
  {
    NSLog(@"Failed to workaround inline player fullscreen button bug (method not found)");
    return;
  }
  
  const char *returnType = methodSignature.methodReturnType;
  const char *argType = [methodSignature getArgumentTypeAtIndex:2];
  if (strcmp(returnType, @encode(void)) != 0 || strcmp(argType, @encode(BOOL)) != 0)
  {
    NSLog(@"Failed to workaround inline player fullscreen button bug (type mismatch)");
    return;
  }
  
  Method configureAuxiliaryButtons = class_getInstanceMethod(MPVideoPlaybackOverlayView, configureAuxiliaryButtonsSEL);
  configureAuxiliaryButtonsIMP = (__typeof__(configureAuxiliaryButtonsIMP))method_getImplementation(configureAuxiliaryButtons);
  method_setImplementation(configureAuxiliaryButtons, (IMP)ConfigureAuxiliaryButtons);
}
