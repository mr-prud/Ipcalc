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
	
	return [NSIpSubnetv4 cidrtoString:cidr];
   	
}
@end
