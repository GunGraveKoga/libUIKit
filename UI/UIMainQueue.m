//
//  UIMainQueue.m
//  UIKit
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UI.h"
#include <libui/ui.h>

static id<UIApplicationDelegate> __delegate = nil;

@interface UIMainQueue()
#ifdef OF_HAVE_CLASS_PROPERTIES
@property (class, nonatomic, readwrite) id<UIApplicationDelegate> delegate;
#endif
+ (void)setDelegate:(id<UIApplicationDelegate>)delegate;
- (instancetype)ui_init OF_METHOD_FAMILY(init);


@end

@implementation UIMainQueue

+ (id<UIApplicationDelegate>)delegate {
    return __delegate;
}

+ (void)setDelegate:(id<UIApplicationDelegate>)delegate {
    __delegate = delegate;
}

+ (void)start {
    uiMain();
}

+ (void)terminate {
    uiQuit();
}

+ (void)steps {
    uiMainSteps();
}

+ (void)step:(bool)wait {
    uiMainStep(wait);
}

- (instancetype)init {
    OF_INVALID_INIT_METHOD;
}

- (instancetype)ui_init {
    self = [super init];
    
    return self;
}

@end
