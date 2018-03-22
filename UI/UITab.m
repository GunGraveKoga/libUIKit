//
//  UITab.m
//  UIKit
//
//  Created by Yury Vovk on 21.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UITab.h"
#include <libui/ui.h>

@interface UITabPage()

- (instancetype)ui_initWithTab:(uiTab *)tab index:(int)idx OF_METHOD_FAMILY(init);

@end

@implementation UITabPage {
    uiTab * _tab;
    int _idx;
}

- (instancetype)ui_initWithTab:(uiTab *)tab index:(int)idx {
    self = [super init];
    
    _tab = tab;
    
    if (_tab == NULL) return nil;
    
    _idx = idx;
    
    return self;
}

- (bool)isMargined {
    return (bool)(uiTabMargined(_tab, _idx));
}

- (void)makeMargined:(bool)margined {
    uiTabSetMargined(_tab, _idx, margined);
}

@end

@implementation UITab {
    OFMutableArray OF_GENERIC(UIControl *) *_pages;
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

- (void)insertControl:(UIControl *)control withName:(OFString *)name before:(int)index {
    uiTabInsertAt(uiTab(_uiControl), name.UTF8String, index, control.uiControl);
    [_pages insertObject:control atIndex:index];
}

- (void)removeControlAtIndex:(int)index {
    uiTabDelete(uiTab(_uiControl), index);
    [_pages removeObjectAtIndex:index];
}

@end

@implementation UITab (Subscripting)

- (UIControl<UITabPage> *)objectAtIndexedSubscript:(int)index {
    if (index >= self.numPages)
        return nil;
    
    return (UIControl<UITabPage> *)[_pages objectAtIndex:index];
}

- (void)setObject:(UIControl<UITabPage> *)object atIndexedSubscript:(int)index {
    if (object == nil)
        [self removeControlAtIndex:index];
    else
        [self insertControl:object withName:object.name before:index];
}

@end
