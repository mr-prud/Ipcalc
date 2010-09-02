//
//  ipdata.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 17/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ipdata.h"


@implementation ipdata

-(id) init
{
	[super init];
	
	mask = 0;
	ipaddr = 0;
	
	return self;
}



+(NSString *) cidrtoString:(NSInteger)value 
{
	NSInteger octet1,octet2,octet3,octet4;
	
	NSInteger debut=2147483648;
	NSInteger i;
	for (i=1;i<value;i++,debut = (debut >> 1) | 2147483648);
	octet1 = value >> 24;
	octet2 = (value && 0xff0000) >> 16;
	octet3 = (value && 0xff00) >> 8;
	octet4 = (value && 0xff);
	
	return [NSString stringWithFormat:@"%d.%d.%d.%d",octet1, octet2, octet3, octet4];

}

-(void)setcidr:(NSInteger)value
{
	if ((value < 33) && (value >= 0))
	{
		NSInteger i, testVal;
		for (i=0,testVal=0;i<value;i++,testVal = (testVal >> 1) | 2147483648);
		mask = testVal;
		NSLog (@"mask = %X",testVal);
		
	}

}

-(void)setipaddr:(NSString *)string
{
	if ([ipdata checkIPStr:string])
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
		ipaddr = iptmp;
	}
	
}


+(Boolean)checkCidr:(NSInteger)value
{
	if ((value >= 0 ) && (value < 33)) 
	return TRUE;
	return FALSE;
}

+(Boolean)checkmask:(NSInteger)value
{
	NSInteger testVal=2147483648;
	NSInteger i;
	Boolean result = FALSE;
	for (i=1;i<32;i++)
	{
		if (value == testVal)
			result = TRUE;
		testVal = (testVal >> 1) | 2147483648;
	}
	return result;
}

+(Boolean)checkIPStr:(NSString *)string
{	
	NSString *pre=@"\\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\b";
	
	NSPredicate * monpredicat = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pre];
	
	
	if (string != nil) 
		return ([monpredicat evaluateWithObject:string]);
	return FALSE;
}

-(NSInteger)cidr
{
	return mask;
}

@end
