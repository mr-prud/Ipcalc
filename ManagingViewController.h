//
//  ManagingViewController.h
//  ipCalc for Mac
//
//  Created by Gaël Prudhomme on 05/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ManagingViewController : NSViewController {
	NSManagedObjectContext * managedobjectcontext;

}
@property (retain)NSManagedObjectContext * managedobjectcontext;

@end
