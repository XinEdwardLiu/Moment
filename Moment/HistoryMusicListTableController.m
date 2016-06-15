//
//  HistoryMusicListTableController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-14.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "HistoryMusicListTableController.h"
#import "AppDelegate.h"

@implementation HistoryMusicListTableController
- (id)init {
    if (self=[super init]) {
    AppDelegate *appdelegate=[NSApp delegate];
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",appdelegate.mainWindowController.aboardViewController.nameLabel.stringValue]];
    NSError *error=nil;
    NSArray *results=[moc executeFetchRequest:request error:&error];
    if (!request) {
        NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
    }
    self.musicHistoryListMutableArray=[[NSMutableArray alloc]initWithArray:[[results[0] valueForKey:@"historyMusic"] allObjects]];
    [self.musicHistoryTableView reloadData];
    }
    return self;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.musicHistoryListMutableArray count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[self.musicHistoryListMutableArray objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
    }
    
    if ([tableColumn.identifier isEqualTo:@"type"]) {
        NSTextField *typeLabel=[tableView makeViewWithIdentifier:@"type" owner:self];
        typeLabel.stringValue=[[self.musicHistoryListMutableArray objectAtIndex:row] valueForKey:@"type"];
        return typeLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"singer"]) {
        NSTextField *singerLabel=[tableView makeViewWithIdentifier:@"singer" owner:self];
        singerLabel.stringValue=[[self.musicHistoryListMutableArray objectAtIndex:row] valueForKey:@"singer"];
        return singerLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"score"]) {
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[self.musicHistoryListMutableArray objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"number"]) {
        NSTextField *numberLabel=[tableView makeViewWithIdentifier:@"number" owner:self];
        numberLabel.stringValue=[[NSNumber numberWithInteger:row+1] stringValue];
        return numberLabel;
    }
    return nil;
}

@end
