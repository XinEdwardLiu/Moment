//
//  MovieRankTableController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-13.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "MovieRankTableController.h"
#import "AppDelegate.h"

@implementation MovieRankTableController
-(id)init{
    if (self=[super init])
    {
        AppDelegate *appdelegate=[NSApp delegate];
        NSManagedObjectContext *moc=appdelegate.managedObjectContext;
        NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Movie"];
        NSError *error=nil;
        NSArray *results = [moc executeFetchRequest:request error:&error];
        if (!results)
        {
            NSLog(@"Error fetching User objects: %@\n%@", [error localizedDescription], [error userInfo]);
            abort();
        }
        self.movieMutableArray=[[NSMutableArray alloc]initWithArray:results];
    }
    return self;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.movieMutableArray count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSSortDescriptor *scoreDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
    NSArray *sortDescriptors = @[scoreDescriptor];
    NSArray *sortedArray = [self.movieMutableArray sortedArrayUsingDescriptors:sortDescriptors];
    
    NSString *columnIdentifier=[tableColumn identifier];
    
    if ([columnIdentifier isEqualToString:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[sortedArray objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
        }
    else if([columnIdentifier isEqualToString:@"actor"]){
        NSTextField *actorLabel=[tableView makeViewWithIdentifier:@"actor" owner:self];
        actorLabel.stringValue=[[sortedArray objectAtIndex:row] valueForKey:@"actor"];
        return actorLabel;
        }
    else if([columnIdentifier isEqualToString:@"score"]){
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[sortedArray objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    return nil;
}

@end
