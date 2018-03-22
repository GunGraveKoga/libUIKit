//
//  UICheckBox.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UICheckbox.h"
#include <libui/ui.h>

static void _onToggledCallback(uiCheckbox *checkbox, void *data) {
    @autoreleasepool {
        if (data != NULL) {
            UICheckbox *c = (__bridge UICheckbox *)data;
            
            if ([c respondsToSelector:@selector(toggled)])
                [c toggled];
            else {
                __weak id<UICheckboxDelegate> delegate;
                
                if ((delegate = c.delegate) != nil) {
                    __strong id<UICheckboxDelegate> _delegate = delegate;
                    
                    if ([_delegate respondsToSelector:@selector(checkboxToggled:)])
                        [_delegate checkboxToggled:c];
                }
            }
        }
    }
}

@implementation UICheckbox

@synthesize delegate = _delegate;

+ (instancetype)checkbox {
    return [[self alloc] init];
}

+ (instancetype)checkboxWithText:(OFString *)text {
    return [[self alloc] initWithText:text];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewCheckbox("");
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *checkboxObject = (__bridge void *)self;
    uiCheckboxOnToggled(uiCheckbox(_uiControl), &_onToggledCallback, checkboxObject);
    
    return self;
}

- (instancetype)initWithText:(OFString *)text {
    self = [super init];
    
    _uiControl = uiNewCheckbox(text.UTF8String);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *checkboxObject = (__bridge void *)self;
    uiCheckboxOnToggled(uiCheckbox(_uiControl), &_onToggledCallback, checkboxObject);
    
    return self;
}

- (OFString *)text {
    char *text = uiCheckboxText(uiCheckbox(_uiControl));
    
    OFString *_text;
    
    @try {
        _text = [OFString stringWithUTF8String:text];
    } @finally {
        uiFreeText(text);
    }
    
    return _text;
}

- (void)setText:(OFString *)text {
    uiCheckboxSetText(uiCheckbox(_uiControl), text.UTF8String);
}

- (bool)isChecked {
    return (bool)(uiCheckboxChecked(uiCheckbox(_uiControl)));
}

- (void)makeChecked:(bool)checked {
    uiCheckboxSetChecked(uiCheckbox(_uiControl), checked);
}

@end
