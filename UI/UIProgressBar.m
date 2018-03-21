//
//  UIProgressBar.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIProgressBar.h"
#include <libui/ui.h>

@implementation UIProgressBar

+ (instancetype)progressBar {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewProgressBar();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    return self;
}

- (int)value {
    return uiProgressBarValue(uiProgressBar(_uiControl));
}

- (void)setValue:(int)value {
    uiProgressBarSetValue(uiProgressBar(_uiControl), value);
}

@end
