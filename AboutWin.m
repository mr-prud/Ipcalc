//
//  AboutWin.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 11/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AboutWin.h"


@implementation AboutWin
-(id)init
{
	if (![super initWithWindowNibName:@"AboutWin"])
	{
		return nil;
	}
	return self;
}

-(void)windowDidLoad
{
	NSString * tempstr = [[NSString alloc]initWithString:[Tversion stringValue]];
	
	[Tversion setStringValue:[NSString stringWithFormat:tempstr, [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleGetInfoString"],[[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleShortVersionString"]]];

	[[Tabout mainFrame] loadRequest:[NSURLRequest 
									  requestWithURL:[NSURL 
													  fileURLWithPath:[[NSBundle mainBundle]
																	   pathForResource:@"about" 
																	   ofType:@"html"]]]];
}

@end
