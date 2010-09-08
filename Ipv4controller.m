//
//  Ipv4controller.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 17/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Ipv4controller.h"


@implementation Ipv4controller

- (void)awakeFromNib {

	[mavue addSubview:ipbox];
	[mavue setWantsLayer:YES];
	
	NSLog (@"Je me charge");
}
-(id)init
{
		
	if ( self = [super init]) {
	
		CidrtostrTransformer *c2str;
		
		// create an autoreleased instance of our value transformer
		c2str = [[[CidrtostrTransformer alloc] init] autorelease];
		
		// register it with the name that we refer to it with
		[NSValueTransformer setValueTransformer:c2str forName:@"CidrtostrTransformer"];

		[self setValue:[NSNumber numberWithInt:24]  forKey:@"cidr"];
		
		monIpdata = [[[NSIpSubnetv4 alloc] init]autorelease];
		[monIpdata retain];
	}
	
	return self;
	
}


-(IBAction) Calculate:(id)sender{

	//On envoie les data au NSIpSubnet
	
	
	[monIpdata setsub:[NSIpv4 IpStringToInteger:[Tipaddr stringValue]] mask:[Tmask integerValue]];
	
	//checl l'addip

	
	NSRect frame = [mawin frame];
	frame.size.height=194;
	
	[mawin setFrame:frame display:TRUE animate:TRUE ];
	frame = [resultbox frame];
	frame.origin.x = 17;
	
	frame.origin.y = 8;
	[resultbox setFrame:frame];
	[[mavue animator] replaceSubview:ipbox with:resultbox];

	
	//[Bretour setHidden:FALSE];
	
	
	return;
	
	
}

-(IBAction) refreshmask:(id)sender
{

}
						
-(IBAction) decCidr:(id)sender
{
	NSInteger value= [Tmask intValue];
	if ((value >1) & (value <32)){
		value--;
	} else {
		value = 0;
	}
	[Tmask setIntValue:value];
	
}
-(IBAction) checkIp:(id)sender
{
	if ([NSIpv4 checkIPStr:[Tipaddr stringValue]]) {
		
		NSLog (@"L'ip est bonne");
		[Tipaddr setBackgroundColor:[NSColor greenColor ]];
		
	}else {
		[Tipaddr setBackgroundColor:[NSColor redColor ]];

	}

	NSLog (@"L'ip est de retour");

}
@synthesize cidr;
@end
