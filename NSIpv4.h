//
//  NSIpv4.h
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 04/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSIpv4 : NSObject {
	NSInteger ip:32;

}

-(id)init;
-(id)initwithString:(NSString *)stringValue;
-(id)initwithint:(NSInteger)intValue;



//Class Method
+(Boolean)checkIPStr:(NSString *)string;
+(Boolean)checkIPInt:(NSInteger)value;


+(NSInteger)IpStringToInteger:(NSString *)string;

//Instance Method
-(void)setIpwithInt:(NSInteger)value;
-(void)setIpwithString:(NSString *)value;



-(NSString *)iptoString;
-(NSInteger)ip;



@end
