//
//  UIBox.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIBox.h"
#include <libui/ui.h>

@implementation UIBox {
    OFMutableArray<UIControl *> *_controls;
}

+ (instancetype)box {
    return [[self alloc] init];
}

- (instancetype)init {
    if ([self isMemberOfClass:[UIBox class]]) {
        OF_INVALID_INIT_METHOD;
    }
    
    id box = [super init];
    
    ((__typeof__(self))box)->_controls = [OFMutableArray array];
    
    return box;
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
    
    [_controls addObject:control];
}

- (void)appendControl:(UIControl *)control {
    [self appendControl:control stretchy:false];
}

- (UIControl *)controlAtIndex:(int)index {
    return [_controls objectAtIndex:index];
}

- (void)removeControlAtIndex:(int)index {
    uiBoxDelete(uiBox(_uiControl), index);
    [_controls removeObjectAtIndex:index];
}

- (size_t)numControls {
    return _controls.count;
}

- (OFArray<__kindof UIControl *> *)controls {
    return [_controls copy];
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
