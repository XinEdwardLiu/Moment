//
//  MovieAllTableController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-13.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "MovieAllTableController.h"
#import "AppDelegate.h"

@implementation MovieAllTableController
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
    NSString *columnIdentifier=[tableColumn identifier];
    if ([columnIdentifier isEqualToString:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[self.movieMutableArray objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
        }
    else if([columnIdentifier isEqualToString:@"actor"]){
        NSTextField *actorLabel=[tableView makeViewWithIdentifier:@"actor" owner:self];
        actorLabel.stringValue=[[self.movieMutableArray objectAtIndex:row] valueForKey:@"actor"];
        return actorLabel;
        }
    return nil;
}

@end
