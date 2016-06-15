//
//  SearchResultViewController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-14.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "SearchResultViewController.h"
#import "AppDelegate.h"
@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    AppDelegate *appdelegate=[NSApp delegate];
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"Movie"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticSearchString]]];
    NSError *error=nil;
    NSArray *results=[moc executeFetchRequest:request error:&error];
    if (!request) {
        NSLog(@"Error fetching Movie objects:%@\n%@",[error localizedDescription],[error userInfo]);
    }
    self.movieSearchResultMutableArray=[[NSMutableArray alloc]initWithArray:results];
    [self.movieSearchResultTableView reloadData];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.movieSearchResultMutableArray count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[self.movieSearchResultMutableArray objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"type"]) {
        NSTextField *typeLabel=[tableView makeViewWithIdentifier:@"type" owner:self];
        typeLabel.stringValue=[[self.movieSearchResultMutableArray objectAtIndex:row] valueForKey:@"type"];
        return typeLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"actor"]) {
        NSTextField *actorLabel=[tableView makeViewWithIdentifier:@"actor" owner:self];
        actorLabel.stringValue=[[self.movieSearchResultMutableArray objectAtIndex:row] valueForKey:@"actor"];
        return actorLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"time"]) {
        NSTextField *timeLabel=[tableView makeViewWithIdentifier:@"time" owner:self];
        timeLabel.stringValue=[[self.movieSearchResultMutableArray objectAtIndex:row] valueForKey:@"time"];
        return timeLabel;
    }
        if ([tableColumn.identifier isEqualTo:@"score"]) {
            NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
            scoreLabel.stringValue=[[self.movieSearchResultMutableArray objectAtIndex:row] valueForKey:@"score"];
            return scoreLabel;
        }
    return nil;
}

-(IBAction)clickMovieSearchResultTableView:(id)sender{
    if ([self.movieSearchResultMutableArray count]==0) {
        return;
    }
    else{
        AppDelegate *appdelegate=[NSApp delegate];
        [AppDelegate setStaticMovie:self.movieSearchResultMutableArray[0]];
        [self.view setHidden:YES];
        [appdelegate.mainWindowController loadMovieDetailView];
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
}
@end
