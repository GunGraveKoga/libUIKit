//
//  UIGrid.m
//  UIKit
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UIGrid.h"
#include <libui/ui.h>

@implementation UIGrid {
    OFMutableArray<UIControl *> *_controls;
}

+ (instancetype)grid {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiNewGrid();
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    _controls = [OFMutableArray array];
    
    return self;
}

- (bool)isPadded {
    return (bool)(uiGridPadded(uiGrid(_uiControl)));
}

- (void)makePadded:(bool)padded {
    uiGridSetPadded(uiGrid(_uiControl), padded);
}

- (void)appendControl:(UIControl *)control withPoint:(of_point_t)point span:(of_point_t)span horizontalExpand:(bool)isHExpand horizontalAlign:(ui_align_t)halign verticalExpand:(bool)isVExpand verticalAlign:(ui_align_t)valign
{
    uiGridAppend(uiGrid(_uiControl), control.uiControl, point.x, point.y, span.x, span.y, isHExpand, halign, isVExpand, valign);
    
    [_controls addObject:control];
}

- (void)insertControl:(UIControl *)control at:(ui_at_t)at existing:(UIControl *)existing withPoint:(of_point_t)point span:(of_point_t)span horizontalExpand:(bool)isHExpand horizontalAlign:(ui_align_t)halign verticalExpand:(bool)isVExpand verticalAlign:(ui_align_t)valign
{
    uiGridInsertAt(uiGrid(_uiControl), control.uiControl, existing.uiControl, at, span.x, span.y, isHExpand, halign, isVExpand, valign);
    
    [_controls addObject:control];
}

@end
