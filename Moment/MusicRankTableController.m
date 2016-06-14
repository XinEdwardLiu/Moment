//
//  MusicRankTableController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-13.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "MusicRankTableController.h"
#import "AppDelegate.h"

@implementation MusicRankTableController
-(id)init{
    if (self=[super init])
    {
        AppDelegate *appdelegate=[NSApp delegate];
        NSManagedObjectContext *moc=appdelegate.managedObjectContext;
        NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Music"];
        NSError *error=nil;
        NSArray *results = [moc executeFetchRequest:request error:&error];
        if (!results)
        {
            NSLog(@"Error fetching Music objects: %@\n%@", [error localizedDescription], [error userInfo]);
            abort();
        }
        self.musicMutableArray=[[NSMutableArray alloc]initWithArray:results];
    }
    return self;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.musicMutableArray count];
}


-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSSortDescriptor *scoreDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
    NSArray *sortDescriptors = @[scoreDescriptor];
    NSArray *sortedArray = [self.musicMutableArray sortedArrayUsingDescriptors:sortDescriptors];
    
    
    NSString *columnIdentifier=[tableColumn identifier];
    if ([columnIdentifier isEqualToString:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[sortedArray objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
    }
    else if([columnIdentifier isEqualToString:@"singer"]){
        NSTextField *singerLabel=[tableView makeViewWithIdentifier:@"singer" owner:self];
        singerLabel.stringValue=[[sortedArray objectAtIndex:row] valueForKey:@"singer"];
        return singerLabel;
    }
    else if([columnIdentifier isEqualToString:@"score"]){
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[sortedArray objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    return nil;
}

@end
