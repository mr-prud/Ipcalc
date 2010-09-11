//
//  Ipv4controller.h
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 17/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import "ipv4.h"
#import "CidrtostrTransformer.h"
#import "Preference.h"




@interface Ipv4controller : NSObject {
	
	//Boite de saisie
	//=================	
	//Champ entrée
	IBOutlet NSTextField * Tipaddr;
	IBOutlet NSTextField * Tmask;
	
	//bouton
	IBOutlet NSButton * Bcidrmode;
	IBOutlet NSButton * Bcalculate;
	
	
	//Boite de print
	//=================	
	IBOutlet NSTextField * TPnet;
	IBOutlet NSTextField * TPmask;
	IBOutlet NSTextField * TPfirst;
	IBOutlet NSTextField * TPLast;
	IBOutlet NSTextField * Tbroadcast;
	IBOutlet NSTextField * TPSize;

	
	
	IBOutlet NSView *mavue;
	IBOutlet NSWindow *mawin;
	//IBOutlet NSButton * Bretour;
	

	IBOutlet NSBox * monsubnetsaisie;
	IBOutlet NSBox * monsubnetprint;
	

	NSInteger	cidrmode,cidr;
	CATransition * matransition;
	NSIpSubnetv4 * monsubnet;
	
	Preference * mawinpref;
	
	
	
	//CidrtostrTransformer * c2str;
	
}
-(id)init;
-(IBAction) Calculate:(id)sender;
-(IBAction) mesPrefs:(id)sender;

+(void)initialize;



@end
