//
//  AppDelegate.m
//  controlgallery
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate {
    UIWindow *_windwo;
}

- (instancetype)init {
    self = [super init];
    
    _windwo = [UIWindow windowWithTitle:@"" size:of_dimension(640, 480)];
    _windwo.delegate = self;
    _windwo.margined = true;
    
    return self;
}

- (void)applicationDidFinishLaunching {
    [_windwo show];
}

- (void)windowContentSizeDidChanged:(nonnull __kindof UIWindow *)sender {
    of_log(@"Content size changed");
}

- (bool)windowWillClosed:(nonnull __kindof UIWindow *)sender {
    of_log(@"Closing window");
    
    return true;
}

@end
