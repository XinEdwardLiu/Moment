//
//  MainWindowController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-02.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RegisterViewController.h"
#import "AboardViewController.h"
#import "MovieDetailViewController.h"
#import "MusicDetailViewController.h"

@interface MainWindowController : NSWindowController
@property (strong) IBOutlet RegisterViewController *registerViewController;
@property (strong) IBOutlet AboardViewController *aboardViewController;
@property (strong) IBOutlet MovieDetailViewController *movieDetailViewController;
@property (strong) IBOutlet MusicDetailViewController *musicDetailViewController;

@property IBOutlet NSTabView *mainTab;
@property NSView *mainView;
@property NSView *movieView;
@property NSView *musicView;

@property IBOutlet NSButton *mainBtn;
@property IBOutlet NSButton *movieBtn;
@property IBOutlet NSButton *musicBtn;

@property IBOutlet NSTableView *mainMovieTableView;
@property IBOutlet NSTableView *mainMusicTableView;
@property IBOutlet NSTableView *movieAllTableView;
@property IBOutlet NSTableView *musicAllTableView;
@property IBOutlet NSTableView *movieRankTableView;
@property IBOutlet NSTableView *musicRankTableView;

-(void)hiddenViews;
-(void)loadRegisterView;
-(void)loadAboardView;
-(void)loadMovieDetailView;

@end
