//
//  UITab.h
//  UIKit
//
//  Created by Yury Vovk on 21.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@interface UITab<__covariant ControlType:UIControl *> : UIControl

@property (nonatomic, assign, readonly) int numPages;

+ (instancetype)tab OF_METHOD_FAMILY(new);

- (void)appendControl:(ControlType)control withName:(OFString *)name;
- (void)appendControl:(UIControl<UILabeledControl> *)control;
- (void)insertControl:(ControlType)control withName:(OFString *)name before:(int)index;
- (void)insertControl:(UIControl<UILabeledControl> *)control before:(int)index;
- (void)removeControlAtIndex:(int)index;

- (__kindof ControlType)pageAtIndex:(int)index;
- (bool)isControlAtIndexMargined:(int)index;
- (void)makeControlAtIndex:(int)index margine:(bool)margined;

@end

OF_ASSUME_NONNULL_END
