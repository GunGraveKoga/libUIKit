//
//  UIProgressBar.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@interface UIProgressBar : UIControl

@property (nonatomic, assign) int value;

+ (instancetype)progressBar OF_METHOD_FAMILY(new);

@end

OF_ASSUME_NONNULL_END
