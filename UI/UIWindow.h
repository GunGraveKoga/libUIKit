//
//  UIWindow.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UIWindow

@optional
- (void)contentSizeDidChanged;
- (bool)willClosed;

@end

@class UIWindow;

@protocol UIWindowDelegate <OFObject>

- (void)windowContentSizeDidChanged:(UIWindow *)sender;
- (bool)windowWillClosed:(UIWindow *)sender;

@end

@interface UIWindow : UIControl <UIWindow>

@property (nonatomic, weak) id<UIWindowDelegate> delegate;

@property (nonatomic, copy) OFString *title;
@property (nonatomic, assign) of_dimension_t contentSize;
@property (nonatomic, assign, getter=isFullscreen, setter=makeFullscreen:) bool fullscreen;
@property (nonatomic, assign, getter=isBorderless, setter=makeBorderless:) bool borderless;
@property (nonatomic, assign, getter=isMargined, setter=makeMargined:) bool margined;

+ (instancetype)windowWithTitle:(OFString *)title size:(of_dimension_t)size menubar:(bool)hasMenubar OF_METHOD_FAMILY(new);
+ (instancetype)windowWithTitle:(OFString *)title size:(of_dimension_t)size OF_METHOD_FAMILY(new);

- (instancetype)initWithTitle:(OFString *)title size:(of_dimension_t)size menubar:(bool)hasMenubar;

- (void)setChild:(UIControl *)childControl;

@end

OF_ASSUME_NONNULL_END
