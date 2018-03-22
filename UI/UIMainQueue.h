//
//  UIMainQueue.h
//  UIKit
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import <ObjFW/OFObject.h>

@protocol UIApplicationDelegate;

@interface UIMainQueue : OFObject

#ifdef OF_HAVE_CLASS_PROPERTIES
@property (class, nonatomic, readonly) id<UIApplicationDelegate> delegate;
#endif

+ (id<UIApplicationDelegate>)delegate;

+ (void)start;
+ (void)terminate;
+ (void)steps;
+ (void)step:(bool)wait;

- (instancetype)init OF_UNAVAILABLE;

@end
