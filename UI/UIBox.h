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

+ (instancetype)box OF_METHOD_FAMILY(new);

- (void)appendControl:(OF_KINDOF(UIControl *))control;
- (void)appendControl:(OF_KINDOF(UIControl *))control stretchy:(bool)isStretchy;
- (void)removeControlAtIndex:(int)index;

@end

@interface UIVerticalBox: UIBox

@end

@interface UIHorizontalBox: UIBox

@end

OF_ASSUME_NONNULL_END
