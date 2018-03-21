//
//  UIEditableCombobox.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIEditableCombobox.h"
#include <libui/ui.h>

static void _onSelectedCallback(uiCombobox *combobox, void *data) {
    @autoreleasepool {
        if (data != NULL) {
            UIControl<UICombobox> *c = (__bridge __typeof__(c))data;
            
            if ([c respondsToSelector:@selector(selected)])
                [c selected];
            else {
                __weak id<UIComboboxDelegate> delegate;
                
                if ((delegate = c.delegate) != nil) {
                    __strong id<UIComboboxDelegate> _delegate = delegate;
                    
                    if ([_delegate respondsToSelector:@selector(comboboxDidChange:)])
                        [_delegate comboboxDidChange:c];
                }
            }
        }
    }
}

@implementation UIEditableCombobox {
    OFMutableArray OF_GENERIC(OFString *) *_items;
}

@synthesize delegate = _delegate;

+ (instancetype)combobox {
    return [[self alloc] init];
}

+ (instancetype)comboboxWithItems:(OFArray OF_GENERIC(OFString *) *)items {
    return [[self alloc] initWithItems:items];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewEditableCombobox();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    _items = [OFMutableArray array];
    
    void *comboboxObject = (__bridge void *)self;
    uiComboboxOnSelected(uiCombobox(_uiControl), &_onSelectedCallback, comboboxObject);
    
    return self;
}

- (instancetype)initWithItems:(OFArray OF_GENERIC(OFString *) *)items {
    self = [super init];
    
    _uiControl = uiNewEditableCombobox();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    _items = [OFMutableArray arrayWithArray:items];
    
    for (OFString *item in _items) {
        uiEditableComboboxAppend(uiEditableCombobox(_uiControl), item.UTF8String);
    }
    
    void *comboboxObject = (__bridge void *)self;
    uiComboboxOnSelected(uiCombobox(_uiControl), &_onSelectedCallback, comboboxObject);
    
    return self;
}

- (OFArray OF_GENERIC(OFString *) *)items {
    return [_items copy];
}

- (OFString *)currentText {
    char *text = uiEditableComboboxText(uiEditableCombobox(_uiControl));
    
    OFString *_text;
    
    @try {
        _text = [OFString stringWithUTF8String:text];
    } @finally {
        uiFreeText(text);
    }
    
    return _text;
}

- (void)setCurrentText:(OFString *)currentText {
    uiEditableComboboxSetText(uiEditableCombobox(_uiControl), currentText.UTF8String);
}

- (void)append:(OFString *)text {
    [_items addObject:text];
    uiEditableComboboxAppend(uiEditableCombobox(_uiControl), text.UTF8String);
}

@end
