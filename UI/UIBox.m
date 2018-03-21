//
//  UIBox.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIBox.h"
#include <libui/ui.h>

@implementation UIBox

+ (instancetype)box {
    return [[self alloc] init];
}

- (instancetype)init {
    if ([self isMemberOfClass:[UIBox class]]) {
        OF_INVALID_INIT_METHOD;
    }
    
    return [super init];
}

- (bool)isPadded {
    return uiBoxPadded(uiBox(_uiControl));
}

- (void)makePadded:(bool)padded {
    if (self.padded != padded) {
        uiBoxSetPadded(uiBox(_uiControl), padded);
    }
}

- (void)appendControl:(UIControl *)control stretchy:(bool)isStretchy {
    uiBoxAppend(uiBox(_uiControl), control.uiControl, isStretchy);
}

- (void)appendControl:(UIControl *)control {
    uiBoxAppend(uiBox(_uiControl), control.uiControl, 0);
}

- (void)removeControlAtIndex:(int)index {
    uiBoxDelete(uiBox(_uiControl), index);
}

@end


@implementation UIVerticalBox

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewVerticalBox();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    return self;
}

@end

@implementation UIHorizontalBox

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewHorizontalBox();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    return self;
}

@end
