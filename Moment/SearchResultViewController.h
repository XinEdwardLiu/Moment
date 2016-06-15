//
//  SearchResultViewController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-14.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SearchResultViewController : NSViewController<NSTableViewDataSource,NSTabViewDelegate>
@property IBOutlet NSTableView *movieSearchResultTableView;
@property IBOutlet NSTableView *musicSearchResultTableView;
@property NSMutableArray *movieSearchResultMutableArray;
@end
