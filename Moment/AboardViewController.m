//
//  AboardViewController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-03.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "AboardViewController.h"
#import "AppDelegate.h"
#import "RegisterInfoViewController.h"

@interface AboardViewController ()
@property (strong) IBOutlet RegisterInfoViewController *registerInfoViewController;
@end

@implementation AboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self setViewBackgroundColor];
    self.nameLabel.stringValue=[AppDelegate getStaticUser].name;
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
    self.registerInfoViewController=[[RegisterInfoViewController alloc]initWithNibName:@"RegisterInfoView" bundle:nil];
    NSRect registerFrame=NSMakeRect(179, 47, 846, 468);
    [self.registerInfoViewController.view setFrame:registerFrame];
    
    AppDelegate *appdelegate=[NSApp delegate];
    [appdelegate.mainWindowController.window.contentView addSubview:self.registerInfoViewController.view];
    [appdelegate.mainWindowController hiddenViews];

}



@end
