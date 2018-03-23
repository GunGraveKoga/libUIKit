//
//  UITab.h
//  UIKit
//
//  Created by Yury Vovk on 21.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UITabPage

@property (nonatomic, copy, readonly) OFString *name;

@end

@interface UITab : UIControl

@property (nonatomic, assign, readonly) int numPages;

+ (instancetype)tab OF_METHOD_FAMILY(new);

- (void)appendControl:(UIControl *)control withName:(OFString *)name;
- (void)insertControl:(UIControl *)control withName:(OFString *)name before:(int)index;
- (void)removeControlAtIndex:(int)index;

- (UIControl * _Nullable)pageAtIndex:(int)index;
- (bool)isControlAtIndexMargined:(int)index;
- (void)makeControlAtIndex:(int)index margine:(bool)margined;

@end

@interface UITab (Subscripting)

- (UIControl<UITabPage> * _Nullable)objectAtIndexedSubscript:(int)index;
- (void)setObject:(UIControl<UITabPage> * _Nullable)object atIndexedSubscript:(int)index;

@end

OF_ASSUME_NONNULL_END
