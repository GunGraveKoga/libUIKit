//
//  UI.h
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import <ObjFW/ObjFW.h>
#import "UIMainQueue.h"
#import "UIControl.h"
#import "UIWindow.h"
#import "UIButton.h"
#import "UIBox.h"
#import "UICheckbox.h"
#import "UIEntry.h"
#import "UILabel.h"
#import "UITab.h"
#import "UIGroup.h"
#import "UISpinbox.h"
#import "UISlider.h"
#import "UIProgressBar.h"
#import "UISeparator.h"
#import "UICombobox.h"
#import "UIEditableCombobox.h"
#import "UIRadioButtons.h"
#import "UIDateTimePicker.h"
#import "UIMultilineEntry.h"
#import "UIMenuItem.h"
#import "UIMenu.h"
#import "UIForm.h"
#import "UIGrid.h"

@protocol UIApplicationDelegate <OFApplicationDelegate>

- (bool)uiApplicationShouldQuit;

@end

extern int UIApplicationMain(int argc, char **argv);
