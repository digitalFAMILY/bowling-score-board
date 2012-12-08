//
//  FoodControllerViewController.h
//  Bowling Score Board
//
//  Created by Laszlo Korte on 08.12.12.
//  Copyright (c) 2012 Digital Family. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GamingEventMenuItemViewController;
@interface FoodViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,GamingEventMenuItemViewController>

@property (nonatomic, strong) id gamingEvent;

@end
