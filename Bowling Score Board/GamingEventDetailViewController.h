//
//  GamingEventDetailViewController.h
//  Bowling Score Board
//
//  Created by Laszlo Korte on 08.12.12.
//  Copyright (c) 2012 Digital Family. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamingEventMenuViewController.h"

@protocol GamingEventDetailViewControllerDelegate;

@interface GamingEventDetailViewController : UITableViewController<GamingEventMenuItemViewController>

@property (nonatomic, strong) id gamingEvent;
@property (nonatomic, weak) id<GamingEventDetailViewControllerDelegate> delegate;

@end


@protocol GamingEventDetailViewControllerDelegate <NSObject>

-(void)addGamingEvent;

@end