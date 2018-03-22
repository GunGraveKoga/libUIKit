//
//  UIForm.h
//  UIKit
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@interface UIForm : UIControl

@property (nonatomic, assign, getter=isPadded, setter=makePadded:) bool padded;
@property (nonatomic, copy, readonly) OFArray OF_GENERIC(UIControl *) *controls;
@property (nonatomic, copy, readonly) OF_KINDOF(UIControl) *lastControl;
@property (nonatomic, assign, readonly) size_t numControls;

+ (instancetype)form OF_METHOD_FAMILY(new);

- (void)appendControl:(OF_KINDOF(UIControl *))control withLabel:(OFString *)label;
- (void)appendControl:(OF_KINDOF(UIControl *))control withLabel:(OFString *)label stretchy:(bool)isStretchy;
- (void)removeControlAtIndex:(OF_KINDOF(UIControl *))index;
- (OF_KINDOF(UIControl *) _Nullable)controlAtIndex;

@end

OF_ASSUME_NONNULL_END
