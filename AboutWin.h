//
//  AboutWin.h
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 11/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>


@interface AboutWin : NSWindowController {

	IBOutlet NSTextField * Tversion;
	IBOutlet WebView * Tabout;
	IBOutlet NSBox * lavue;
}
-(id)init;
-(void)windowDidLoad;

@end

