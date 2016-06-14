//
//  FavoriteListViewController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-09.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "FavoriteListViewController.h"
#import "AppDelegate.h"
@interface FavoriteListViewController ()

@end

@implementation FavoriteListViewController

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
    self.favoriteMovieMutableArray=[[NSMutableArray alloc]initWithArray:[[results[0] valueForKey:@"favoriteMovie"] allObjects]];
    [self.movieFavoriteListTableView reloadData];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.favoriteMovieMutableArray count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    if ([tableColumn.identifier isEqualTo:@"heart"]) {
        NSImageView *heartImageView=[tableView makeViewWithIdentifier:@"heart" owner:self];
        return heartImageView;
    }
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[self.favoriteMovieMutableArray objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"delete"]) {
        NSButton *deleteBtn=[tableView makeViewWithIdentifier:@"delete" owner:self];
        return deleteBtn;
    }
    if ([tableColumn.identifier isEqualTo:@"type"]) {
        NSTextField *typeLabel=[tableView makeViewWithIdentifier:@"type" owner:self];
        typeLabel.stringValue=[[self.favoriteMovieMutableArray objectAtIndex:row] valueForKey:@"type"];
        return typeLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"actor"]) {
        NSTextField *actorLabel=[tableView makeViewWithIdentifier:@"actor" owner:self];
        actorLabel.stringValue=[[self.favoriteMovieMutableArray objectAtIndex:row] valueForKey:@"actor"];
        return actorLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"score"]) {
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[self.favoriteMovieMutableArray objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    return nil;
}

-(IBAction)clickDeleteBtn:(id)sender{
    NSInteger selectedRow = [self.movieFavoriteListTableView rowForView:sender];
    
    AppDelegate *appdelegate=[NSApp delegate];
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",appdelegate.mainWindowController.aboardViewController.nameLabel.stringValue]];
    NSError *error=nil;
    NSArray *results=[moc executeFetchRequest:request error:&error];
    if (!request) {
        NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
    }
    NSMutableSet *set=[results[0] mutableSetValueForKey:@"favoriteMovie"];
    [set removeObject:self.favoriteMovieMutableArray[selectedRow]];
    [results[0] setValue:set forKey:@"favoriteMovie"];
    [appdelegate.managedObjectContext save:nil];
    
    [self.favoriteMovieMutableArray removeObjectAtIndex:selectedRow];
    [self.movieFavoriteListTableView reloadData];

}



@end
