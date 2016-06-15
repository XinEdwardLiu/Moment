//
//  HistoryMusicListTableController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-14.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface HistoryMusicListTableController : NSObject<NSTableViewDelegate,NSTableViewDataSource>
@property NSMutableArray *musicHistoryListMutableArray;
@property IBOutlet NSTableView *musicHistoryTableView;
@end
