//
//  MovieDetailViewController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-07.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MovieDetailViewController : NSViewController

@property float score;

@property IBOutlet NSButton *oneStarBtn;
@property IBOutlet NSButton *twoStarBtn;
@property IBOutlet NSButton *threeStarBtn;
@property IBOutlet NSButton *fourStarBtn;
@property IBOutlet NSButton *fiveStarBtn;
@property IBOutlet NSTextField *scoreTextField;
@property NSMutableArray *messageMutableArray;
@property IBOutlet NSButton *submitCommentBtn;
@property IBOutlet NSTextField *messageTextField;
@property IBOutlet NSTableView *messageTableView;
@property NSString *message;


@property IBOutlet NSTextField *nameLabel;
@property IBOutlet NSTextField *typeLabel;
@property IBOutlet NSTextField *introductionLabel;
@property IBOutlet NSImageView *imageView;
@property IBOutlet NSTextField *actorLabel;
@property IBOutlet NSImageView *resultStarImageView;
@property IBOutlet NSTextField *resultScoreLabel;


@property IBOutlet NSButton *addToFavoriteBtn;
@property IBOutlet NSButton *giveScoreBtn;

@end
