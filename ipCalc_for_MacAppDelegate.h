//
//  ipCalc_for_MacAppDelegate.h
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 17/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ipCalc_for_MacAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSMenu * monmenu;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSMenu *monmenu;


@end
