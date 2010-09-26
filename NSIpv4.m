//
//  NSIpv4.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 04/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSIpv4.h"


@implementation NSIpv4


//*************
// Methode d'init
//*************
-(id) init
{
	return [self initwithint:0];
}

-(id)initwithString:(NSString *)stringValue
{
	return [self initwithint:[NSIpv4 IpStringToInteger:stringValue]];
}

-(id)initwithint:(int)intValue
{
	if (self = [super init])
	{
		ip = intValue;
	}
	return self;
}


//*************
// methode de classe
//*************

+(Boolean)checkIPStr:(NSString *)string
{	
	NSString *pre=@"\\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\b";
	
	NSPredicate * monpredicat = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pre];
	
	
	if (string != nil) 
		return ([monpredicat evaluateWithObject:string]);
	return FALSE;
}

+(Boolean)checkIPInt:(int)value
{
	return ((value <=0) || (value<= 0xffffffff));
}

+(int)IpStringToInteger:(NSString *)string;
{
	int rtValue = 0;
	
		if ([NSIpv4 checkIPStr:string])
		{
			NSScanner * scan = [NSScanner scannerWithString:string];
			NSString * ipval;
			int leftShift=24, iptmp = 0;	
			while (([scan isAtEnd] == FALSE) && (leftShift >= 0))
			{
				[scan scanUpToString:@"." intoString:&ipval];
				[scan scanString:@"." intoString:NULL] ;
				iptmp = iptmp | ([ipval integerValue] << leftShift);
				leftShift -= 8;			
			}
			rtValue = iptmp;
		}
	
	return rtValue;
		
	
	
}


//*************
// Accesseurs
//*************

-(void)setIpwithString:(NSString *)value
{
	
	ip = [NSIpv4 IpStringToInteger:value];
		
		
}

-(void)setIpwithInt:(int)value
{
	if ((value <=0) || (value<= 0xffffffff))
		ip = value;
}



-(NSString *)iptoString
{
	return [NSString stringWithFormat:@"%d.%d.%d.%d",((ip & 0xff000000) >> 24)
			,((ip & 0xff0000) >> 16)
			,((ip & 0xff00) >> 8)
			,(ip & 0xff)];
}

-(int)ip
{
	return ip;
}

@end
