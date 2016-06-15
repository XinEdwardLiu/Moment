//
//  HistoryListViewController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-13.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "HistoryListViewController.h"
#import "AppDelegate.h"

@interface HistoryListViewController ()

@end

@implementation HistoryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    AppDelegate *appdelegate=[NSApp delegate];
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",appdelegate.mainWindowController.aboardViewController.nameLabel.stringValue]];
    NSError *error=nil;
    NSArray *results=[moc executeFetchRequest:request error:&error];
    if (!request) {
        NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
    }
    self.movieHistoryListMutableArray=[[NSMutableArray alloc]initWithArray:[[results[0] valueForKey:@"historyMovie"] allObjects]];
    [self.movieHistoryListTableView reloadData];

    
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.movieHistoryListMutableArray count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[self.movieHistoryListMutableArray objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
    }
    
    if ([tableColumn.identifier isEqualTo:@"type"]) {
        NSTextField *typeLabel=[tableView makeViewWithIdentifier:@"type" owner:self];
        typeLabel.stringValue=[[self.movieHistoryListMutableArray objectAtIndex:row] valueForKey:@"type"];
        return typeLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"actor"]) {
        NSTextField *actorLabel=[tableView makeViewWithIdentifier:@"actor" owner:self];
        actorLabel.stringValue=[[self.movieHistoryListMutableArray objectAtIndex:row] valueForKey:@"actor"];
        return actorLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"score"]) {
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[self.movieHistoryListMutableArray objectAtIndex:row] valueForKey:@"score"];
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
