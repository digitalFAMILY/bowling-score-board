//
//  GamingEventMenuViewController.h
//  Bowling Score Board
//
//  Created by Laszlo Korte on 08.12.12.
//  Copyright (c) 2012 Digital Family. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GamingEventMenuState) {
    GamingEventMenuStateEventDetails,
    GamingEventMenuStateScoring,
    GamingEventMenuStateFood,
    GamingEventMenuStateBalance
};

@interface GamingEventMenuViewController : UITableViewController

@property (nonatomic) GamingEventMenuState menuState;

@end
