//
//  UISpinbox.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UISpinbox

@optional
- (void)changed;

@end

@class UISpinbox;

@protocol UISpinboxDelegate <OFObject>

- (void)spinboxValueChanged:(UISpinbox *)sender;

@end

@interface UISpinbox : UIControl <UISpinbox>

@property (nonatomic, weak) id<UISpinboxDelegate> delegate;

@property (nonatomic, assign, readonly) int minValue;
@property (nonatomic, assign, readonly) int maxValue;
@property (nonatomic, assign) int value;

+ (instancetype)spinbox OF_METHOD_FAMILY(new);
+ (instancetype)spinboxWithMin:(int)min max:(int)max OF_METHOD_FAMILY(new);

- (instancetype)initWithMin:(int)min max:(int)max;

@end

OF_ASSUME_NONNULL_END
