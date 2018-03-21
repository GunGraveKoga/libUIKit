//
//  UIEntry.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

OF_ASSUME_NONNULL_BEGIN

@protocol UIEntry

@optional
- (void)changed;

@end

@class UIEntry;

@protocol UIEntryDelegate <OFObject>

- (void)entryDidChanged:(OF_KINDOF(UIEntry *))sender;

@end

@interface UIEntry : UIControl <UIEntry>

@property (nonatomic, weak) id<UIEntryDelegate> delegate;

@property (nonatomic, copy) OFString *text;
@property (nonatomic, getter=isReadOnly, setter=makeReadOnly:) bool readOnly;

+ (instancetype)entry;

@end

@interface UIPasswordEntry : UIEntry

@end

@interface UISearchEntry : UIEntry

@end

OF_ASSUME_NONNULL_END
