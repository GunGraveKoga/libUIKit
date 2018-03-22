//
//  UIMenuItem.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIMenuItem.h"
#include <libui/ui.h>

@interface UIMenuItem()

- (void)_setUiControl:(uiControl *)control;

@end

@implementation UIMenuItem

@synthesize name = _name;

+ (instancetype)itemWithName:(OFString *)name {
    return [[self alloc] initWithName:name];
}

- (instancetype)init {
    if ([self isMemberOfClass:[UIMenuItem class]]) {
        OF_INVALID_INIT_METHOD;
    }
    
    return [super init];
}

- (instancetype)initWithName:(OFString *)name {
    self = [super init];
    
    _name = [name copy];
    
    return self;
}

- (bool)isChecked {
    return (bool)(uiMenuItemChecked(uiMenuItem(_uiControl)));
}

- (void)makeChecked:(bool)checked {
    uiMenuItemSetChecked(uiMenuItem(_uiControl), checked);
}

- (void)enable {
    uiMenuItemEnable(uiMenuItem(_uiControl));
}

- (void)disable {
    uiMenuItemDisable(uiMenuItem(_uiControl));
}

- (void)_setUiControl:(uiControl *)control {
    _uiControl = control;
    _owner = false;
}

@end
