//
//  UIRadioButtons.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UIRadioButtonsItem

- (OFString *)name;

@end

@protocol UIRadioButtons

@optional
- (void)selected;

@end

@class UIRadioButtons;

@protocol UIRadioButtonsDelegate <OFObject>

- (void)radioButtonsDidSelected:(OF_KINDOF(UIRadioButtons *)) sender;

@end

@interface UIRadioButtons : UIControl <UIRadioButtons>

@property (nonatomic, weak) id<UIRadioButtonsDelegate> delegate;

@property (nonatomic, copy, readonly) OFArray OF_GENERIC(id<UIRadioButtonsItem>) *items;
@property (nonatomic, assign, getter=selectedIndex, setter=setSelectedIndex:) int selected;
@property (nonatomic, readonly) id<UIRadioButtonsItem> selectedItem;

+ (instancetype)radioButtons OF_METHOD_FAMILY(new);
+ (instancetype)radioButtonsWithItems:(OFArray OF_GENERIC(id<UIRadioButtonsItem>) *)items OF_METHOD_FAMILY(new);

- (instancetype)initWithItems:(OFArray OF_GENERIC(id<UIRadioButtonsItem>) *)items;
- (void)append:(id<UIRadioButtonsItem>)item;

@end

OF_ASSUME_NONNULL_END
