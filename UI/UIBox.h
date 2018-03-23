//
//  UIBox.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@interface UIBox<__covariant ControlType:UIControl *> : UIControl

@property (nonatomic, assign, getter=isPadded, setter=makePadded:) bool padded;
@property (nonatomic, copy, readonly) OFArray<__kindof ControlType> *controls;
@property (nonatomic, assign, readonly) size_t numControls;

+ (instancetype)box OF_METHOD_FAMILY(new);

- (void)appendControl:(ControlType)control;
- (void)appendControl:(ControlType)control stretchy:(bool)isStretchy;
- (__kindof ControlType)controlAtIndex:(int)index;
- (void)removeControlAtIndex:(int)index;

@end

@interface UIVerticalBox: UIBox

@end

@interface UIHorizontalBox: UIBox

@end

OF_ASSUME_NONNULL_END
