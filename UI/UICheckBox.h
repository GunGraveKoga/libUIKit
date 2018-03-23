//
//  UICheckBox.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UICheckbox

@optional
- (void)toggled;

@end

@class UICheckbox;

@protocol UICheckboxDelegate <OFObject>

- (void)checkboxToggled:(UICheckbox *)sender;

@end

@interface UICheckbox : UIControl <UICheckbox>

@property (nonatomic, weak) id<UICheckboxDelegate> delegate;

@property (nonatomic, copy) OFString *text;
@property (nonatomic, assign, getter=isChecked, setter=makeChecked:) bool checked;

+ (instancetype)checkbox OF_METHOD_FAMILY(new);
+ (instancetype)checkboxWithText:(OFString *)text OF_METHOD_FAMILY(new);
- (instancetype)initWithText:(OFString *)text;

@end

OF_ASSUME_NONNULL_END
