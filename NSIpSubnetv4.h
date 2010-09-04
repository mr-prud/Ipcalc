//
//  NSIpSubnetv4.h
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 04/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSIpv4.h"



@interface NSIpSubnetv4 : NSObject {

	
	NSInteger mask:32;
	NSIpv4 *ip;
	
}

+(Boolean)checkCidr:(NSInteger)value;
+(NSString *) cidrtoString:(NSInteger)value;
-(NSString *) cidrtoString; 


//accesseur under control
-(void)setcidr:(NSInteger)value;
-(NSInteger)cidr;



@end
