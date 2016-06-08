//
//  MovieDetailViewController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-07.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "AppDelegate.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

-(void)viewWillAppear{
    //[self.messageTableView reloadData];
    
    self.nameLabel.stringValue=[[AppDelegate getStaticMovie] valueForKey:@"name"];
    self.typeLabel.stringValue=[[AppDelegate getStaticMovie] valueForKey:@"type"];
    self.actorLabel.stringValue=[[AppDelegate getStaticMovie] valueForKey:@"actor"];
    self.introductionLabel.stringValue=[[AppDelegate getStaticMovie] valueForKey:@"introduction"];
    self.resultScoreLabel.stringValue=[[AppDelegate getStaticMovie] valueForKey:@"score"];
    [self.imageView setImage:[[NSImage alloc]initWithData:[[AppDelegate getStaticMovie] valueForKey:@"image"]]];
    self.score=[[[AppDelegate getStaticMovie] valueForKey:@"score"] floatValue];
    
    NSImage *scoreStarImage;
    
    if ( self.score>=4.5) {
        scoreStarImage=[NSImage imageNamed:@"5star"];
    }
    else if( self.score>=3.5&self.score<4.5){
        scoreStarImage=[NSImage imageNamed:@"4star"];
    }
    else if(self.score>=2.5&self.score<3.5){
        scoreStarImage=[NSImage imageNamed:@"3star"];
    }
    else if(self.score>=1.5&self.score<2.5){
        scoreStarImage=[NSImage imageNamed:@"2star"];
    }
    else if(self.score<1.5){
        scoreStarImage=[NSImage imageNamed:@"1star"];
    }
    [self.resultStarImageView setImage:scoreStarImage];
    
    self.messageMutableArray=[[NSMutableArray alloc]initWithArray: [[AppDelegate getStaticMovie].comments allObjects]];
    [self.messageTableView reloadData];
   // NSLog(@"%@",[[AppDelegate getStaticMovie] valueForKey:@"comments"]);
    if ([AppDelegate getStaticAccountState]==NO) {
        [self.addToFavoriteBtn setHidden:YES];
    }
    else{
        
        [self.addToFavoriteBtn setHidden:NO];
    }
    
    NSLog(@"%lu",(unsigned long)[self.messageMutableArray count]);
}



-(NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return  [self.messageMutableArray count];
}


-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    if ([tableColumn.identifier isEqual:@"sender"]) {
        NSTextField *senderLabel=[tableView makeViewWithIdentifier:@"sender" owner:self];
        senderLabel.stringValue=[[self.messageMutableArray objectAtIndex:row] valueForKey:@"sender"];
        return senderLabel;
    }
    if ([tableColumn.identifier isEqual:@"comment"]) {
        NSTextField *commentLabel=[tableView makeViewWithIdentifier:@"comment" owner:self];
        commentLabel.stringValue=[[self.messageMutableArray objectAtIndex:row] valueForKey:@"comment"];
        return commentLabel;
    }
    if ([tableColumn.identifier isEqual:@"time"]) {
        NSTextField *timeLabel=[tableView makeViewWithIdentifier:@"time" owner:self];
        timeLabel.stringValue=[[self.messageMutableArray objectAtIndex:row] valueForKey:@"time"];
        return timeLabel;
    }
    return nil;
}
-(IBAction)clickOneStarBtn:(id)sender{
    
    [self.oneStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoStarBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.threeStarBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fourStarBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveStarBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=1;
    [self.scoreTextField setStringValue: [[NSNumber numberWithFloat:self.score] stringValue]];
}


-(IBAction)clickTwoStarBtn:(id)sender{
    [self.oneStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeStarBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fourStarBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveStarBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=2;
    [self.scoreTextField setStringValue: [[NSNumber numberWithInt:self.score] stringValue]];
}

-(IBAction)clickThreeStarBtn:(id)sender{
    [self.oneStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourStarBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveStarBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=3;
    [self.scoreTextField setStringValue: [[NSNumber numberWithInt:self.score] stringValue]];
}

-(IBAction)clickFourStarBtn:(id)sender{
    [self.oneStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fiveStarBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=4;
    [self.scoreTextField setStringValue: [[NSNumber numberWithInt:self.score] stringValue]];
}

-(IBAction)clickFiveStarBtn:(id)sender{
    [self.oneStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourStarBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fiveStarBtn setImage:[NSImage imageNamed:@"1star"]];
    self.score=5;
    [self.scoreTextField setStringValue: [[NSNumber numberWithInt:self.score] stringValue]];
}


@end
