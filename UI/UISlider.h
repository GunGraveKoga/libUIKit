//
//  UISlider.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UISlider

@optional
- (void)changed;

@end

@class UISlider;

@protocol UISliderDelegate <OFObject>

- (void)sliderDidChanged:(OF_KINDOF(UISlider *))sender;

@end

@interface UISlider : UIControl <UISlider>

@property (nonatomic, weak) id<UISliderDelegate> delegate;

@property (nonatomic, assign, readonly) int minValue;
@property (nonatomic, assign, readonly) int maxValue;
@property (nonatomic, assign) int value;

+ (instancetype)slider OF_METHOD_FAMILY(new);
+ (instancetype)sliderWithMin:(int)min max:(int)max OF_METHOD_FAMILY(new);

- (instancetype)initWithMin:(int)min max:(int)max;

@end

OF_ASSUME_NONNULL_END
