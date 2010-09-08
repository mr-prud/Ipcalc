//
//  ManagingViewController.m
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 05/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ManagingViewController.h"


@implementation ManagingViewController
@synthesize managedobjectcontext;

-(void)dealloc
{
	[managedobjectcontext dealloc];
	[super dealloc];
}

@end
