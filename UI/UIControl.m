//
//  UIControl.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"
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
    return [[UIControl alloc] initWithControl:uiControlParent(uiControl(_uiControl))];
}

- (void)setParent:(UIControl *)parent {
    uiControlSetParent(uiControl(self->_uiControl), parent.uiControl);
}

- (bool)isVisible {
    return (bool)(uiControlToplevel(uiControl(_uiControl)));
}

- (bool)isEnabled {
    return (bool)(uiControlEnabled(uiControl(_uiControl)));
}

- (bool)isOnTopLevel {
    return (bool)(uiControlToplevel(uiControl(_uiControl)));
}

- (bool)isEnabledToUser {
    return (bool)(uiControlEnabledToUser(uiControl(_uiControl)));
}

- (void)show {
    if (!(uiControlToplevel(uiControl(_uiControl)))) {
        uiControlShow(uiControl(_uiControl));
    }
}

- (void)hide {
    if ((uiControlToplevel(uiControl(_uiControl)))) {
        uiControlHide(uiControl(_uiControl));
    }
}

- (void)enable {
    if (!(uiControlEnabled(uiControl(_uiControl)))) {
        uiControlEnable(uiControl(_uiControl));
    }
}

- (void)disable {
    if ((uiControlEnabled(uiControl(_uiControl)))) {
        uiControlDisable(uiControl(_uiControl));
    }
}

@end
