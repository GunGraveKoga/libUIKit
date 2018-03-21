//
//  UISlider.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UISlider.h"
#include <libui/ui.h>

static void _onChangedCallback(uiSlider *slider, void *data) {
    @autoreleasepool {
        if (data != NULL) {
            UISlider *s = (__bridge UISlider *)data;
            
            if ([s respondsToSelector:@selector(changed)])
                [s changed];
            else {
                __weak id<UISliderDelegate> delegate;
                
                if ((delegate = s.delegate) != nil) {
                    __strong id<UISliderDelegate> _delegate = delegate;
                    
                    if ([_delegate respondsToSelector:@selector(sliderDidChanged:)])
                        [_delegate sliderDidChanged:s];
                }
            }
        }
    }
}

@implementation UISlider

@synthesize delegate = _delegate;
@synthesize minValue = _min, maxValue = _max;

+ (instancetype)slider {
    return [[self alloc] init];
}

+ (instancetype)sliderWithMin:(int)min max:(int)max {
    return [[self alloc] initWithMin:min max:max];
}

- (instancetype)init {
    self = [super init];
    
    _min = INT_MIN;
    _max = INT_MAX;
    
    _uiControl = uiNewSlider(_min, _max);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *sliderObject = (__bridge void *)self;
    
    uiSliderOnChanged(uiSlider(_uiControl), &_onChangedCallback, sliderObject);
    
    return self;
}

- (instancetype)initWithMin:(int)min max:(int)max {
    self = [super init];
    
    _min = min;
    _max = max;
    
    _uiControl = uiNewSlider(_min, _max);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *sliderObject = (__bridge void *)self;
    
    uiSliderOnChanged(uiSlider(_uiControl), &_onChangedCallback, sliderObject);
    
    return self;
}

- (int)value {
    return uiSliderValue(uiSlider(_uiControl));
}

- (void)setValue:(int)value {
    if (value < _min || value > _max)
        @throw [OFOutOfRangeException exception];
    
    uiSliderSetValue(uiSlider(_uiControl), value);
}

@end
