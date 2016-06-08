//
//  RegisterInfoViewController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-02.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RegisterInfoViewController : NSViewController
@property IBOutlet NSTextField *accountTextField;
@property IBOutlet NSTextField *ageTextField;
@property IBOutlet NSMatrix *sexMatrix;
@property IBOutlet NSTextField *emailTextField;
@property IBOutlet NSTextField *phoneTextField;
@property IBOutlet NSTextField *passwordTextField;
@property IBOutlet NSTextField *selfIntroductionTextField;
@property IBOutlet NSButton *submitBtn;

@property IBOutlet NSTextField *accountAttentionLabel;
@property IBOutlet NSTextField *passwordAttentionLabel;
@property IBOutlet NSTextField *sameAccountLabel;
@end
