//
//  Ipv4controller.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 17/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Ipv4controller.h"


@implementation Ipv4controller


+(void)initialize
{
	NSMutableDictionary * valeurdefault = [NSMutableDictionary dictionary];
	[valeurdefault setObject:[NSNumber numberWithInt:24] forKey:@"maskdefault"];
	
	[[NSUserDefaults standardUserDefaults]
	 registerDefaults:valeurdefault];
	
	NSLog (@"Valeur par default écritent");
	
}

- (void)awakeFromNib {

	//On charge aussi les valeurs par défaults
	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	[Tmask setIntValue:[defaults integerForKey:@"maskdefault"]];
	
	[mavue addSubview:monsubnetsaisie];
	NSRect frame = [monsubnetsaisie frame];
	frame.origin.x = 17;	
	frame.origin.y = 16;
	
	[monsubnetsaisie setFrame:frame];
	[mavue setWantsLayer:YES];

	
}
-(id)init
{
		
	if ( self = [super init]) 
	{
		cidr = 24;	
		monsubnet = [[NSIpSubnetv4 alloc]init];
		
	}
	
	return self;
	
}


-(IBAction) Calculate:(id)sender{

	
	
	//On valide les formats, on avertit en cas de soucis et on annule
	if (![NSIpSubnetv4 checkCidr:[Tmask intValue]])
	{
		[[NSAlert alertWithMessageText:NSLocalizedStringFromTable(@"WRONG_MASK",@"local",@"Le masque est incorrecte")
					defaultButton:@"Ok" 
					alternateButton:nil
					otherButton:nil 
					informativeTextWithFormat:NSLocalizedStringFromTable(@"MASK_BETWEEN",@"local",@"Une valeur entre 0 et 32")
					]
			runModal] ; 
		return;
		
	}
	if (![NSIpv4 checkIPStr:[Tipaddr stringValue]])
	{
		[[NSAlert alertWithMessageText:NSLocalizedStringFromTable (@"WRONG_IP",@"local",@"L'adresse Ip est incorrecte")
						 defaultButton:@"Ok" alternateButton:nil otherButton:nil informativeTextWithFormat:@""]
		 runModal] ; 
		return;
		
	}
		
	//On envoie les data au NSIpSubnet
		
	[monsubnet setsubfromip:[NSIpv4 IpStringToInteger:[Tipaddr stringValue]] mask:[Tmask integerValue]];
	
	[TPnet setStringValue:[monsubnet sub]];
	[TPmask setStringValue:[monsubnet cidrtoString]];
	[TPfirst setStringValue:[[[[NSIpv4 alloc] initwithint:[monsubnet firstIp]] autorelease] iptoString ]];
	[TPLast setStringValue:[[[[NSIpv4 alloc] initwithint:[monsubnet LastIp]] autorelease] iptoString ]];
	[Tbroadcast setStringValue:[[[[NSIpv4 alloc] initwithint:[monsubnet broadcast]] autorelease] iptoString ]];
	[TPSize setStringValue:[NSString stringWithFormat:@"%d",[monsubnet NumberofIp]]]; 
	
	// On redimensionne la fenetre
	
	NSRect frame = [mawin frame];
	frame.size.height=194;
	
	[mawin setFrame:frame display:TRUE animate:TRUE ];
	frame = [monsubnetprint frame];
	frame.origin.x = 17;
	
	frame.origin.y = 8;
	[monsubnetprint setFrame:frame];
	[[mavue animator] replaceSubview:monsubnetsaisie with:monsubnetprint];

	
	//On calcul les resultats :
	


		
	return;
}

-(IBAction) mesPrefs:(id)sender
{
	if (mawinpref == nil)
	{
		mawinpref = [[Preference alloc] init];
	}
	[mawinpref showWindow:self];
}


@end
