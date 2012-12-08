//
//  GamingEventViewController.h
//  Bowling Score Board
//
//  Created by Laszlo Korte on 08.12.12.
//  Copyright (c) 2012 Digital Family. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@protocol GamingEventDetailViewControllerDelegate;
@interface GamingEventViewController : UITableViewController <NSFetchedResultsControllerDelegate, GamingEventDetailViewControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
