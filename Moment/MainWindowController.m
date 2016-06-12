//
//  MainWindowController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-02.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "MainWindowController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
@interface MainWindowController ()

@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    [self hiddenTitleBar];
    [self setWindowBackgroundColor];
    
    if ([AppDelegate getStaticAccountState]==NO)
    {
        [self loadRegisterView];
    }
    else if([AppDelegate getStaticAccountState]==YES)
    {
        [self loadAboardView];
    }
    
    self.mainView=[self.mainTab tabViewItemAtIndex:0].view;
    self.movieView=[self.mainTab tabViewItemAtIndex:1].view;
    self.musicView=[self.mainTab tabViewItemAtIndex:2].view;
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
      
}
-(id)initWithWindowNibName:(NSString *)windowNibName{
    if (self=[super initWithWindowNibName:windowNibName]) {
        [self showWindow:self];
    }
    return  self;
}

-(void)hiddenTitleBar{
    self.window.titleVisibility=NSWindowTitleHidden;
    self.window.titlebarAppearsTransparent=YES;
    self.window.styleMask|=NSFullSizeContentViewWindowMask;
}
-(void)setWindowBackgroundColor{
    self.window.backgroundColor=[NSColor purpleColor];
}

-(void)loadRegisterView{
    self.registerViewController=[[RegisterViewController alloc]initWithNibName:@"RegisterView" bundle:nil];
    [self.window.contentView addSubview:self.registerViewController.view];
    NSRect registerFrame=NSMakeRect(0, 47, 179, 468);
    [self.registerViewController.view setFrame:registerFrame];
}

-(void)loadAboardView{
    self.aboardViewController=[[AboardViewController alloc]initWithNibName:@"AboardView" bundle:nil];
    [self.window.contentView addSubview:self.aboardViewController.view];
    NSRect registerFrame=NSMakeRect(0, 47, 179, 468);
    [self.aboardViewController.view setFrame:registerFrame];
}

-(void)loadMovieDetailView{
    self.movieDetailViewController=[[MovieDetailViewController alloc]initWithNibName:@"MovieDetailView" bundle:nil];
    [self.window.contentView addSubview:self.movieDetailViewController.view];
    NSRect detailFrame=NSMakeRect(179, 47, 846, 468);
    [self.movieDetailViewController.view setFrame:detailFrame];

}

-(void)hiddenViews{
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.musicView setHidden:YES];
}

-(IBAction)clickMainBtn:(id)sender{
    [self.mainBtn setImage:[NSImage imageNamed:@"Main_Yellow"]];
    [self.movieBtn setImage:[NSImage imageNamed:@"Movie"]];
    [self.musicBtn setImage:[NSImage imageNamed:@"Music"]];
    
    NSRect showFrame=NSMakeRect(179, 47, 846, 468);
    [self.mainView setHidden:NO];
    [self.mainView setFrame:showFrame];
    [self.movieView setHidden:YES];
    [self.musicView setHidden:YES];
    
    
    [self.movieDetailViewController.view setHidden:YES];
    [self.registerViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    
    [self.window.contentView addSubview:self.mainView];
}

-(IBAction)clickMovieBtn:(id)sender{
    [self.movieBtn setImage:[NSImage imageNamed:@"Movie_Yellow"]];
    [self.mainBtn setImage:[NSImage imageNamed:@"Main"]];
    [self.musicBtn setImage:[NSImage imageNamed:@"Music"]];
    
    NSRect showFrame=NSMakeRect(179, 47, 846, 468);
    [self.movieView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:NO];
    [self.musicView setHidden:YES];
    [self.window.contentView addSubview:self.movieView];
    
    [self.movieDetailViewController.view setHidden:YES];
    [self.registerViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
}

-(IBAction)clickMusicBtn:(id)sender{
    [self.musicBtn setImage:[NSImage imageNamed:@"Music_Yellow"]];
    [self.mainBtn setImage:[NSImage imageNamed:@"Main"]];
    [self.movieBtn setImage:[NSImage imageNamed:@"Movie"]];
    
    NSRect showFrame=NSMakeRect(179, 47, 846, 468);
    [self.musicView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.musicView setHidden:NO];
    [self.window.contentView addSubview:self.musicView];
    
    [self.movieDetailViewController.view setHidden:YES];
    [self.registerViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
}

-(IBAction)clickMovieTableView:(id)sender{
    AppDelegate *appdelegate=[NSApp delegate];
    NSInteger row=self.mainMovieTableView.selectedRow;
    
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Movie"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching User objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }

    [AppDelegate setStaticMovie:results[row]];
    [self.mainView setHidden:YES];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self loadMovieDetailView];
    [self.movieDetailViewController.view setHidden:NO];
}


@end
