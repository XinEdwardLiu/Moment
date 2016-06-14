//
//  MusicDetailViewController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-13.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "MusicDetailViewController.h"
#import "AppDelegate.h"

@interface MusicDetailViewController ()

@end

@implementation MusicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

-(void)viewWillAppear{
    //[self.messageTableView reloadData];
    [self setMusicValue];
    [self.messageTableView reloadData];
    [self.giveScoreBtn setHidden:NO];
    
}

-(void)setMusicValue{
    self.nameLabel.stringValue=[[AppDelegate getStaticMusic] valueForKey:@"name"];
    self.typeLabel.stringValue=[[AppDelegate getStaticMusic] valueForKey:@"type"];
    self.singerLabel.stringValue=[[AppDelegate getStaticMusic] valueForKey:@"singer"];
    self.introductionLabel.stringValue=[[AppDelegate getStaticMusic] valueForKey:@"introduction"];
    self.resultScoreLabel.stringValue=[[AppDelegate getStaticMusic] valueForKey:@"score"];
    [self.imageView setImage:[[NSImage alloc]initWithData:[[AppDelegate getStaticMusic] valueForKey:@"image"]]];
    self.score=[[[AppDelegate getStaticMusic] valueForKey:@"score"] floatValue];
    
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
    
    if ([AppDelegate getStaticAccountState]==NO) {
        [self.addToFavoriteBtn setHidden:YES];
    }
    else{
        [self.addToFavoriteBtn setHidden:NO];
    }
    
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

-(IBAction)clickSaveScoreBtn:(id)sender
{
    AppDelegate *appdelegate=[NSApp delegate];
    BOOL accountState=[AppDelegate getStaticAccountState];
    
    if (accountState==YES) {
        float newScore=(self.score+[self.resultScoreLabel.stringValue floatValue])/2;
        [AppDelegate getStaticMusic].score=[NSNumber numberWithFloat:newScore];
        NSManagedObjectContext *moc=appdelegate.managedObjectContext;
        NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"Music"];
        [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticMusic].name]];
        NSError *error = nil;
        NSArray *results = [moc executeFetchRequest:request error:&error];
        if (!results) {
            NSLog(@"Error fetching Music objects: %@\n%@", [error localizedDescription], [error userInfo]);
            abort();
        }
        [results[0] setValue:[AppDelegate getStaticMusic].score forKey:@"score"];
        [appdelegate.managedObjectContext save:&error];
        [self.giveScoreBtn setHidden:YES];
    }
    else{
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"确认"];
        [alert setMessageText:@"评分前请先登陆"];
        [alert setInformativeText:@"若无登陆账号，请先注册"];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert runModal];
    }
}

-(IBAction)clickSubmitMessageBtn:(id)sender{
    
    if([AppDelegate getStaticAccountState]==YES){
        if ([self.messageTextField.stringValue isEqual:@""]){
            return;
        }
        else{
            AppDelegate *appdelegate=[NSApp delegate];
            NSString *temperSender=[AppDelegate getStaticUser].name;
            NSDate *temperTime=[NSDate date];
            self.message=self.messageTextField.stringValue;
            
            NSManagedObject *newMessage=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Message" inManagedObjectContext:appdelegate.managedObjectContext] insertIntoManagedObjectContext:appdelegate.managedObjectContext];
            [newMessage setValue:temperSender forKey:@"sender"];
            [newMessage setValue:temperTime forKey:@"time"];
            [newMessage setValue:self.message forKey:@"message"];
            
            NSMutableSet *updateComments = [[AppDelegate getStaticMusic] mutableSetValueForKey:@"comments"];
            [updateComments addObject:newMessage];
            [self.messageTableView reloadData];
            
            NSManagedObjectContext *moc=appdelegate.managedObjectContext;
            NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"Music"];
            [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticMusic].name]];
            NSError *error=nil;
            NSArray *results=[moc executeFetchRequest:request error:&error];
            if (!results) {
                NSLog(@"Error fetching Movie objects:%@\n%@",[error localizedDescription],[error userInfo]);
            }
            [results[0] setValue:updateComments forKey:@"comments"];
            [appdelegate.managedObjectContext save:&error];
        }
    }
    else{
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"确认"];
        [alert setMessageText:@"评论前请先登陆"];
        [alert setInformativeText:@"若无登陆账号，请先注册"];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert runModal];
    }
}

-(IBAction)clickAddToFavoriteBtn:(id)sender{
    AppDelegate *appdelegate=[NSApp delegate];
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"User"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name==%@",[AppDelegate getStaticUser].name]];
    NSError *error=nil;
    NSArray *results=[moc executeFetchRequest:request error:&error];
    if (!request) {
        NSLog(@"Error fetching User objects:%@\n%@",[error localizedDescription],[error userInfo]);
    }
    
    if ([[results[0] valueForKey:@"favoriteMusic"] count]==0)
    {
        [results[0] setValue:[NSSet setWithObject:[AppDelegate getStaticMusic]] forKey:@"favoriteMusic"];
        [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
        [self.addToFavoriteBtn setTitle:@""];
    }
    else
    {
        if ([[results[0] valueForKey:@"favoriteMusic"] containsObject:[AppDelegate getStaticMusic]])
        {
            [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
            [self.addToFavoriteBtn setTitle:@""];
            return;
        }
        else{
            NSMutableSet *set=[results[0] mutableSetValueForKey:@"favoriteMusic"];
            [set addObject:[AppDelegate getStaticMusic]];
            [results[0] setValue:set forKey:@"favoriteMusic"];
            [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
            [self.addToFavoriteBtn setTitle:@""];
        }
    }
    [appdelegate.managedObjectContext save:nil];
    [appdelegate.mainWindowController.aboardViewController.favoriteListViewController.musicFavoriteListTableView reloadData];
}


@end
