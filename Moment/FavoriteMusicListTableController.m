//
//  FavoriteMusicListTableController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-13.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "FavoriteMusicListTableController.h"
#import "AppDelegate.h"

@implementation FavoriteMusicListTableController
-(id)init{
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
        self.favoriteMusicMutableArray=[[NSMutableArray alloc]initWithArray:[[results[0] valueForKey:@"favoriteMusic"] allObjects]];
        [self.musicFavoriteListTableView reloadData];
    }
    return self;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.favoriteMusicMutableArray count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    if ([tableColumn.identifier isEqualTo:@"heart"]) {
        NSImageView *heartImageView=[tableView makeViewWithIdentifier:@"heart" owner:self];
        return heartImageView;
    }
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[self.favoriteMusicMutableArray objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"delete"]) {
        NSButton *deleteBtn=[tableView makeViewWithIdentifier:@"delete" owner:self];
        [deleteBtn setAction:@selector(clickDeleteBtn:)];
        [deleteBtn setIdentifier: [NSString stringWithFormat:@"%ld",(long)row]];

        return deleteBtn;
    }
    if ([tableColumn.identifier isEqualTo:@"type"]) {
        NSTextField *typeLabel=[tableView makeViewWithIdentifier:@"type" owner:self];
        typeLabel.stringValue=[[self.favoriteMusicMutableArray objectAtIndex:row] valueForKey:@"type"];
        return typeLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"singer"]) {
        NSTextField *singerLabel=[tableView makeViewWithIdentifier:@"singer" owner:self];
        singerLabel.stringValue=[[self.favoriteMusicMutableArray objectAtIndex:row] valueForKey:@"singer"];
        return singerLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"score"]) {
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[self.favoriteMusicMutableArray objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    return nil;
}

-(IBAction)clickDeleteBtn:(id)sender{
    NSButton *deleteBtn=sender;
    NSInteger row=[deleteBtn.identifier intValue];
    
    AppDelegate *appdelegate=[NSApp delegate];
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",appdelegate.mainWindowController.aboardViewController.nameLabel.stringValue]];
    NSError *error=nil;
    NSArray *results=[moc executeFetchRequest:request error:&error];
    if (!request) {
        NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
    }
    NSMutableSet *set=[results[0] mutableSetValueForKey:@"favoriteMusic"];
    [set removeObject:self.favoriteMusicMutableArray[row]];
    [results[0] setValue:set forKey:@"favoriteMusic"];
    [appdelegate.managedObjectContext save:nil];
    
    [self.favoriteMusicMutableArray removeObjectAtIndex:row];
    [self.musicFavoriteListTableView reloadData];
}
@end
