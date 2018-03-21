//
//  UIControl.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"
#import "UIWindow.h"
#include <libui/ui.h>

@implementation UIControl

- (instancetype)initWithControl:(void *)control {
    self = [super init];
    
    _uiControl = control;
    _owner = false;
    
    return self;
}

- (uiControl *)uiControl {
    return uiControl(_uiControl);
}

- (void *)uiControlHandle {
    return (void *)(uiControlHandle(uiControl(_uiControl)));
}

- (UIControl *)parent {
    
    uiControl *_parent = uiControl(_uiControl);
    
    if (_parent != NULL)
        return [[UIControl alloc] initWithControl:uiControlParent(_parent)];
    
    return nil;
}

- (void)setParent:(UIControl *)parent {
    uiControlSetParent(uiControl(self->_uiControl), parent.uiControl);
}

- (bool)isVisible {
    return (bool)(uiControlToplevel(uiControl(_uiControl)));
}

- (void)makeVisible:(bool)visible {
    if (self.visible != visible) {
        if (visible) uiControlShow(uiControl(_uiControl));
        else uiControlHide(uiControl(_uiControl));
    }
}

- (bool)isEnabled {
    return (bool)(uiControlEnabled(uiControl(_uiControl)));
}

- (void)makeEnabled:(bool)enabled {
    if (self.enabled != enabled) {
        if (enabled) uiControlEnable(uiControl(_uiControl));
        else uiControlDisable(uiControl(_uiControl));
    }
}

- (bool)isOnTopLevel {
    return (bool)(uiControlToplevel(uiControl(_uiControl)));
}

- (bool)isEnabledToUser {
    return (bool)(uiControlEnabledToUser(uiControl(_uiControl)));
}

- (UIWindow *)findWindow {
    UIControl *parent;
    
    while ((parent = self.parent) != nil) {
        if ([parent isKindOfClass:[UIWindow class]])
            break;
    }
    
    return (UIWindow *)parent;
}

- (bool)isEqual:(id)object {
    if (![super isEqual:object]) {
        return _uiControl == ((__typeof__(self))object).uiControl;
    }
    
    return true;
}

- (uint32_t)hash {
    uint32_t hash = 0;
    
    OF_HASH_INIT(hash);
    OF_HASH_ADD_HASH(hash, [super hash]);
    
    uint8_t *ptr = (uint8_t *)_uiControl;
    
    
    for (int i = 0; i < sizeof(_uiControl); i++)
        OF_HASH_ADD(hash, ptr[i]);
    
    OF_HASH_FINALIZE(hash);
    
    return hash;
}

- (void)dealloc {
    if (_owner) {
        uiControlDestroy(uiControl(_uiControl));
    }
}

@end
