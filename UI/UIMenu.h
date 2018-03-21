//
//  UIMenu.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@class UIWindow;
@class UIMenuItem;
@class UIMenu;

@protocol UIMenuDelegate <OFObject>

- (void)menuItem:(OF_KINDOF(UIMenuItem *))sender didClickedOnWindow:(OF_KINDOF(UIWindow *))window;

@end

@interface UIMenu : UIControl

@property (nonatomic, weak) id<UIMenuDelegate> delegate;
@property (nonatomic, copy, readonly) OFString *name;
@property (nonatomic, copy, readonly) OFArray OF_GENERIC(OF_KINDOF(UIMenuItem *)) *items;

+ (instancetype)menuWithName:(OFString *)name OF_METHOD_FAMILY(new);

- (instancetype)initWithName:(OFString *)name;

- (void)appendItem:(OF_KINDOF(UIMenuItem *))item;
- (void)appendCheckableItem:(OF_KINDOF(UIMenuItem *))item;
- (void)appendQuitItem:(OF_KINDOF(UIMenuItem *))item;
- (void)appendPreferencesItem:(OF_KINDOF(UIMenuItem *))item;
- (void)appendAboutItem:(OF_KINDOF(UIMenuItem *))item;

- (OF_KINDOF(UIMenuItem *))appendItemWithName:(OFString *)name;
- (OF_KINDOF(UIMenuItem *))appendCheckableItemWithName:(OFString *)name;
- (OF_KINDOF(UIMenuItem *))appendQuitItem;
- (OF_KINDOF(UIMenuItem *))appendPreferencesItem;
- (OF_KINDOF(UIMenuItem *))appendAboutItem;
- (void)appendSeparator;

@end

OF_ASSUME_NONNULL_END
