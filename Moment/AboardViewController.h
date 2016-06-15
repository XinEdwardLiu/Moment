//
//  AboardViewController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-03.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RegisterInfoViewController.h"
#import "FavoriteListViewController.h"
#import "HistoryListViewController.h"

@interface AboardViewController : NSViewController
@property IBOutlet NSTextField *nameLabel;
@property IBOutlet NSButton *favoriteListBtn;
@property IBOutlet NSButton *historyListBtn;
@property IBOutlet NSButton *quitBtn;

@property (strong) IBOutlet RegisterInfoViewController *registerInfoViewController;
@property (strong) IBOutlet FavoriteListViewController *favoriteListViewController;
@property (strong) IBOutlet HistoryListViewController *historyListViewController;
@end
