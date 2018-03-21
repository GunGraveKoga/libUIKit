//
//  UILabel.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

@interface UILabel : UIControl

@property (nonatomic, copy) OFString *text;

+ (instancetype)label OF_METHOD_FAMILY(new);
+ (instancetype)labelWithText:(OFString *)text OF_METHOD_FAMILY(new);
- (instancetype)initWithText:(OFString *)text;

@end
