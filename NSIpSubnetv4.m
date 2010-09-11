//
//  NSIpSubnetv4.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 04/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSIpSubnetv4.h"


@implementation NSIpSubnetv4



-(id)init
{
	return [self initwithsub:0 cidr:0];
}

-(id)initwithsub:(NSInteger)value cidr:(NSInteger)cidrvalue
{
	if (self = [super init])
	{
		mask = cidrvalue;
		ip = [[NSIpv4 alloc] init];
	}
	return self;
}

-(void)setcidr:(NSInteger)value
{
	if ((value < 33) && (value >= 0))
	{
		NSInteger i, testVal;
		for (i=0,testVal=0;i<value;i++,testVal = (testVal >> 1) | 2147483648);
		mask = testVal;
		
	}
	
}

+(NSString *) cidrtoString:(NSInteger)value 
{
	
	if (value == 0) 
		return [NSString stringWithString:@"000.000.000.000"];

	NSInteger octet1,octet2,octet3,octet4;
	NSInteger debut=2147483648;
	NSInteger i;
	for (i=1;i<value;i++,debut = (debut >> 1) | 2147483648);
	octet1 = debut >> 24;
	octet2 = (debut & 0xff0000) >> 16;
	octet3 = (debut & 0xff00) >> 8;
	octet4 = (debut & 0xff);

	NSMutableString *str = [NSMutableString stringWithFormat:@"%3d.%3d.%3d.%3d",octet1, octet2, octet3, octet4];
	[str replaceOccurrencesOfString:@" " withString:@"0" options:NSLiteralSearch range:NSMakeRange(0, [str length])];
	return str;
	
}

-(NSString *) cidrtoString 
{
	return [[self class]cidrtoString:mask];
	
}

-(NSInteger)cidr
{
	return mask;
}

+(NSInteger)masktoint:(NSInteger)value
{
	NSInteger i,debut;
	
	for (i=1;i<value;i++,debut = (debut >> 1) | 2147483648);
	return debut;
}

-(NSString *)mask
{
	return [NSString stringWithString:[self cidrtoString]];
}

-(NSString *)sub
{
	return [NSString stringWithString:[ip iptoString]];

}

+(Boolean)checkCidr:(NSInteger)value
{
	if ((value >= 0 ) && (value < 33)) 
		return TRUE;
	return FALSE;
}

-(void)setsubfromip:(NSInteger)subValue mask:(NSInteger)maskvalue
{

	if ([NSIpSubnetv4 checkCidr:maskvalue] && [NSIpv4 checkIPInt:subValue])
	{
		
		[ip setIpwithInt:(subValue & [NSIpSubnetv4 masktoint:maskvalue])];
		mask = maskvalue;
	}
}

-(NSInteger)net
{
	return [ip ip];
}

-(NSInteger)firstIp
{
	
	if ((mask == 32)|| (mask == 31))
		return [ip ip];
	else
		return ([ip ip]+1);

}
-(NSInteger)LastIp
{
	if ((mask == 32)|| (mask == 31))
		return [ip ip];
	else
		return ([ip ip] + [self NumberofIp]);
	
}

-(NSInteger)broadcast
{
	if ((mask == 32)|| (mask == 31))
		return [ip ip];
	else
		return ([ip ip] + [self NumberofIp]+1);
	
}

-(NSInteger)NumberofIp
{
	NSInteger value = 0;
	
		if (mask == 32)
			value = 1;
		else if (mask == 31)
			value =  2;
	else
		value  = (pow(2,(32-mask))-3);
	
	return value;

}

@end
