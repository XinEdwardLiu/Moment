//
//  FavoriteListViewController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-09.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FavoriteListViewController : NSViewController<NSTableViewDataSource,NSTableViewDelegate>
@property IBOutlet NSTableView *movieFavoriteListTableView;
@property IBOutlet NSTableView *musicFavoriteListTableView;
@property NSMutableArray *favoriteMovieMutableArray;
@end
