//
//  UITab.m
//  UIKit
//
//  Created by Yury Vovk on 21.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UITab.h"
#include <libui/ui.h>

@implementation UITab {
    OFMutableArray<UIControl *> *_pages;
}

+ (instancetype)tab {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewTab();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    _pages = [OFMutableArray array];
    
    return self;
}

- (int)numPages {
    return uiTabNumPages(uiTab(_uiControl));
}

- (UIControl *)pageAtIndex:(int)index {
    if (index >= self.numPages)
        return nil;
    
    return [_pages objectAtIndex:index];
}

- (void)appendControl:(UIControl *)control withName:(OFString *)name {
    uiTabAppend(uiTab(_uiControl), name.UTF8String, control.uiControl);
    [_pages addObject:control];
}

- (void)appendControl:(UIControl<UILabeledControl> *)control {
    [self appendControl:control withName:control.label];
}

- (void)insertControl:(UIControl *)control withName:(OFString *)name before:(int)index {
    uiTabInsertAt(uiTab(_uiControl), name.UTF8String, index, control.uiControl);
    [_pages insertObject:control atIndex:index];
}

- (void)insertControl:(UIControl<UILabeledControl> *)control before:(int)index {
    [self insertControl:control withName:control.label before:index];
}

- (void)removeControlAtIndex:(int)index {
    uiTabDelete(uiTab(_uiControl), index);
    [_pages removeObjectAtIndex:index];
}

- (bool)isControlAtIndexMargined:(int)index {
    return (bool)(uiTabMargined(uiTab(_uiControl), index));
}

- (void)makeControlAtIndex:(int)index margine:(bool)margined {
    uiTabSetMargined(uiTab(_uiControl), index, margined);
}

@end
