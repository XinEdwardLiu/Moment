//
//  MovieRankTableController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-13.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface MovieRankTableController : NSObject<NSTableViewDelegate,NSTableViewDataSource>
@property NSMutableArray *movieMutableArray;
@end
