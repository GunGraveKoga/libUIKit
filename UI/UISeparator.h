//
//  UISeparator.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@interface UISeparator : UIControl

+ (instancetype)separator OF_METHOD_FAMILY(new);

@end

@interface UIHorizontalSeparator : UISeparator

@end

@interface UIVerticalSeparator : UISeparator

@end

OF_ASSUME_NONNULL_END
