//
//  CidrtostrTransformer.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 25/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CidrtostrTransformer.h"


@implementation CidrtostrTransformer

+ (Class)transformedValueClass
{
    return [NSString class];
}

+ (BOOL)allowsReverseTransformation
{
    return FALSE;
}

- (id)transformedValue:(id)value
{
    int cidr;
	
    if (value == nil) return nil;
	
    // Attempt to get a reasonable value from the
    // value object.
    if ([value respondsToSelector: @selector(intValue)]) {
		// handles NSString and NSNumber
        cidr = [value intValue];
    } else {
        [NSException raise: NSInternalInconsistencyException
                    format: @"Value (%@) does not respond to -floatValue.",
		 [value class]];
    }
	
	if (cidr == 0) return [NSString stringWithString:@"000.000.000.000"];
	NSInteger octet1,octet2,octet3,octet4;
	
	NSInteger debut=2147483648;
	NSInteger i;
	for (i=1;i<cidr;i++,debut = (debut >> 1) | 2147483648);
	octet1 = debut >> 24;
	octet2 = (debut & 0xff0000) >> 16;
	octet3 = (debut & 0xff00) >> 8;
	octet4 = (debut & 0xff);
	
	NSMutableString *str = [NSMutableString stringWithFormat:@"%3d.%3d.%3d.%3d",octet1, octet2, octet3, octet4];
	[str replaceOccurrencesOfString:@" " withString:@"0" options:NSLiteralSearch range:NSMakeRange(0, [str length])];
	
	return str;
   	
}
@end
