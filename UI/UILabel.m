//
//  UILabel.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UILabel.h"
#include <libui/ui.h>

@implementation UILabel

+ (instancetype)label {
    return [[self alloc] init];
}

+ (instancetype)labelWithText:(OFString *)text {
    return [[self alloc] initWithText:text];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewLabel("");
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    return self;
}

- (instancetype)initWithText:(OFString *)text {
    self = [super init];
    
    _uiControl = uiNewLabel(text.UTF8String);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    return self;
}

- (OFString *)text {
    char *text = uiLabelText(uiLabel(_uiControl));
    
    OFString *_text;
    
    @try {
        _text = [OFString stringWithUTF8String:text];
    } @finally {
        uiFreeText(text);
    }
    
    return _text;
}

- (void)setText:(OFString *)text {
    uiLabelSetText(uiLabel(_uiControl), text.UTF8String);
}

@end
