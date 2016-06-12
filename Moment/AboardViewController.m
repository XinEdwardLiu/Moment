//
//  AboardViewController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-03.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "AboardViewController.h"
#import "AppDelegate.h"


@interface AboardViewController ()

@end

@implementation AboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSLog(@"111");
    [self setViewBackgroundColor];
    self.nameLabel.stringValue=[AppDelegate getStaticUser].name;
    
    self.registerInfoViewController=[[RegisterInfoViewController alloc]initWithNibName:@"RegisterInfoView" bundle:nil];
    NSRect registerFrame=NSMakeRect(179, 47, 846, 468);
    [self.registerInfoViewController.view setFrame:registerFrame];
     NSLog(@"222");
    self.favoriteListViewController=[[FavoriteListViewController alloc]initWithNibName:@"FavoriteListView" bundle:nil];
     NSLog(@"111");
    NSRect favoriteFrame=NSMakeRect(179, 47, 846, 468);
     NSLog(@"111");
    //[self.favoriteListViewController.view setFrame:favoriteFrame];
      NSLog(@"111");
}

-(void)setViewBackgroundColor{
    [self.view setWantsLayer:YES];
    self.view.layer.backgroundColor=[NSColor grayColor].CGColor;
}

-(IBAction)clickQuitBtn:(id)sender{
    BOOL accountState=NO;
    [AppDelegate setStaticAcccountState:accountState];
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"Name"];
    [userDefaults removeObjectForKey:@"Age"];
    [userDefaults removeObjectForKey:@"Sex"];
    [userDefaults removeObjectForKey:@"Email"];
    [userDefaults removeObjectForKey:@"PhoneNumber"];
    [userDefaults removeObjectForKey:@"Introduction"];
    [userDefaults removeObjectForKey:@"Password"];
    
    AppDelegate *appdelegate=[NSApp delegate];
    [appdelegate.mainWindowController loadRegisterView];
}


-(IBAction)clickAccountImageBtn:(id)sender{
    
    AppDelegate *appdelegate=[NSApp delegate];
    [appdelegate.mainWindowController.window.contentView addSubview:self.registerInfoViewController.view];
    [appdelegate.mainWindowController hiddenViews];
    [appdelegate.mainWindowController.movieDetailViewController.view setHidden:YES];
    [self.favoriteListViewController.view setHidden:YES];
    [self.registerInfoViewController.view setHidden:NO];
    
}

-(IBAction)clickFavoriteBtn:(id)sender{

    AppDelegate *appdelegate=[NSApp delegate];
    [appdelegate.mainWindowController hiddenViews];
    [appdelegate.mainWindowController.movieDetailViewController.view setHidden:YES];
    [appdelegate.mainWindowController.window.contentView addSubview:self.favoriteListViewController.view];
    [self.registerInfoViewController.view setHidden:YES];
    [self.favoriteListViewController.view setHidden:NO];
}


@end
