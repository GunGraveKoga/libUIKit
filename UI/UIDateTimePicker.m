//
//  UIDateTimePicker.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIDateTimePicker.h"
#include <libui/ui.h>

@interface UIDateTimePicker()

- (uiDateTimePicker *)_dateTimePickerType;

@end

@implementation UIDateTimePicker

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiControl([self _dateTimePickerType]);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    return self;
}

- (uiDateTimePicker *)_dateTimePickerType {
    return uiNewDateTimePicker();
}

@end

@implementation UIDatePicker

- (uiDateTimePicker *)_dateTimePickerType {
    return uiNewDatePicker();
}

@end

@implementation UITimePicker

- (uiDateTimePicker *)_dateTimePickerType {
    return uiNewTimePicker();
}

@end
