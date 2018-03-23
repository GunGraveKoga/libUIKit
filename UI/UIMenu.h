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

@interface UIMenu : UIControl

@property (nonatomic, weak) id<UIMenuDelegate> delegate;
@property (nonatomic, copy, readonly) OFString *name;
@property (nonatomic, copy, readonly) OFArray<__kindof UIMenuItem *> *items;

+ (instancetype)menuWithName:(OFString *)name OF_METHOD_FAMILY(new);

- (instancetype)initWithName:(OFString *)name;

- (void)appendItem:(UIMenuItem *)item;
- (void)appendCheckableItem:(UIMenuItem *)item;
- (void)appendQuitItem:(UIMenuItem *)item;
- (void)appendPreferencesItem:(UIMenuItem *)item;
- (void)appendAboutItem:(UIMenuItem *)item;

- (UIMenuItem *)appendItemWithName:(OFString *)name;
- (UIMenuItem *)appendCheckableItemWithName:(OFString *)name;
- (UIMenuItem *)appendQuitItem;
- (UIMenuItem *)appendPreferencesItem;
- (UIMenuItem *)appendAboutItem;
- (void)appendSeparator;

@end

OF_ASSUME_NONNULL_END
