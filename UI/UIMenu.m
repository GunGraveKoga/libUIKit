//
//  UIMenu.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIMenu.h"
#import "UIMenuItem.h"
#import "UIWindow.h"
#include <libui/ui.h>

@interface UIMenuItem()

- (void)_setUiControl:(uiControl *)control;

@end

static void _onClickedCallback(uiMenuItem *sender, uiWindow *window, void *data) {
    @autoreleasepool {
        if (data != NULL) {
            UIWindow *_window = [[UIWindow alloc] initWithControl:window];
            UIMenu *m = (__bridge UIMenu *)data;
            UIMenuItem *i = [[UIMenuItem alloc] initWithControl:sender];
            
            if ([i respondsToSelector:@selector(clickedOnWindow:)])
                [i clickedOnWindow:_window];
            else {
                __weak id<UIMenuDelegate> delegate;
                
                if ((delegate = m.delegate) != nil) {
                    __strong id<UIMenuDelegate> _delegate =delegate;
                    
                    if ([_delegate respondsToSelector:@selector(menuItem:didClickedOnWindow:)])
                        [_delegate menuItem:i didClickedOnWindow:_window];
                }
            }
        }
    }
}

@implementation UIMenu {
    OFMutableArray OF_GENERIC(OF_KINDOF(UIMenuItem *)) *_items;
}

@synthesize delegate = _delegate;
@synthesize name = _name;

+ (instancetype)menuWithName:(OFString *)name {
    return [[self alloc] initWithName:name];
}

- (instancetype)init {
    if ([self isMemberOfClass:[UIMenu class]]) {
        OF_INVALID_INIT_METHOD;
    }
    
    id menu = [super init];
    
    ((UIMenu *)menu)->_items = [OFMutableArray array];
    
    return menu;
}

- (instancetype)initWithName:(OFString *)name {
    self = [super init];
    
    _uiControl = uiNewMenu(name.UTF8String);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    _name = [name copy];
    _items = [OFMutableArray array];
    
    return self;
}

- (OFArray<UIMenuItem *> *)items {
    return [_items copy];
}

- (void)appendItem:(UIMenuItem *)item {
    uiMenuItem *_item = uiMenuAppendItem(uiMenu(_uiControl), item.name.UTF8String);
    
    void *menuObject = (__bridge void *)self;
    uiMenuItemOnClicked(_item, &_onClickedCallback, menuObject);
    
    [item _setUiControl:uiControl(_item)];
    
    [_items addObject:item];
}

- (UIMenuItem *)appendItemWithName:(OFString *)name {
    uiMenuItem *_item = uiMenuAppendItem(uiMenu(_uiControl), name.UTF8String);
    
    UIMenuItem *item = [UIMenuItem itemWithName:name];
    
    void *menuObject = (__bridge void *)self;
    uiMenuItemOnClicked(_item, &_onClickedCallback, menuObject);
    
    [item _setUiControl:uiControl(_item)];
    
    [_items addObject:item];
    
    return item;
}

- (void)appendCheckableItem:(UIMenuItem *)item {
    uiMenuItem *_item = uiMenuAppendCheckItem(uiMenu(_uiControl), item.name.UTF8String);
    
    void *menuObject = (__bridge void *)self;
    uiMenuItemOnClicked(_item, &_onClickedCallback, menuObject);
    
    [item _setUiControl:uiControl(_item)];
    
    [_items addObject:item];
}

- (UIMenuItem *)appendCheckableItemWithName:(OFString *)name {
    uiMenuItem *_item = uiMenuAppendCheckItem(uiMenu(_uiControl), name.UTF8String);
    
    UIMenuItem *item = [UIMenuItem itemWithName:name];
    
    void *menuObject = (__bridge void *)self;
    uiMenuItemOnClicked(_item, &_onClickedCallback, menuObject);
    
    [item _setUiControl:uiControl(_item)];
    
    [_items addObject:item];
    
    return item;
}

- (void)appendQuitItem:(UIMenuItem *)item {
    uiMenuItem *_item = uiMenuAppendQuitItem(uiMenu(_uiControl));
    
    void *menuObject = (__bridge void *)self;
    uiMenuItemOnClicked(_item, &_onClickedCallback, menuObject);
    
    [item _setUiControl:uiControl(_uiControl)];
    
    [_items addObject:item];
}

- (UIMenuItem *)appendQuitItem {
    uiMenuItem *_item = uiMenuAppendQuitItem(uiMenu(_uiControl));
    
    UIMenuItem *item = [UIMenuItem itemWithName:@"Quit"];
    
    void *menuObject = (__bridge void *)self;
    uiMenuItemOnClicked(_item, &_onClickedCallback, menuObject);
    
    [item _setUiControl:uiControl(_uiControl)];
    
    [_items addObject:item];
    
    return item;
}

- (void)appendPreferencesItem:(UIMenuItem *)item {
    uiMenuItem *_item = uiMenuAppendPreferencesItem(uiMenu(_uiControl));
    
    void *menuObject = (__bridge void *)self;
    uiMenuItemOnClicked(_item, &_onClickedCallback, menuObject);
    
    [item _setUiControl:uiControl(_item)];
    
    [_items addObject:item];
}

- (UIMenuItem *)appendPreferencesItem {
    uiMenuItem *_item = uiMenuAppendPreferencesItem(uiMenu(_uiControl));
    
    UIMenuItem *item = [UIMenuItem itemWithName:@"Preferences"];
    
    void *menuObject = (__bridge void *)self;
    uiMenuItemOnClicked(_item, &_onClickedCallback, menuObject);
    
    [item _setUiControl:uiControl(_uiControl)];
    
    [_items addObject:item];
    
    return item;
}

- (void)appendAboutItem:(__kindof UIMenuItem *)item {
    uiMenuItem *_item = uiMenuAppendAboutItem(uiMenu(_uiControl));
    
    void *menuObject = (__bridge void *)self;
    uiMenuItemOnClicked(_item, &_onClickedCallback, menuObject);
    
    [item _setUiControl:uiControl(_uiControl)];
    
    [_items addObject:item];
}

- (UIMenuItem *)appendAboutItem {
    uiMenuItem *_item = uiMenuAppendAboutItem(uiMenu(_uiControl));
    
    UIMenuItem *item = [UIMenuItem itemWithName:@"About"];
    
    void *menuObject = (__bridge void *)self;
    uiMenuItemOnClicked(_item, &_onClickedCallback, menuObject);
    
    [item _setUiControl:uiControl(_item)];
    
    [_items addObject:item];
    
    return item;
}

@end
