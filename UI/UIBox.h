//
//  UIBox.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@interface UIBox : UIControl

@property (nonatomic, assign, getter=isPadded, setter=makePadded:) bool padded;
@property (nonatomic, copy, readonly) OFArray<__kindof UIControl *> *controls;
@property (nonatomic, assign, readonly) size_t numControls;

+ (instancetype)box OF_METHOD_FAMILY(new);

- (void)appendControl:(UIControl *)control;
- (void)appendControl:(UIControl *)control stretchy:(bool)isStretchy;
- (UIControl *)controlAtIndex:(int)index;
- (void)removeControlAtIndex:(int)index;

@end

@interface UIVerticalBox: UIBox

@end

@interface UIHorizontalBox: UIBox

@end

OF_ASSUME_NONNULL_END
