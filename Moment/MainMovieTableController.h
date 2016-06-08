//
//  MainMovieTableController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-07.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>


@interface MainMovieTableController : NSObject<NSTableViewDataSource,NSTableViewDelegate>
@property IBOutlet NSTableView *mainMovieTableView;
@property NSMutableArray *movieMutableArray;
@end
