//
//  UIGrid.h
//  UIKit
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIControl.h"

enum ui_align_t {
    UI_ALIGN_FILL,
    UI_ALIGN_START,
    UI_ALIGN_CENTER,
    UI_ALIGN_END
};

typedef unsigned int ui_align_t;

enum ui_at_t {
    UI_AT_LEADING,
    UI_AT_TOP,
    UI_AT_TRAILING,
    UI_AT_BOTTOM
};

typedef unsigned int ui_at_t;

OF_ASSUME_NONNULL_BEGIN

@interface UIGrid<__covariant ControlType:UIControl *> : UIControl

@property (nonatomic, assign, getter=isPadded, setter=makePadded:) bool padded;

+ (instancetype)grid OF_METHOD_FAMILY(new);

- (void)appendControl:(ControlType)control withPoint:(of_point_t)point span:(of_point_t)span horizontalExpand:(bool)isHExpand horizontalAlign:(ui_align_t)halign verticalExpand:(bool)isVExpand verticalAlign:(ui_align_t)valign;

- (void)insertControl:(ControlType)control at:(ui_at_t)at existing:(ControlType)existing withPoint:(of_point_t)point span:(of_point_t)span horizontalExpand:(bool)isHExpand horizontalAlign:(ui_align_t)halign verticalExpand:(bool)isVExpand verticalAlign:(ui_align_t)valign;

@end

OF_ASSUME_NONNULL_END
