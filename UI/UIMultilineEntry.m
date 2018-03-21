//
//  UIMultilineEntry.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIMultilineEntry.h"
#include <libui/ui.h>

static void _onChangedCallback(uiMultilineEntry *entry, void *data) {
    @autoreleasepool {
        if (data != NULL) {
            UIControl<UIEntry> *e = (__bridge __typeof__(e))data;
            
            if ([e respondsToSelector:@selector(changed)])
                [e changed];
            else {
                __weak id<UIEntryDelegate> delegate;
                
                if ((delegate = e.delegate) != nil) {
                    __strong id<UIEntryDelegate> _delegate = delegate;
                    
                    if ([_delegate respondsToSelector:@selector(entryDidChanged:)])
                        [_delegate entryDidChanged:e];
                }
            }
        }
    }
}

@implementation UIMultilineEntry

@synthesize delegate = _delegate;

+ (instancetype)entry {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewMultilineEntry();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *entryObject = (__bridge void *)self;
    
    uiMultilineEntryOnChanged(uiMultilineEntry(_uiControl), &_onChangedCallback, entryObject);
    
    return self;
}

- (OFString *)text {
    char *text = uiMultilineEntryText(uiMultilineEntry(_uiControl));
    
    OFString *_text;
    
    @try {
        _text = [OFString stringWithUTF8String:text];
    } @finally {
        uiFreeText(text);
    }
    
    return _text;
}

- (void)setText:(OFString *)text {
    uiMultilineEntrySetText(uiMultilineEntry(_uiControl), text.UTF8String);
}

- (bool)isReadOnly {
    return (bool)(uiMultilineEntryReadOnly(uiMultilineEntry(_uiControl)));
}

- (void)makeReadOnly:(bool)readOnly {
    if (self.readOnly != readOnly) {
        uiMultilineEntrySetReadOnly(uiMultilineEntry(_uiControl), readOnly);
    }
}

- (void)appendText:(OFString *)text {
    uiMultilineEntryAppend(uiMultilineEntry(_uiControl), text.UTF8String);
}

@end
