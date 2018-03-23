//
//  UIControl.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import <ObjFW/ObjFW.h>

typedef struct uiControl uiControl;

@class UIWindow;

OF_ASSUME_NONNULL_BEGIN

@protocol UIControl

@property (nonatomic, assign, readonly) uiControl *uiControl OF_RETURNS_INNER_POINTER;
@property (nonatomic, assign, readonly) void *uiControlHandle OF_RETURNS_INNER_POINTER;
@property (nonatomic, strong, nullable) id<UIControl> parent;
@property (nonatomic, assign, getter=isVisible, readonly) bool visible;
@property (nonatomic, assign, getter=isEnabled, readonly) bool enabled;
@property (nonatomic, assign, getter=isOnTopLevel, readonly) bool onTopLevel;
@property (nonatomic, assign, getter=isEnabledToUser, readonly) bool enabledToUser;

- (instancetype)initWithControl:(void *)control;
- (UIWindow * _Nullable)findWindow;

- (void)show;
- (void)hide;
- (void)enable;
- (void)disable;

@end

@interface UIControl : OFObject <UIControl, OFCopying>
{
@protected
    void *_uiControl;
    __weak UIControl *_parent;
    bool _owner;
}

@end

OF_ASSUME_NONNULL_END
