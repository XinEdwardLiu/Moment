//
//  RegisterViewController.h
//  Moment
//
//  Created by Edward Liu on 2016-06-02.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RegisterInfoViewController.h"


@interface RegisterViewController : NSViewController
@property IBOutlet NSTextField *accountTextField;
@property IBOutlet NSTextField *passwordTextField;
@property IBOutlet NSTextField *attentionLabel;
@property IBOutlet NSButton *registerBtn;
@property IBOutlet NSButton *aboardBtn;

@property (strong)IBOutlet RegisterInfoViewController *registerInfoViewController;

@end
