//
//  UIGroup.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@interface UIGroup : UIControl

@property (nonatomic, copy) OFString *title;
@property (nonatomic, assign, getter=isMargined, setter=makeMargined:) bool margined;

+ (instancetype)group OF_METHOD_FAMILY(new);
+ (instancetype)groupWithTitle:(OFString *)title OF_METHOD_FAMILY(new);

- (instancetype)initWithTitle:(OFString *)title;
- (void)setChild:(UIControl *)child;

@end

OF_ASSUME_NONNULL_END
