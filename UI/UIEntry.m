//
//  UIEntry.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIEntry.h"
#include <libui/ui.h>

static void _onChangedCallback(uiEntry *entry, void *data) {
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

@interface UIEntry()

- (uiEntry *)_entryType;

@end

@implementation UIEntry

@synthesize delegate = _delegate;

+ (instancetype)entry {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiControl([self _entryType]);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *entryObject = (__bridge void *)self;
    uiEntryOnChanged(uiEntry(_uiControl), &_onChangedCallback, entryObject);
    
    return self;
}

- (OFString *)text {
    char *text = uiEntryText(uiEntry(_uiControl));
    
    OFString *_text;
    
    @try {
        _text = [OFString stringWithUTF8String:text];
    } @finally {
        uiFreeText(text);
    }
    
    return _text;
}

- (void)setText:(OFString *)text {
    uiEntrySetText(uiEntry(_uiControl), text.UTF8String);
}

- (bool)isReadOnly {
    return (bool)(uiEntryReadOnly(uiEntry(_uiControl)));
}

- (void)makeReadOnly:(bool)readOnly {
    uiEntrySetReadOnly(uiEntry(_uiControl), readOnly);
}

- (uiEntry *)_entryType {
    return uiNewEntry();
}

@end

@implementation UIPasswordEntry

- (uiEntry *)_entryType {
    return uiNewPasswordEntry();
}

@end

@implementation UISearchEntry

- (uiEntry *)_entryType {
    return uiNewSearchEntry();
}

@end
