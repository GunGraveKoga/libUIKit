//
//  UIMenuItem.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UIMenuItem

@optional
- (void)clickedOnWindow:(UIWindow *)window;

@end

@interface UIMenuItem : UIControl <UIMenuItem>

@property (nonatomic, copy, readonly) OFString *name;

@property (nonatomic, assign, getter=isChecked, setter=makeChecked:) bool checked;

+ (instancetype)itemWithName:(OFString *)name OF_METHOD_FAMILY(new);
- (instancetype)initWithName:(OFString *)name;

- (void)enable;
- (void)disable;

@end

OF_ASSUME_NONNULL_END
