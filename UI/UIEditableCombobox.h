//
//  UIEditableCombobox.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"
#import "UICombobox.h"

OF_ASSUME_NONNULL_BEGIN

@interface UIEditableCombobox : UIControl <UICombobox>

@property (nonatomic, copy, readwrite) OFString *currentText;

@end

OF_ASSUME_NONNULL_END
