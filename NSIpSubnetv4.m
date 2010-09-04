//
//  NSIpSubnetv4.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 04/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSIpSubnetv4.h"


@implementation NSIpSubnetv4


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

-(NSString *) cidrtoString 
{
	NSInteger octet1,octet2,octet3,octet4;
	
	NSInteger debut=2147483648;
	NSInteger i,value=mask;
	
	for (i=1;i<value;i++,debut = (debut >> 1) | 2147483648);
	octet1 = value >> 24;
	octet2 = (value && 0xff0000) >> 16;
	octet3 = (value && 0xff00) >> 8;
	octet4 = (value && 0xff);
	
	return [NSString stringWithFormat:@"%d.%d.%d.%d",octet1, octet2, octet3, octet4];
	
}




-(NSInteger)cidr
{
	return mask;
}


+(Boolean)checkCidr:(NSInteger)value
{
	if ((value >= 0 ) && (value < 33)) 
		return TRUE;
	return FALSE;
}
@end