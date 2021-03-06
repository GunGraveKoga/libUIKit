//
//  UICombobox.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UICombobox.h"
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

@implementation UICombobox {
    OFMutableArray<OFString *> *_items;
}

@synthesize delegate = _delegate;

+ (instancetype)combobox {
    return [[self alloc] init];
}

+ (instancetype)comboboxWithItems:(OFArray<__kindof OFString *> *)items {
    return [[self alloc] initWithItems:items];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewCombobox();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    _items = [OFMutableArray array];
    
    void *comboboxObject = (__bridge void *)self;
    uiComboboxOnSelected(uiCombobox(_uiControl), &_onSelectedCallback, comboboxObject);
    
    return self;
}

- (instancetype)initWithItems:(OFArray<__kindof OFString *> *)items {
    self = [super init];
    
    _uiControl = uiNewCombobox();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    _items = [OFMutableArray arrayWithArray:items];
    
    for (OFString *item in _items) {
        uiComboboxAppend(uiCombobox(_uiControl), item.UTF8String);
    }
    
    void *comboboxObject = (__bridge void *)self;
    uiComboboxOnSelected(uiCombobox(_uiControl), &_onSelectedCallback, comboboxObject);
    
    return self;
}

- (OFString *)currentText {
    return _items[self.selected];
}

- (int)selectedIndex {
    return uiComboboxSelected(uiCombobox(_uiControl));
}

- (void)setSelectedIndex:(int)selected {
    uiComboboxSetSelected(uiCombobox(_uiControl), selected);
}

- (void)append:(OFString *)text {
    [_items addObject:text];
    uiComboboxAppend(uiCombobox(_uiControl), text.UTF8String);
}

- (OFArray<__kindof OFString *> *)items {
    return [_items copy];
}

@end
