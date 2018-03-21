//
//  UIRadioButtons.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIRadioButtons.h"
#include <libui/ui.h>

static void _onSelectedCallback(uiRadioButtons *radioButtons, void *data) {
    @autoreleasepool {
        if (data != NULL) {
            UIRadioButtons *r = (__bridge UIRadioButtons *)data;
            
            if ([r respondsToSelector:@selector(selected)])
                [r selected];
            else {
                __weak id<UIRadioButtonsDelegate> delegate;
                
                if ((delegate = r.delegate) != nil) {
                    __strong id<UIRadioButtonsDelegate> _delegate = delegate;
                    
                    if ([_delegate respondsToSelector:@selector(radioButtonsDidSelected:)])
                        [_delegate radioButtonsDidSelected:r];
                }
            }
        }
    }
}

@implementation UIRadioButtons {
    OFMutableArray OF_GENERIC(id<UIRadioButtonsItem>) *_items;
}

@synthesize delegate = _delegate;

+ (instancetype)radioButtons {
    return [[self alloc] init];
}

+ (instancetype)radioButtonsWithItems:(OFArray OF_GENERIC(id<UIRadioButtonsItem>) *)items {
    return [[self alloc] initWithItems:items];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewRadioButtons();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    _items = [OFMutableArray array];
    
    void *radioButtonsObject = (__bridge void *)self;
    uiRadioButtonsOnSelected(uiRadioButtons(_uiControl), &_onSelectedCallback, radioButtonsObject);
    
    return self;
}

- (instancetype)initWithItems:(OFArray<id<UIRadioButtonsItem>> *)items {
    self = [super init];
    
    _uiControl = uiNewRadioButtons();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    _items = [OFMutableArray arrayWithArray:items];
    
    for (id<UIRadioButtonsItem> item in _items) {
        uiRadioButtonsAppend(uiRadioButtons(_uiControl), [item name].UTF8String);
    }
    
    void *radioButtonsObject = (__bridge void *)self;
    uiRadioButtonsOnSelected(uiRadioButtons(_uiControl), &_onSelectedCallback, radioButtonsObject);
    
    return self;
}

- (OFArray<id<UIRadioButtonsItem>> *)items {
    return [_items copy];
}

- (id<UIRadioButtonsItem>)selectedItem {
    return _items[self.selected];
}

- (int)selectedIndex {
    return uiRadioButtonsSelected(uiRadioButtons(_uiControl));
}

- (void)setSelectedIndex:(int)selected {
    uiRadioButtonsSetSelected(uiRadioButtons(_uiControl), selected);
}

- (void)append:(id<UIRadioButtonsItem>)item {
    [_items addObject:item];
    uiRadioButtonsAppend(uiRadioButtons(_uiControl), [item name].UTF8String);
}

@end
