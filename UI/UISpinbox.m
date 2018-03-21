//
//  UISpinbox.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UISpinbox.h"
#include <libui/ui.h>

static void _onChangedCallback(uiSpinbox *spinbox, void *data) {
    @autoreleasepool {
        if (data != NULL) {
            UISpinbox *s = (__bridge UISpinbox *)data;
            
            if ([s respondsToSelector:@selector(changed)])
                [s changed];
            else {
                __weak id<UISpinboxDelegate> delegate;
                
                if ((delegate = s.delegate) != nil) {
                    __strong id<UISpinboxDelegate> _delegate = delegate;
                    
                    if ([_delegate respondsToSelector:@selector(spinboxValueChanged:)])
                        [_delegate spinboxValueChanged:s];
                }
            }
        }
    }
}

@implementation UISpinbox

@synthesize delegate = _delegate;
@synthesize minValue = _min, maxValue = _max;

+ (instancetype)spinbox {
    return [[self alloc] init];
}

+ (instancetype)spinboxWithMin:(int)min max:(int)max {
    return [[self alloc] initWithMin:min max:max];
}

- (instancetype)init {
    self = [super init];
    
    _min = INT_MIN;
    _max = INT_MAX;
    
    _uiControl = uiNewSpinbox(_min, _max);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *spinboxObject = (__bridge void *)self;
    uiSpinboxOnChanged(uiSpinbox(_uiControl), &_onChangedCallback, spinboxObject);
    
    return self;
}

- (instancetype)initWithMin:(int)min max:(int)max {
    self = [super init];
    
    _min = min;
    _max = max;
    
    _uiControl = uiNewSpinbox(_min, _max);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *spinboxObject = (__bridge void *)self;
    uiSpinboxOnChanged(uiSpinbox(_uiControl), &_onChangedCallback, spinboxObject);
    
    return self;
}

- (int)value {
    return uiSpinboxValue(uiSpinbox(_uiControl));
}

- (void)setValue:(int)value {
    if (value < _min || value > _max)
        @throw [OFOutOfRangeException exception];
    
    uiSpinboxSetValue(uiSpinbox(_uiControl), value);
}

@end
