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

//Metod d'init
-(id)init;
-(id)initwithsub:(NSInteger)value cidr:(NSInteger)cidrvalue;

//Toolbox de class
+(Boolean)checkCidr:(NSInteger)value;
+(NSString *) cidrtoString:(NSInteger)value;
+(NSInteger)masktoint:(NSInteger)value;



//accesseur under control
-(void)setsubfromip:(NSInteger)subValue mask:(NSInteger)maskvalue;
-(void)setcidr:(NSInteger)value;

-(NSString *) cidrtoString; 
-(NSInteger)cidr;
-(NSString *)mask;
-(NSString *)sub;


//data
-(NSInteger)net;
-(NSInteger)firstIp;
-(NSInteger)LastIp;
-(NSInteger)broadcast;
-(NSInteger)NumberofIp;








@end
