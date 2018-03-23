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

- (void)menuItem:(UIMenuItem *)sender didClickedOnWindow:(UIWindow *)window;

@end

@interface UIMenu<__covariant MenuItemType:UIMenuItem *> : UIControl

@property (nonatomic, weak) id<UIMenuDelegate> delegate;
@property (nonatomic, copy, readonly) OFString *name;
@property (nonatomic, copy, readonly) OFArray<__kindof MenuItemType> *items;

+ (instancetype)menuWithName:(OFString *)name OF_METHOD_FAMILY(new);

- (instancetype)initWithName:(OFString *)name;

- (void)appendItem:(MenuItemType)item;
- (void)appendCheckableItem:(MenuItemType)item;
- (void)appendQuitItem:(MenuItemType)item;
- (void)appendPreferencesItem:(MenuItemType)item;
- (void)appendAboutItem:(MenuItemType)item;

- (UIMenuItem *)appendItemWithName:(OFString *)name;
- (UIMenuItem *)appendCheckableItemWithName:(OFString *)name;
- (UIMenuItem *)appendQuitItem;
- (UIMenuItem *)appendPreferencesItem;
- (UIMenuItem *)appendAboutItem;
- (void)appendSeparator;

@end

OF_ASSUME_NONNULL_END
