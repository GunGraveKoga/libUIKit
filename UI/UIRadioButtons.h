//
//  UIRadioButtons.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UIRadioButtons

@optional
- (void)selected;

@end

@class UIRadioButtons;

@protocol UIRadioButtonsDelegate <OFObject>

- (void)radioButtonsDidSelected:(UIRadioButtons *) sender;

@end

@interface UIRadioButtons : UIControl <UIRadioButtons>

@property (nonatomic, weak) id<UIRadioButtonsDelegate> delegate;

@property (nonatomic, copy, readonly) OFArray<__kindof OFString *> *items;
@property (nonatomic, assign, getter=selectedIndex, setter=setSelectedIndex:) int selected;
@property (nonatomic, copy, readonly) OFString *selectedItem;

+ (instancetype)radioButtons OF_METHOD_FAMILY(new);
+ (instancetype)radioButtonsWithItems:(OFArray<__kindof OFString *> *)items OF_METHOD_FAMILY(new);

- (instancetype)initWithItems:(OFArray<__kindof OFString*> *)items;
- (void)append:(OFString *)item;

@end

OF_ASSUME_NONNULL_END
