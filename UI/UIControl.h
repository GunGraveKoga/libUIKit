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
@property (nonatomic, strong, nullable) OF_KINDOF(id<UIControl>) parent;
@property (nonatomic, assign, getter=isVisible, readonly) bool visible;
@property (nonatomic, assign, getter=isEnabled, readonly) bool enabled;
@property (nonatomic, assign, getter=isOnTopLevel, readonly) bool onTopLevel;
@property (nonatomic, assign, getter=isEnabledToUser, readonly) bool enabledToUser;

- (instancetype)initWithControl:(void *)control;
- (OF_KINDOF(UIWindow *) _Nullable)findWindow;

- (void)show;
- (void)hide;
- (void)enable;
- (void)disable;

@end

@interface UIControl : OFObject <UIControl>
{
@protected
    void *_uiControl;
    bool _owner;
}

@end

OF_ASSUME_NONNULL_END
