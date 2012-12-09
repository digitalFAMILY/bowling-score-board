//
//  LocationEditViewController.h
//  Bowling Score Board
//
//  Created by Markus Ullmann on 08.12.12.
//  Copyright (c) 2012 Digital Family. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"

@interface LocationEditViewController : CoreDataTableViewController

- (id)initInManagedObjectContext:(NSManagedObjectContext *)context;

@end
