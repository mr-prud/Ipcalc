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

	
	int mask:32;
	NSIpv4 *ip;
	
}

//Metod d'init
-(id)init;
-(id)initwithsub:(int)value cidr:(int)cidrvalue;

//Toolbox de class
+(Boolean)checkCidr:(int)value;
+(NSString *) cidrtoString:(int)value;
+(int)masktoint:(int)value;



//accesseur under control
-(void)setsubfromip:(int)subValue mask:(int)maskvalue;
-(void)setcidr:(int)value;

-(NSString *) cidrtoString; 
-(int)cidr;
-(NSString *)mask;
-(NSString *)sub;


//data
-(int)net;
-(int)firstIp;
-(int)LastIp;
-(int)broadcast;
-(int)NumberofIp;








@end
