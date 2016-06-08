//
//  RegisterViewController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-02.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "RegisterViewController.h"
#import "AppDelegate.h"
#import "MainWindowController.h"
#import "User.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self setViewBackgroundColor];
}

-(void)setViewBackgroundColor{
    [self.view setWantsLayer:YES];
    self.view.layer.backgroundColor=[NSColor grayColor].CGColor;
}

-(IBAction)clickRegisterBtn:(id)sender{
    
    self.registerInfoViewController=[[RegisterInfoViewController alloc]initWithNibName:@"RegisterInfoView" bundle:nil];
    NSRect registerFrame=NSMakeRect(179, 47, 846, 468);
    [self.registerInfoViewController.view setFrame:registerFrame];
    
    AppDelegate *appdelegate=[NSApp delegate];
    [appdelegate.mainWindowController.window.contentView addSubview:self.registerInfoViewController.view];
    [appdelegate.mainWindowController hiddenViews];
}


-(IBAction)clickAboardBtn:(id)sender{
    AppDelegate *appdelegate=[NSApp delegate];
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching User objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
       for (NSInteger y=0; y<[results count]; y++) {
        
        User *temperUser=[results objectAtIndex:y];
        
        if ([self.accountTextField.stringValue isEqualTo:temperUser.name] & [self.passwordTextField.stringValue isEqualToString:temperUser.password]) {
            [AppDelegate setStaticUser:temperUser];
            [AppDelegate setStaticAcccountState:YES];
            //页面转换
            [self.view setHidden:YES];
            [appdelegate.mainWindowController loadAboardView];
            //本地存储当前用户
            NSUserDefaults *userDefualts=[NSUserDefaults standardUserDefaults];
            [userDefualts setObject:temperUser.name  forKey:@"Name"];
            [userDefualts setObject:temperUser.age  forKey:@"Age"];
            [userDefualts setObject:temperUser.sex  forKey:@"Sex"];
            [userDefualts setObject:temperUser.password  forKey:@"Password"];
            [userDefualts setObject:temperUser.phoneNumber  forKey:@"PhoneNumber"];
            [userDefualts setObject:temperUser.email  forKey:@"Email"];
            [userDefualts setObject:temperUser.introduction  forKey:@"Introduction"];
        }
        else{
            self.attentionLabel.stringValue=@"Invalid Input!";
        }
        
    }
    
}




@end
