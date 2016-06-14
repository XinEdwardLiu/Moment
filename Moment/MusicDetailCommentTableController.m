//
//  MusicDetailCommentTableController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-13.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "MusicDetailCommentTableController.h"
#import "AppDelegate.h"

@implementation MusicDetailCommentTableController

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    self.commentMutableArray=[[NSMutableArray alloc]initWithArray:[[AppDelegate getStaticMusic].comments allObjects]];
    return [self.commentMutableArray count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    self.commentMutableArray=[[NSMutableArray alloc]initWithArray:[[AppDelegate getStaticMusic].comments allObjects]];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    dateFormatter.dateStyle=NSDateFormatterShortStyle;
    dateFormatter.timeStyle=NSDateFormatterShortStyle;
    
    NSString *columnIdentifier=[tableColumn identifier];
    
    if ([columnIdentifier isEqualToString:@"sender"]) {
        NSTextField *senderLabel=[tableView makeViewWithIdentifier:@"sender" owner:self];
        senderLabel.stringValue=[[self.commentMutableArray objectAtIndex:row] valueForKey:@"sender"];
        return senderLabel;
    }
    else if([columnIdentifier isEqualToString:@"message"]){
        NSTextField *messageLabel=[tableView makeViewWithIdentifier:@"message" owner:self];
        messageLabel.stringValue=[[self.commentMutableArray objectAtIndex:row] valueForKey:@"message"];
        return messageLabel;
    }
    if ([tableColumn.identifier isEqual:@"time"]) {
        NSTextField *timeLabel=[tableView makeViewWithIdentifier:@"time" owner:self];
        timeLabel.stringValue=[dateFormatter stringFromDate:[[self.commentMutableArray objectAtIndex:row] valueForKey:@"time"]];
        return timeLabel;
    }
    return nil;
}

@end
