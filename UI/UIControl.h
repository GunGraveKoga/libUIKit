//
//  UIControl.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import <ObjFW/ObjFW.h>

typedef struct uiControl uiControl;

OF_ASSUME_NONNULL_BEGIN

@interface UIControl : OFObject
{
    @protected
    void *_uiControl;
    bool _owner;
}

@property (nonatomic, assign, readonly) uiControl *uiControl OF_RETURNS_INNER_POINTER;
@property (nonatomic, assign, readonly) void *uiControlHandle OF_RETURNS_INNER_POINTER;
@property (nonatomic, strong, nullable) UIControl *parent;
@property (nonatomic, assign, getter=isVisible, readonly) bool visible;
@property (nonatomic, assign, getter=isEnabled, readonly) bool enabled;
@property (nonatomic, assign, getter=isOnTopLevel, readonly) bool onTopLevel;
@property (nonatomic, assign, getter=isEnabledToUser, readonly) bool enabledToUser;

- (instancetype)initWithControl:(void *)control;

- (void)show;
- (void)hide;
- (void)enable;
- (void)disable;

@end

OF_ASSUME_NONNULL_END
