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
    
    [self loadRegisterView];
  //  if ([AppDelegate getStaticAccountState]==NO)
  //  {
  //      [self loadRegisterView];
  //  }
  //  else if([AppDelegate getStaticAccountState]==YES)
  //  {
  //      [self loadAboardView];
  //  }
    
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

-(void)loadMusicDetailView{
    self.musicDetailViewController=[[MusicDetailViewController alloc]initWithNibName:@"MusicDetailView" bundle:nil];
    [self.window.contentView addSubview:self.musicDetailViewController.view];
    NSRect detailFrame=NSMakeRect(179, 47, 846, 468);
    [self.musicDetailViewController.view setFrame:detailFrame];
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
    [self.musicDetailViewController.view setHidden:YES];
    [self.registerViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self.aboardViewController.historyListViewController.view setHidden:YES];
    [self.searchResultViewController.view setHidden:YES];
    
    [self.window.contentView addSubview:self.mainView];
    [self.mainMovieTableView reloadData];
    [self.mainMusicTableView reloadData];
}

-(IBAction)clickMovieBtn:(id)sender{
    [self.movieBtn setImage:[NSImage imageNamed:@"Movie_Yellow"]];
    [self.mainBtn setImage:[NSImage imageNamed:@"Main"]];
    [self.musicBtn setImage:[NSImage imageNamed:@"Music"]];
    
    [self.movieRankTableView reloadData];
    [self.movieAllTableView reloadData];
    NSRect showFrame=NSMakeRect(179, 47, 846, 468);
    [self.movieView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:NO];
    [self.musicView setHidden:YES];
    [self.window.contentView addSubview:self.movieView];
    
    [self.movieDetailViewController.view setHidden:YES];
    [self.musicDetailViewController.view setHidden:YES];
    [self.registerViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self.searchResultViewController.view setHidden:YES];
}

-(IBAction)clickMusicBtn:(id)sender{
    [self.musicBtn setImage:[NSImage imageNamed:@"Music_Yellow"]];
    [self.mainBtn setImage:[NSImage imageNamed:@"Main"]];
    [self.movieBtn setImage:[NSImage imageNamed:@"Movie"]];
    
    [self.musicRankTableView reloadData];
    [self.musicAllTableView reloadData];
    NSRect showFrame=NSMakeRect(179, 47, 846, 468);
    [self.musicView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.musicView setHidden:NO];
    [self.window.contentView addSubview:self.musicView];
    
    [self.movieDetailViewController.view setHidden:YES];
    [self.musicDetailViewController.view setHidden:YES];
    [self.registerViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self.searchResultViewController.view setHidden:YES];
}

-(IBAction)clickMovieTableView:(id)sender{
    AppDelegate *appdelegate=[NSApp delegate];
    NSInteger row=self.mainMovieTableView.selectedRow;
    
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Movie"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Movie objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    [AppDelegate setStaticMovie:results[row]];
    [self hiddenViews];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self.aboardViewController.historyListViewController.view setHidden:YES];
    [self loadMovieDetailView];
    [self.movieDetailViewController.view setHidden:NO];
    //
    if ([AppDelegate getStaticAccountState]==YES)
    {
        AppDelegate *appdelegate=[NSApp delegate];
        NSManagedObjectContext *moc=appdelegate.managedObjectContext;
        NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticUser].name]];
        NSError *error=nil;
        NSArray *results=[moc executeFetchRequest:request error:&error];
        if (!request) {
            NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
        }
        
        if ([[results[0] valueForKey:@"historyMovie"] count]==0)
        {
            [results[0] setValue:[NSSet setWithObject:[AppDelegate getStaticMovie]] forKey:@"historyMovie"];
        }
        else
        {
            if ([[results[0] valueForKey:@"historyMovie"] containsObject:[AppDelegate getStaticMovie]])
            {
                return;
            }
            else{
                NSMutableSet *set=[results[0] mutableSetValueForKey:@"historyMovie"];
                [set addObject:[AppDelegate getStaticMovie]];
                [results[0] setValue:set forKey:@"historyMovie"];
            }
        }
        [appdelegate.managedObjectContext save:nil];
        [appdelegate.mainWindowController.aboardViewController.historyListViewController.movieHistoryListTableView reloadData];
    }

}

-(IBAction)clickMovieAllTableView:(id)sender{
    AppDelegate *appdelegate=[NSApp delegate];
    NSInteger row=self.movieAllTableView.selectedRow;
    
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Movie"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Movie objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    [AppDelegate setStaticMovie:results[row]];
    [self hiddenViews];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self.aboardViewController.historyListViewController.view setHidden:YES];
    [self loadMovieDetailView];
    [self.movieDetailViewController.view setHidden:NO];
    
    //
    if ([AppDelegate getStaticAccountState]==YES)
    {
        AppDelegate *appdelegate=[NSApp delegate];
        NSManagedObjectContext *moc=appdelegate.managedObjectContext;
        NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticUser].name]];
        NSError *error=nil;
        NSArray *results=[moc executeFetchRequest:request error:&error];
        if (!request) {
            NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
        }
    
        if ([[results[0] valueForKey:@"historyMovie"] count]==0)
        {
            [results[0] setValue:[NSSet setWithObject:[AppDelegate getStaticMovie]] forKey:@"historyMovie"];
        }
        else
        {
            if ([[results[0] valueForKey:@"historyMovie"] containsObject:[AppDelegate getStaticMovie]])
            {
            return;
            }
            else{
                NSMutableSet *set=[results[0] mutableSetValueForKey:@"historyMovie"];
                [set addObject:[AppDelegate getStaticMovie]];
                [results[0] setValue:set forKey:@"historyMovie"];
        }
    }
        [appdelegate.managedObjectContext save:nil];
        [appdelegate.mainWindowController.aboardViewController.historyListViewController.movieHistoryListTableView reloadData];
    }
}

-(IBAction)clickMovieRankTableView:(id)sender{
    AppDelegate *appdelegate=[NSApp delegate];
    NSInteger row=self.movieRankTableView.selectedRow;
    
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Movie"];
    NSSortDescriptor *sort=[[NSSortDescriptor alloc]initWithKey:@"score" ascending:NO];
    [request setSortDescriptors:@[sort]];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Movie objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    [AppDelegate setStaticMovie:results[row]];
    [self hiddenViews];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self.aboardViewController.historyListViewController.view setHidden:YES];
    [self loadMovieDetailView];
    [self.movieDetailViewController.view setHidden:NO];
//
    if ([AppDelegate getStaticAccountState]==YES)
    {
        AppDelegate *appdelegate=[NSApp delegate];
        NSManagedObjectContext *moc=appdelegate.managedObjectContext;
        NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticUser].name]];
        NSError *error=nil;
        NSArray *results=[moc executeFetchRequest:request error:&error];
        if (!request) {
            NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
        }
        
        if ([[results[0] valueForKey:@"historyMovie"] count]==0)
        {
            [results[0] setValue:[NSSet setWithObject:[AppDelegate getStaticMovie]] forKey:@"historyMovie"];
        }
        else
        {
            if ([[results[0] valueForKey:@"historyMovie"] containsObject:[AppDelegate getStaticMovie]])
            {
                return;
            }
            else{
                NSMutableSet *set=[results[0] mutableSetValueForKey:@"historyMovie"];
                [set addObject:[AppDelegate getStaticMovie]];
                [results[0] setValue:set forKey:@"historyMovie"];
            }
        }
        [appdelegate.managedObjectContext save:nil];
        [appdelegate.mainWindowController.aboardViewController.historyListViewController.movieHistoryListTableView reloadData];
    }
}

-(IBAction)clickMusicTableView:(id)sender{
    AppDelegate *appdelegate=[NSApp delegate];
    NSInteger row=self.mainMusicTableView.selectedRow;
    
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Music"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Music objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    [AppDelegate setStaticMusic:results[row]];
    [self hiddenViews];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self.aboardViewController.historyListViewController.view setHidden:YES];
    [self loadMusicDetailView];
    //
    if ([AppDelegate getStaticAccountState]==YES)
    {
        AppDelegate *appdelegate=[NSApp delegate];
        NSManagedObjectContext *moc=appdelegate.managedObjectContext;
        NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticUser].name]];
        NSError *error=nil;
        NSArray *results=[moc executeFetchRequest:request error:&error];
        if (!request) {
            NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
        }
        
        if ([[results[0] valueForKey:@"historyMusic"] count]==0)
        {
            [results[0] setValue:[NSSet setWithObject:[AppDelegate getStaticMusic]] forKey:@"historyMusic"];
        }
        else
        {
            if ([[results[0] valueForKey:@"historyMusic"] containsObject:[AppDelegate getStaticMusic]])
            {
                return;
            }
            else{
                NSMutableSet *set=[results[0] mutableSetValueForKey:@"historyMusic"];
                [set addObject:[AppDelegate getStaticMusic]];
                [results[0] setValue:set forKey:@"historyMusic"];
            }
        }
        [appdelegate.managedObjectContext save:nil];
        [appdelegate.mainWindowController.aboardViewController.historyListViewController.musicHistoryListTableView reloadData];
    }
}

-(IBAction)clickMusicAllTableView:(id)sender{
    AppDelegate *appdelegate=[NSApp delegate];
    NSInteger row=self.musicAllTableView.selectedRow;
    
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Music"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Music objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    [AppDelegate setStaticMusic:results[row]];
    [self hiddenViews];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self.aboardViewController.historyListViewController.view setHidden:YES];
    [self loadMusicDetailView];
    //
    if ([AppDelegate getStaticAccountState]==YES)
    {
        AppDelegate *appdelegate=[NSApp delegate];
        NSManagedObjectContext *moc=appdelegate.managedObjectContext;
        NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticUser].name]];
        NSError *error=nil;
        NSArray *results=[moc executeFetchRequest:request error:&error];
        if (!request) {
            NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
        }
        
        if ([[results[0] valueForKey:@"historyMusic"] count]==0)
        {
            [results[0] setValue:[NSSet setWithObject:[AppDelegate getStaticMusic]] forKey:@"historyMusic"];
        }
        else
        {
            if ([[results[0] valueForKey:@"historyMusic"] containsObject:[AppDelegate getStaticMusic]])
            {
                return;
            }
            else{
                NSMutableSet *set=[results[0] mutableSetValueForKey:@"historyMusic"];
                [set addObject:[AppDelegate getStaticMusic]];
                [results[0] setValue:set forKey:@"historyMusic"];
            }
        }
        [appdelegate.managedObjectContext save:nil];
        [appdelegate.mainWindowController.aboardViewController.historyListViewController.musicHistoryListTableView reloadData];
    }
}

-(IBAction)clickMusicRankTableView:(id)sender{
    AppDelegate *appdelegate=[NSApp delegate];
    NSInteger row=self.musicRankTableView.selectedRow;
    
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Music"];
    NSSortDescriptor *sort=[[NSSortDescriptor alloc]initWithKey:@"score" ascending:NO];
    [request setSortDescriptors:@[sort]];
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Music objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    [AppDelegate setStaticMusic:results[row]];
    [self hiddenViews];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self.aboardViewController.historyListViewController.view setHidden:YES];
    [self loadMusicDetailView];
    //
    if ([AppDelegate getStaticAccountState]==YES)
    {
        AppDelegate *appdelegate=[NSApp delegate];
        NSManagedObjectContext *moc=appdelegate.managedObjectContext;
        NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticUser].name]];
        NSError *error=nil;
        NSArray *results=[moc executeFetchRequest:request error:&error];
        if (!request) {
            NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
        }
        
        if ([[results[0] valueForKey:@"historyMusic"] count]==0)
        {
            [results[0] setValue:[NSSet setWithObject:[AppDelegate getStaticMusic]] forKey:@"historyMusic"];
        }
        else
        {
            if ([[results[0] valueForKey:@"historyMusic"] containsObject:[AppDelegate getStaticMusic]])
            {
                return;
            }
            else{
                NSMutableSet *set=[results[0] mutableSetValueForKey:@"historyMusic"];
                [set addObject:[AppDelegate getStaticMusic]];
                [results[0] setValue:set forKey:@"historyMusic"];
            }
        }
        [appdelegate.managedObjectContext save:nil];
        [appdelegate.mainWindowController.aboardViewController.historyListViewController.musicHistoryListTableView reloadData];
    }
}

//seraching
- (void)awakeFromNib
{
    // add the searchMenu to this control, allowing recent searches to be added.
    // note that we could build this menu inside our nib, but for clarity we're
    // building the menu in code to illustrate the use of tags:
    //		NSSearchFieldRecentsTitleMenuItemTag, NSSearchFieldNoRecentsMenuItemTag, etc.
    
    if ([self.searchField respondsToSelector:@selector(setRecentSearches:)])
    {
        NSMenu *searchMenu = [[NSMenu alloc] initWithTitle:@"Search Menu"];
        [searchMenu setAutoenablesItems:YES];
        
        // first add our custom menu item (Important note: "action" MUST be valid or the menu item is disabled)
        NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:@"Custom" action:nil keyEquivalent:@""];
        [item setTarget: self];
        [searchMenu insertItem:item atIndex:0];
        
        // add our own separator to keep our custom menu separate
        NSMenuItem *separator =  [NSMenuItem separatorItem];
        [searchMenu insertItem:separator atIndex:1];
        
        NSMenuItem *recentsTitleItem = [[NSMenuItem alloc] initWithTitle:@"Recent Searches" action:nil keyEquivalent:@""];
        // tag this menu item so NSSearchField can use it and respond to it appropriately
        [recentsTitleItem setTag:NSSearchFieldRecentsTitleMenuItemTag];
        [searchMenu insertItem:recentsTitleItem atIndex:2];
        
        NSMenuItem *norecentsTitleItem = [[NSMenuItem alloc] initWithTitle:@"No recent searches" action:nil keyEquivalent:@""];
        // tag this menu item so NSSearchField can use it and respond to it appropriately
        [norecentsTitleItem setTag:NSSearchFieldNoRecentsMenuItemTag];
        [searchMenu insertItem:norecentsTitleItem atIndex:3];
        
        NSMenuItem *recentsItem = [[NSMenuItem alloc] initWithTitle:@"Recents" action:nil keyEquivalent:@""];
        // tag this menu item so NSSearchField can use it and respond to it appropriately
        [recentsItem setTag:NSSearchFieldRecentsMenuItemTag];
        [searchMenu insertItem:recentsItem atIndex:4];
        
        NSMenuItem *separatorItem = (NSMenuItem*)[NSMenuItem separatorItem];
        // tag this menu item so NSSearchField can use it, by hiding/show it appropriately:
        [separatorItem setTag:NSSearchFieldRecentsTitleMenuItemTag];
        [searchMenu insertItem:separatorItem atIndex:5];
        
        NSMenuItem *clearItem = [[NSMenuItem alloc] initWithTitle:@"Clear" action:nil keyEquivalent:@""];
        [clearItem setTag:NSSearchFieldClearRecentsMenuItemTag];	// tag this menu item so NSSearchField can use it
        [searchMenu insertItem:clearItem atIndex:6];
        
        id searchCell = [self.searchField cell];
        [searchCell setMaximumRecents:20];
        [searchCell setSearchMenuTemplate:searchMenu];
    }
}

-(IBAction)clickSearchField:(id)sender{
    [self.searchResultViewController.view setHidden:YES];
    NSString *searchFieldString=self.searchField.stringValue;
    [AppDelegate setStaticSearchString:searchFieldString];
    
    self.searchResultViewController=[[SearchResultViewController alloc]initWithNibName:@"SearchResultView" bundle:nil];
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    [self.searchResultViewController.view setFrame:showFrame];
    [self hiddenViews];
    [self.registerViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.registerInfoViewController.view setHidden:YES];
    [self.aboardViewController.favoriteListViewController.view setHidden:YES];
    [self.aboardViewController.historyListViewController.view setHidden:YES];
    [self.movieDetailViewController.view setHidden:YES];
    [self.musicDetailViewController.view setHidden:YES];
    [self.window.contentView addSubview:self.searchResultViewController.view];
}


@end
