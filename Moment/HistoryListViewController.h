//
//  HistoryListViewController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-13.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface HistoryListViewController : NSViewController<NSTableViewDataSource,NSTableViewDelegate>
@property IBOutlet NSTableView *movieHistoryListTableView;
@property IBOutlet NSTableView *musicHistoryListTableView;

@property NSMutableArray *movieHistoryListMutableArray;
@end
