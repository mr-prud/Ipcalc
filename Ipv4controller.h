//
//  Ipv4controller.h
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 17/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import "ipdata.h"
#import "CidrtostrTransformer.h"




@interface Ipv4controller : NSObject {
	
	//Champ entrée
	IBOutlet NSTextField * Tipaddr;
	IBOutlet NSTextField * Tmask;
	IBOutlet NSTextField *Tmasklong;
	
	//bouton
	IBOutlet NSButton * Bcidrmode;
	IBOutlet NSButton * Bcalculate;
	IBOutlet NSButton * Bretour;
	
	//boite
	IBOutlet NSBox *ipbox;
	IBOutlet NSBox *resultbox;
	IBOutlet NSView *mavue;
	IBOutlet NSWindow *mawin;
	
	NSInteger	cidrmode,cidr;
	
	CATransition * matransition;
	
	ipdata * monIpdata;
	
}
-(id)init;
-(IBAction) ToggleMaskMode:(id)sender;
-(IBAction) checkIp:(id)sender;
-(IBAction) Calculate:(id)sender;
-(IBAction) refreshmask:(id)sender;



@property(readwrite, assign) NSInteger cidr;
@end
