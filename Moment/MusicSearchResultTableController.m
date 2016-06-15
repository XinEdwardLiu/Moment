//
//  MusicSearchResultTableController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-14.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "MusicSearchResultTableController.h"
#import "AppDelegate.h"

@implementation MusicSearchResultTableController

- (id)init{
    if (self=[super init]) {
    AppDelegate *appdelegate=[NSApp delegate];
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"Music"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticSearchString]]];
    NSError *error=nil;
    NSArray *results=[moc executeFetchRequest:request error:&error];
    if (!request) {
        NSLog(@"Error fetching Music objects:%@\n%@",[error localizedDescription],[error userInfo]);
    }
    self.musicSearchResultMutableArray=[[NSMutableArray alloc]initWithArray:results];
    [self.musicSearchResultTableView reloadData];
}
    return self;
}
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.musicSearchResultMutableArray count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[self.musicSearchResultMutableArray objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"type"]) {
        NSTextField *typeLabel=[tableView makeViewWithIdentifier:@"type" owner:self];
        typeLabel.stringValue=[[self.musicSearchResultMutableArray objectAtIndex:row] valueForKey:@"type"];
        return typeLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"singer"]) {
        NSTextField *singerLabel=[tableView makeViewWithIdentifier:@"singer" owner:self];
        singerLabel.stringValue=[[self.musicSearchResultMutableArray objectAtIndex:row] valueForKey:@"singer"];
        return singerLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"time"]) {
        NSTextField *timeLabel=[tableView makeViewWithIdentifier:@"time" owner:self];
        timeLabel.stringValue=[[self.musicSearchResultMutableArray objectAtIndex:row] valueForKey:@"time"];
        return timeLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"score"]) {
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[self.musicSearchResultMutableArray objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    return nil;
}

-(IBAction)clickMusicSearchResultTableView:(id)sender{
    if ([self.musicSearchResultMutableArray count]==0) {
        return;
    }
    else{
        AppDelegate *appdelegate=[NSApp delegate];
        [AppDelegate setStaticMusic:self.musicSearchResultMutableArray[0]];
        [appdelegate.mainWindowController.searchResultViewController.view setHidden:YES];
        [appdelegate.mainWindowController loadMusicDetailView];
    }
}


@end
