//
//  UIButton.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UIButton

@optional
- (void)clicked;

@end

@class UIButton;

@protocol UIButtonDelegate <OFObject>

- (void)pressed:(OF_KINDOF(UIButton *))sender;

@end

@interface UIButton : UIControl <UIButton>

@property (nonatomic, weak) id<UIButtonDelegate> delegate;

@property (nonatomic, copy) OFString *text;

+ (instancetype)button OF_METHOD_FAMILY(new);
+ (instancetype)buttonWithText:(OFString *)text OF_METHOD_FAMILY(new);
- (instancetype)initWithText:(OFString *)text;

@end

OF_ASSUME_NONNULL_END
