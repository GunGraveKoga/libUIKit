//
//  AppDelegate.h
//  controlgallery
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import <ObjFW/ObjFW.h>
#import "UI.h"

@interface AppDelegate : OFObject <UIApplicationDelegate, UIWindowDelegate>

@property (nonatomic, readonly, strong) UIControl *basicControls;
@property (nonatomic, readonly, strong) UIControl *numbersPage;
@property (nonatomic, readonly, strong) UIControl *dataChoosers;

@end
