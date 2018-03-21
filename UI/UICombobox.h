//
//  UICombobox.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UICombobox;

@protocol UIComboboxDelegate <OFObject>

- (void)comboboxDidChange:(OF_KINDOF(UIControl<UICombobox> *))sender;

@end

@protocol UICombobox

@required
@property (nonatomic, weak) id<UIComboboxDelegate> delegate;
@property (nonatomic, copy, readonly) OFArray OF_GENERIC(OFString *) *items;

+ (instancetype)combobox OF_METHOD_FAMILY(new);
+ (instancetype)comboboxWithItems:(OFArray OF_GENERIC(OFString *) *)items OF_METHOD_FAMILY(new);
- (instancetype)initWithItems:(OFArray OF_GENERIC(OFString *) *)items;
- (void)append:(OFString *)text;
- (OFString *)currentText;

@optional
- (void)selected;

@end

@interface UICombobox : UIControl <UICombobox>

@property (nonatomic, copy, readonly) OFString *currentText;
@property (nonatomic, assign, getter=selectedIndex, setter=setSelectedIndex:) int selected;

@end

OF_ASSUME_NONNULL_END
