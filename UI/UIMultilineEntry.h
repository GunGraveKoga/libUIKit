//
//  UIMultilineEntry.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"
#import "UIEntry.h"

OF_ASSUME_NONNULL_BEGIN

@interface UIMultilineEntry : UIControl <UIEntry>

- (void)appendText:(OFString *)text;

@end

@interface UINonWrappingMultilineEntry : UIMultilineEntry

@end

OF_ASSUME_NONNULL_END
