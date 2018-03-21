//
//  UITab.h
//  UIKit
//
//  Created by Yury Vovk on 21.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@interface UITabPage : OFObject

@property (nonatomic, assign, getter=isMargined, setter=makeMargined:) bool margined;

@end

@interface UITab : UIControl

@property (nonatomic, assign, readonly) int numPages;

+ (instancetype)tab OF_METHOD_FAMILY(new);

- (void)appendControl:(OF_KINDOF(UIControl *))control withName:(OFString *)name;
- (void)insertControl:(OF_KINDOF(UIControl *))control withName:(OFString *)name before:(int)index;
- (void)removeControlAtIndex:(int)index;

- (UITabPage * _Nullable)pageAtIndex:(int)index;

@end

@interface UITab (Subscripting)

- (UITabPage * _Nullable)objectAtIndexedSubscript:(int)index;
- (void)setObject:(UITabPage *)object atIndexedSubscript:(int)index OF_UNAVAILABLE;

@end

OF_ASSUME_NONNULL_END
