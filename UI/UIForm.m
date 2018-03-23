//
//  UIForm.m
//  UIKit
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIForm.h"
#import <libui/ui.h>

@implementation UIForm {
    OFMutableArray<UIControl *> *_controls;
}

+ (instancetype)form {
    return [[self alloc] init];
}

+ (instancetype)formWithElements:(OFArray<__kindof UIControl<UILabeledControl> *> *)elements {
    return [[self alloc] initWithElements:elements];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewForm();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    _controls = [OFMutableArray array];
    
    return self;
}

- (instancetype)initWithElements:(OFArray<__kindof UIControl<UILabeledControl> *> *)elements {
    self = [super init];
    
    _uiControl = uiNewForm();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    _controls = [OFMutableArray arrayWithArray:elements];
    
    for (UIControl<UILabeledControl> *elemnt in elements)
        uiFormAppend(uiForm(_uiControl), elemnt.label.UTF8String, elemnt.uiControl, 0);
    
    return self;
}

- (bool)isPadded {
    return (bool)(uiFormPadded(uiForm(_uiControl)));
}

- (void)makePadded:(bool)padded {
    uiFormSetPadded(uiForm(_uiControl), padded);
}

- (OFArray *)controls {
    return [_controls copy];
}

- (size_t)numControls {
    return _controls.count;
}

- (void)appendControl:(UIControl *)control withLabel:(OFString *)label {
    uiFormAppend(uiForm(_uiControl), label.UTF8String, control.uiControl, 0);
    [_controls addObject:control];
}

- (void)appendControl:(UIControl<UILabeledControl> *)control {
    [self appendControl:control withLabel:control.label];
}

- (void)appendControl:(UIControl *)control withLabel:(OFString *)label stretchy:(bool)isStretchy {
    uiFormAppend(uiForm(_uiControl), label.UTF8String, control.uiControl, isStretchy);
}

- (void)appendControl:(UIControl<UILabeledControl> *)control stretchy:(bool)isStretchy {
    [self appendControl:control withLabel:control.label stretchy:isStretchy];
}

- (void)removeControlAtIndex:(int)index {
    uiFormDelete(uiForm(_uiControl), index);
    [_controls removeObjectAtIndex:index];
}

- (__kindof UIControl *)controlAtIndex:(int)index {
    return [_controls objectAtIndex:index];
}

@end
