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
    OFMutableArray OF_GENERIC(UIControl *) *_controls;
}

+ (instancetype)form {
    return [[self alloc] init];
}

+ (instancetype)formWithElements:(OFArray OF_GENERIC(UIControl<UIFormElement> *) *)elements {
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

- (instancetype)initWithElements:(OFArray OF_GENERIC(UIControl<UIFormElement> *) *)elements {
    self = [super init];
    
    _uiControl = uiNewForm();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    _controls = [OFMutableArray array];
    
    return self;
}

@end
