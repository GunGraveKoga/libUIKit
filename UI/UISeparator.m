//
//  UISeparator.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UISeparator.h"
#include <libui/ui.h>

@interface UISeparator()

- (uiSeparator *)_separatorType;

@end

@implementation UISeparator

+ (instancetype)separator {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    
    _uiControl = uiControl([self _separatorType]);
    
    if (_uiControl == NULL) {
        return nil;
    }
    
    _owner = true;
    
    return self;
}

- (uiSeparator *)_separatorType {
    return NULL;
}

@end

@implementation UIVerticalSeparator

- (uiSeparator *)_separatorType {
    return uiNewVerticalSeparator();
}

@end


@implementation UIHorizontalSeparator

- (uiSeparator *)_separatorType {
    return uiNewHorizontalSeparator();
}

@end
