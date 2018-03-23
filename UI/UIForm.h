//
//  UIForm.h
//  UIKit
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@interface UIForm<__covariant ControlType:UIControl *> : UIControl

@property (nonatomic, assign, getter=isPadded, setter=makePadded:) bool padded;
@property (nonatomic, copy, readonly) OFArray<__kindof ControlType> *controls;
@property (nonatomic, assign, readonly) size_t numControls;

+ (instancetype)form OF_METHOD_FAMILY(new);
+ (instancetype)formWithElements:(OFArray<__kindof UIControl<UILabeledControl> *> *)elements OF_METHOD_FAMILY(new);
- (instancetype)initWithElements:(OFArray<__kindof UIControl<UILabeledControl> *> *)elements;

- (void)appendControl:(ControlType)control withLabel:(OFString *)label;
- (void)appendControl:(UIControl<UILabeledControl> *)control;
- (void)appendControl:(ControlType)control withLabel:(OFString *)label stretchy:(bool)isStretchy;
- (void)appendControl:(UIControl<UILabeledControl> *)control stretchy:(bool)isStretchy;
- (void)removeControlAtIndex:(int)index;
- (__kindof ControlType)controlAtIndex:(int)index;

@end

OF_ASSUME_NONNULL_END
