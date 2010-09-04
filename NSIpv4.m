//
//  NSIpv4.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 04/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSIpv4.h"


@implementation NSIpv4


-(id) init
{
	[super init];
	ip = 0;
	
	return self;
}


+(Boolean)checkIPStr:(NSString *)string
{	
	NSString *pre=@"\\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\b";
	
	NSPredicate * monpredicat = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pre];
	
	
	if (string != nil) 
		return ([monpredicat evaluateWithObject:string]);
	return FALSE;
}

-(void)setip:(id)value
{
	NSString * string;
	
	
	if ( [value isKindOfClass:[NSString class]])
	{
	
		[string stringWithString:(NSString *)value];
		
	if ([NSIpv4 checkIPStr:string])
	{
		NSScanner * scan = [NSScanner scannerWithString:string];
		NSString * ipval;
		NSInteger leftShift=24, iptmp = 0;	
		while (([scan isAtEnd] == FALSE) && (leftShift >= 0))
		{
			[scan scanUpToString:@"." intoString:&ipval];
			[scan scanString:@"." intoString:NULL] ;
			iptmp = iptmp | ([ipval integerValue] << leftShift);
			leftShift -= 8;			
		}
		ip = iptmp;
	}
		
	}
	
}

-(NSString *)iptosString
{
	return nil;
}

-(NSInteger)ip
{
	return ip;
}

@end
