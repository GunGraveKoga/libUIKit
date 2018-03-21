//
//  UIButton.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIButton.h"
#include <libui/ui.h>

static void _onClickCallback(uiButton *button, void *data) {
    @autoreleasepool {
        if (data != NULL) {
            UIButton *b = (__bridge UIButton *)data;
            
            if ([b respondsToSelector:@selector(clicked)])
                [b clicked];
            else {
                __weak id<UIButtonDelegate> delegate;
                
                if ((delegate = b.delegate) != nil) {
                    __strong __typeof__(delegate) _delegate = delegate;
                    
                    if ([_delegate respondsToSelector:@selector(pressed:)])
                        [_delegate pressed:b];
                }
            }
        }
    }
}

@implementation UIButton

@synthesize delegate = _delegate;

+ (instancetype)button {
    return [[self alloc] init];
}

+ (instancetype)buttonWithText:(OFString *)text {
    return [[self alloc] initWithText:text];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewButton("");
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *buttonObject = (__bridge void *)self;
    uiButtonOnClicked(uiButton(_uiControl), &_onClickCallback, buttonObject);
    
    return self;
}

- (instancetype)initWithText:(OFString *)text {
    self = [super init];
    
    _uiControl = uiNewButton(text.UTF8String);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *buttonObject = (__bridge void *)self;
    uiButtonOnClicked(uiButton(_uiControl), &_onClickCallback, buttonObject);
    
    return self;
}

- (OFString *)text {
    char *text = uiButtonText(uiButton(_uiControl));
    
    OFString *_text;
    
    @try {
        _text = [OFString stringWithUTF8String:text];
    } @finally {
        uiFreeText(text);
    }
    
    return _text;
}

- (void)setText:(OFString *)text {
    uiButtonSetText(uiButton(_uiControl), text.UTF8String);
}

@end
