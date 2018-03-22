//
//  AppDelegate.m
//  controlgallery
//
//  Created by Yury Vovk on 22.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate {
    UIWindow *_windwo;
}

- (instancetype)init {
    self = [super init];
    
    _windwo = [UIWindow windowWithTitle:@"libui Control Gallery" size:of_dimension(640, 480)];
    _windwo.delegate = self;
    _windwo.margined = true;
    
    return self;
}

- (void)applicationDidFinishLaunching {
    
    UITab *tab = [UITab tab];
    
    [tab appendControl:self.basicControls withName:@"Basic Controls"];
    [tab appendControl:self.numbersPage withName:@"Numbers and Lists"];
    [tab appendControl:self.dataChoosers withName:@"Data Choosers"];
    
    [_windwo setChild:tab];
    
    [_windwo show];
}

- (void)windowContentSizeDidChanged:(nonnull __kindof UIWindow *)sender {
    of_log(@"Content size changed");
}

- (bool)windowWillClosed:(nonnull __kindof UIWindow *)sender {
    of_log(@"Closing window");
    
    return true;
}

- (bool)uiApplicationShouldQuit {
    of_log(@"Should quit");
    
    return true;
}

- (UIControl *)basicControls {
    UIVerticalBox *vbox = [UIVerticalBox box];
    vbox.padded = true;
    
    UIHorizontalBox *hbox = [UIHorizontalBox box];
    hbox.padded = true;
    
    [vbox appendControl:hbox];
    
    [hbox appendControl:[UIButton buttonWithText:@"Button"]];
    [hbox appendControl:[UICheckbox checkboxWithText:@"Checkbox"]];
    
    [vbox appendControl:[UILabel labelWithText:@"This is a label. Right now, labels can only span one line."]];
    [vbox appendControl:[UIHorizontalSeparator separator]];
    
    UIGroup *group = [UIGroup groupWithTitle:@"Entries"];
    group.margined = true;
    
    [vbox appendControl:group stretchy:true];
    
    
    
    
}

- (UIControl *)numbersPage {
    
}

- (UIControl *)dataChoosers {
    
}

@end
