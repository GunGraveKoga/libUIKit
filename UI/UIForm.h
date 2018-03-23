//
//  UIForm.h
//  UIKit
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UIFormElement

@property (nonatomic, copy, readonly) OFString *label;

@end

@interface UIForm : UIControl

@property (nonatomic, assign, getter=isPadded, setter=makePadded:) bool padded;
@property (nonatomic, copy, readonly) OFArray<__kindof UIControl *> *controls;
@property (nonatomic, copy, readonly) UIControl *lastControl;
@property (nonatomic, assign, readonly) size_t numControls;

+ (instancetype)form OF_METHOD_FAMILY(new);
+ (instancetype)formWithElements:(OFArray<__kindof UIControl<UIFormElement> *> *)elements OF_METHOD_FAMILY(new);
- (instancetype)initWithElements:(OFArray<__kindof UIControl<UIFormElement> *> *)elements;

- (void)appendControl:(UIControl *)control withLabel:(OFString *)label;
- (void)appendControl:(UIControl<UIFormElement> *)control;
- (void)appendControl:(UIControl *)control withLabel:(OFString *)label stretchy:(bool)isStretchy;
- (void)appendControl:(UIControl<UIFormElement> *)control stretchy:(bool)isStretchy;
- (void)removeControlAtIndex:(int)index;
- (UIControl * _Nullable)controlAtIndex;

@end

OF_ASSUME_NONNULL_END
