//
//  ipdata.h
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 17/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#define	CIDR	1
#define MASK	0


@interface ipdata : NSObject {

	NSInteger mask:32;
	NSInteger ipaddr:32;
}

-(id)init;
+(NSString *) cidrtoString:(NSInteger)value;

+(Boolean)checkIPStr:(NSString *)string;
+(Boolean)checkCidr:(NSInteger)value;

//accesseur under control
-(void)setcidr:(NSInteger)value;
-(NSInteger)cidr;

-(void)setipaddr:(NSString *)string;

@end
