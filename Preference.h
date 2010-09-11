//
//  Preference.h
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 11/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Preference : NSWindowController {
	IBOutlet  NSTextField * Tmaskdefaut;
	
	
}

-(id)init;
-(void)windowDidLoad;
-(IBAction)Maskchange:(id)sender;
-(NSInteger)maskdefault;

@end
