//
//  main.m
//  controlgallery
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import <ObjFW/ObjFW.h>
#import "UI.h"

#include <libui/ui.h>

@interface controlgallery : OFObject <OFApplicationDelegate>

@end

OF_APPLICATION_DELEGATE(controlgallery);

@implementation controlgallery

- (void)applicationDidFinishLaunching {
    
    of_log(@"Hellow world");
    
    [OFApplication terminate];
}

@end
