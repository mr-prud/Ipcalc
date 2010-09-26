//
//  ipCalc_for_MacAppDelegate.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 17/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ipCalc_for_MacAppDelegate.h"

@implementation ipCalc_for_MacAppDelegate

@synthesize window,monmenu;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	//On verifie la présence des users settings.
	NSMutableDictionary * valeurdefault = [NSMutableDictionary dictionary];
	[valeurdefault setObject:[NSNumber numberWithInt:24] forKey:@"maskdefault"];
	
	[[NSUserDefaults standardUserDefaults]
	 registerDefaults:valeurdefault];

    //J'ajoute le menu
	[[NSApplication sharedApplication] setMainMenu:monmenu];

	 
}

-(void)awakeFromNib{
    
	
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
	return TRUE;
}

@end
