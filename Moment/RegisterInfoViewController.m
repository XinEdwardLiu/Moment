//
//  RegisterInfoViewController.m
//  Moment
//
//  Created by Edward Liu on 2016-06-02.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "RegisterInfoViewController.h"
#import "AppDelegate.h"
#import "User.h"
@interface RegisterInfoViewController ()

@end

@implementation RegisterInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    if ([AppDelegate getStaticAccountState]==YES) {
        self.accountTextField.stringValue=[AppDelegate getStaticUser].name;
        self.ageTextField.integerValue=[[AppDelegate getStaticUser].age integerValue];
        self.passwordTextField.stringValue=[AppDelegate getStaticUser].password;
        self.emailTextField.stringValue=[AppDelegate getStaticUser].email;
        self.selfIntroductionTextField.stringValue=[AppDelegate getStaticUser].introduction;
        self.phoneTextField.integerValue=[[AppDelegate getStaticUser].phoneNumber integerValue];
        if ([[AppDelegate getStaticUser].sex isEqualTo:@"男"]) {
            [self.sexMatrix selectCellWithTag:1];
        }
        else{
            [self.sexMatrix selectCellWithTag:2];
        }
    }
}

-(IBAction)clickSubmitBtn:(id)sender
{
    if ([self.accountTextField.stringValue isEqualToString:@""]&[self.passwordTextField.stringValue isEqualToString:@""]) {
        [self.accountAttentionLabel setHidden:NO];
        [self.passwordAttentionLabel setHidden:NO];
        [self.sameAccountLabel setHidden:YES];
        return;
    }
    else if([self.accountTextField.stringValue isEqualToString:@""]&[self.passwordTextField.stringValue isNotEqualTo:@""]){
        [self.accountAttentionLabel setHidden:NO];
        [self.passwordAttentionLabel setHidden:YES];
        [self.sameAccountLabel setHidden:YES];
        return;
    }
    else if ([self.accountTextField.stringValue isNotEqualTo:@""]&[self.passwordTextField.stringValue isEqualTo:@""]){
        [self.passwordAttentionLabel setHidden:NO];
        [self.accountAttentionLabel setHidden:YES];
        [self.sameAccountLabel setHidden:YES];
        return;
    }
    else if([self.accountTextField.stringValue isNotEqualTo:@""]&[self.passwordTextField.stringValue isNotEqualTo:@""]){
        [self.accountAttentionLabel setHidden:YES];
        [self.passwordAttentionLabel setHidden:YES];
        if ([AppDelegate getStaticAccountState]==NO) {
        [self saveNewUser];
        }
        else{
        [self modifyCurrentUser];
        }
 }
}

-(void)saveNewUser{
    AppDelegate *appdelegate=[NSApp delegate];
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSString *name = self.accountTextField.stringValue;
    [request setPredicate:[NSPredicate predicateWithFormat:@"name == %@", name]];
    NSError *error=nil;
    NSArray *results=[moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    if ([results count]==0) {
        User *tempUser=[[User alloc]initWithEntity:[NSEntityDescription entityForName:@"User" inManagedObjectContext:appdelegate.managedObjectContext] insertIntoManagedObjectContext:appdelegate.managedObjectContext];
        [tempUser setValue:self.accountTextField.stringValue forKey:@"name"];
        [tempUser setValue:[NSNumber numberWithInteger:self.ageTextField.integerValue] forKey:@"age"];
        [tempUser setValue:self.sexMatrix.selectedCell.title forKey:@"sex"];
        [tempUser setValue:self.emailTextField.stringValue forKey:@"email"];
        [tempUser setValue:self.selfIntroductionTextField.stringValue forKey:@"introduction"];
        [tempUser setValue:[NSNumber numberWithInteger:self.phoneTextField.integerValue] forKey:@"phoneNumber"];
        [tempUser setValue:self.passwordTextField.stringValue forKey:@"password"];
        [appdelegate.managedObjectContext save:&error];
        
        [AppDelegate setStaticUser:tempUser];
        [AppDelegate setStaticAcccountState:YES];
        [appdelegate.mainWindowController.registerViewController.view setHidden:YES];
        [appdelegate.mainWindowController loadAboardView];
        [self.view setHidden:YES];
        [appdelegate.mainWindowController.mainView setHidden:NO];
    }
    else{
        [self.sameAccountLabel setHidden:NO];
        self.sameAccountLabel.stringValue=@"名称已存在,请更换";
        return;
    }
    
}


-(void)modifyCurrentUser{
    AppDelegate *appdelegate=[NSApp delegate];
    NSManagedObjectContext *moc=appdelegate.managedObjectContext;
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSString *name = [AppDelegate getStaticUser].name;
    [request setPredicate:[NSPredicate predicateWithFormat:@"name == %@", name]];
    NSError *error=nil;
    NSArray *results=[moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSManagedObject *currentUser=results[0];
    [currentUser setValue:self.accountTextField.stringValue forKey:@"name"];
    [currentUser setValue:[NSNumber numberWithInteger:self.ageTextField.integerValue] forKey:@"age"];
    [currentUser setValue:self.sexMatrix.selectedCell.title forKey:@"sex"];
    [currentUser setValue:self.emailTextField.stringValue forKey:@"email"];
    [currentUser setValue:self.selfIntroductionTextField.stringValue forKey:@"introduction"];
    [currentUser setValue:[NSNumber numberWithInteger:self.phoneTextField.integerValue] forKey:@"phoneNumber"];
    [currentUser setValue:self.passwordTextField.stringValue forKey:@"password"];
    [currentUser.managedObjectContext save:&error];
    
    NSFetchRequest *request1=[NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSString *name1 = [currentUser valueForKey:@"name"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name == %@", name1]];
    NSArray *results1=[moc executeFetchRequest:request1 error:&error];
    if (!results1) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    [AppDelegate setStaticUser:results1[0]];
   
    [appdelegate.mainWindowController.registerViewController.view setHidden:YES];
    [self.view setHidden:YES];
    [appdelegate.mainWindowController.mainView setHidden:NO];
}


@end
