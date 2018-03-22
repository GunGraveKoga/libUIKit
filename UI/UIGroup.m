//
//  UIGroup.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIGroup.h"
#include <libui/ui.h>

@implementation UIGroup

+ (instancetype)group {
    return [[self alloc] init];
}

+ (instancetype)groupWithTitle:(OFString *)title {
    return [[self alloc] initWithTitle:title];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewGroup("");
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    return self;
}

- (instancetype)initWithTitle:(OFString *)title {
    self = [super init];
    
    _uiControl = uiNewGroup(title.UTF8String);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    return self;
}

- (OFString *)title {
    char *title = uiGroupTitle(uiGroup(_uiControl));
    
    OFString *_title;
    
    @try {
        _title = [OFString stringWithUTF8String:title];
    } @finally {
        uiFreeText(title);
    }
    
    return _title;
}

- (void)setTitle:(OFString *)title {
    uiGroupSetTitle(uiGroup(_uiControl), title.UTF8String);
}

- (bool)isMargined {
    return (bool)(uiGroupMargined(uiGroup(_uiControl)));
}

- (void)makeMargined:(bool)margined {
    uiGroupSetMargined(uiGroup(_uiControl), margined);
}

- (void)setChild:(UIControl *)child {
    uiGroupSetChild(uiGroup(_uiControl), child.uiControl);
}

@end
