//
//  UIWindow.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIWindow.h"
#include <libui/ui.h>

@interface UIWindow()

- (void)_invalidateHandle;

@end

static void _onContentSizeChangedCallback(uiWindow * window, void *data) {
    @autoreleasepool {
        if (data != NULL) {
            UIWindow *w = (__bridge UIWindow *)data;
            
            if ([w respondsToSelector:@selector(contentSizeDidChanged)])
                [w contentSizeDidChanged];
            else {
                __weak id<UIWindowDelegate> delegate;
                
                if ((delegate = w.delegate) != nil) {
                    __strong id<UIWindowDelegate> _delegate = delegate;
                    
                    if ([_delegate respondsToSelector:@selector(windowContentSizeDidChanged:)])
                        [_delegate windowContentSizeDidChanged:w];
                }
            }
        }
    }
}

static int _onCloseCallback(uiWindow *window, void *data) {
    @autoreleasepool {
        if (data != NULL) {
            UIWindow *w = (__bridge UIWindow *)data;
            
            if ([w respondsToSelector:@selector(willClosed)]) {
                if ([w willClosed]) {
                    [w _invalidateHandle];
                    
                    return 1;
                }
            }
            else {
                __weak id<UIWindowDelegate> delegate;
                
                if ((delegate = w.delegate) != nil) {
                    __strong id<UIWindowDelegate> _delegate = delegate;
                    
                    if ([_delegate respondsToSelector:@selector(windowWillClosed:)]) {
                        if ([_delegate windowWillClosed:w]) {
                            [w _invalidateHandle];
                            
                            return 1;
                        }
                    }
                }
            }
        }
        
        return 0;
    }
}

@implementation UIWindow {
    UIControl *_child;
}

@synthesize delegate = _delegate;

+ (instancetype)windowWithTitle:(OFString *)title size:(of_dimension_t)size {
    return [[self alloc] initWithTitle:title size:size menubar:true];
}

+ (instancetype)windowWithTitle:(OFString *)title size:(of_dimension_t)size menubar:(bool)hasMenubar {
    return [[self alloc] initWithTitle:title size:size menubar:hasMenubar];
}

- (instancetype)init {
    if ([self isMemberOfClass:[UIWindow class]]) {
        OF_INVALID_INIT_METHOD;
    }
    
    return [super init];
}

- (instancetype)initWithTitle:(OFString *)title size:(of_dimension_t)size menubar:(bool)hasMenubar {
    self = [super init];
    
    _uiControl = uiNewWindow(title.UTF8String, size.width, size.height, hasMenubar);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    void *windowObject = (__bridge void *)self;
    
    uiWindowOnClosing(uiWindow(_uiControl), &_onCloseCallback, windowObject);
    uiWindowOnContentSizeChanged(uiWindow(_uiControl), &_onContentSizeChangedCallback, windowObject);
    
    return self;
}

- (void)setChild:(UIControl *)childControl {
    UIControl *oldChild = _child;
    
    uiWindowSetChild(uiWindow(_uiControl), childControl.uiControl);
    
    _child = childControl;
    oldChild = nil;
}

- (OFString *)title {
    char *title = uiWindowTitle(uiWindow(_uiControl));
    OFString *_title;
    
    @try {
        _title = [OFString stringWithUTF8String:title];
    } @finally {
        uiFreeText(title);
    }
    
    
    return _title;
}

- (void)setTitle:(OFString *)title {
    uiWindowSetTitle(uiWindow(_uiControl), title.UTF8String);
}

- (of_dimension_t)contentSize {
    int width, height;
    
    uiWindowContentSize(uiWindow(_uiControl), &width, &height);
    
    return of_dimension(width, height);
}

- (void)setContentSize:(of_dimension_t)contentSize {
    uiWindowSetContentSize(uiWindow(_uiControl), contentSize.width, contentSize.height);
}

- (bool)isFullscreen {
    return (bool)(uiWindowFullscreen(uiWindow(_uiControl)));
}

- (void)makeFullscreen:(bool)fullscreen {
    if (self.fullscreen != fullscreen) {
        uiWindowSetFullscreen(uiWindow(_uiControl), fullscreen);
    }
}

- (bool)isBorderless {
    return (bool)(uiWindowBorderless(uiWindow(_uiControl)));
}

- (void)makeBorderless:(bool)borderless {
    uiWindowSetBorderless(uiWindow(_uiControl), borderless);
}

- (bool)isMargined {
    return (bool)(uiWindowMargined(uiWindow(_uiControl)));
}

- (void)makeMargined:(bool)margined {
    uiWindowSetMargined(uiWindow(_uiControl), margined);
}

- (void)_invalidateHandle {
    uiWindowOnClosing(uiWindow(_uiControl), NULL, NULL);
    uiWindowOnContentSizeChanged(uiWindow(_uiControl), NULL, NULL);
    
    _uiControl = NULL;
    _owner = false;
}

@end
