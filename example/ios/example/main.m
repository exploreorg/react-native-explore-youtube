/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

extern void WorkaroundInlinePlayerFullScreenButtonBug(void);

int main(int argc, char * argv[]) {
  @autoreleasepool {
    WorkaroundInlinePlayerFullScreenButtonBug();
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
  }
}
