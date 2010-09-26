//
//  NSIpv4.h
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 04/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSIpv4 : NSObject {
	int ip:32;

}

-(id)init;
-(id)initwithString:(NSString *)stringValue;
-(id)initwithint:(int)intValue;



//Class Method
+(Boolean)checkIPStr:(NSString *)string;
+(Boolean)checkIPInt:(int)value;


+(int)IpStringToInteger:(NSString *)string;

//Instance Method
-(void)setIpwithInt:(int)value;
-(void)setIpwithString:(NSString *)value;



-(NSString *)iptoString;
-(int)ip;



@end
