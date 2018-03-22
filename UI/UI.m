//
//  UI.m
//  UI
//
//  Created by Yury Vovk on 20.03.2018.
//  Copyright © 2018 gungravekoga. All rights reserved.
//

#import "UI.h"
#include <libui/ui.h>

static const char *__defaultDelegateClassName = "AppDelegate";

static int _onShouldQuitCallback(void *data) {
    @autoreleasepool {
        id<UIApplicationDelegate> delegate = [UIMainQueue delegate];
        
        if (delegate != nil && [delegate respondsToSelector:@selector(uiApplicationShouldQuit)]) {
            bool res = [delegate uiApplicationShouldQuit];
            
            if (res && [delegate respondsToSelector:@selector(applicationWillTerminate)]) {
                [delegate applicationWillTerminate];
            }
        }
        
        return 0;
    }
}

@interface UIMainQueue()
#ifdef OF_HAVE_CLASS_PROPERTIES
@property (class, nonatomic, readwrite) id<UIApplicationDelegate> delegate;
#endif
+ (void)setDelegate:(id<UIApplicationDelegate>)delegate;
- (instancetype)ui_init OF_METHOD_FAMILY(init);


@end

@interface UIMainQueue (OFApplicationDelegate) <OFApplicationDelegate>

@end

int UIApplicationMain(int argc, char **argv) {
    @autoreleasepool {
        
        uiInitOptions opt;
        
        memset(&opt, 0, sizeof(uiInitOptions));
        
        const char *res = uiInit(&opt);
        
        if (res != NULL) {
            of_log(@"Cannot initialize libui %s", res);
            uiFreeInitError(res);
            abort();
        }
        
        uiOnShouldQuit(&_onShouldQuitCallback, NULL);
        
        return of_application_main(&argc, &argv, [[UIMainQueue alloc] ui_init]);
    }
}

@implementation UIMainQueue (OFApplicationDelegate)

- (void)applicationDidFinishLaunching {
    
    Class cls = Nil;
    
    cls = objc_getClass(__defaultDelegateClassName);
    
    id<UIApplicationDelegate> delegate = [[cls alloc] init];
    
    [delegate applicationDidFinishLaunching];
    
    [UIMainQueue setDelegate:delegate];
    
    [UIMainQueue start];
    
    [OFApplication terminate];
}

- (void)applicationWillTerminate {
    id<UIApplicationDelegate> delegate = [UIMainQueue delegate];
    
    if (delegate != nil && [delegate respondsToSelector:@selector(applicationWillTerminate)])
        [delegate applicationWillTerminate];
}

@end

