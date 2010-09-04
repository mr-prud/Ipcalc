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


//Class Method
+(Boolean)checkIPStr:(NSString *)string;


//Instance Method
-(void)setip:(id)string;


-(NSString *)iptosString;

-(NSInteger)ip;


@end
