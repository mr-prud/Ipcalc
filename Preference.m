//
//  Preference.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 11/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Preference.h"


@implementation Preference

-(id)init
{
	if (![super initWithWindowNibName:@"Preference"])
	{
		return nil;
	}
	return self;
}


-(void)windowDidLoad
{
	[Tmaskdefaut setIntValue:[self maskdefault]];
}

-(IBAction)Maskchange:(id)sender
{
	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	[defaults setInteger:[Tmaskdefaut intValue] forKey:@"maskdefault"];
}

-(NSInteger)maskdefault
{
	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	return [defaults integerForKey:@"maskdefault"];
}

@end
