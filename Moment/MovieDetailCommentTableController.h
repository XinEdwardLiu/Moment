//
//  MovieDetailCommentTableController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-08.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface MovieDetailCommentTableController : NSObject<NSTableViewDataSource,NSTableViewDelegate>
@property NSMutableArray *commentMutableArray;
@end
