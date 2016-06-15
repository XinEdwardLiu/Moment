//
//  EmailTextField.m
//  Moment
//
//  Created by Edward Liu on 2016-06-14.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "EmailTextField.h"

@implementation EmailTextField

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)textDidEndEditing:(NSNotification *)notification{
    if ([self.stringValue containsString:@"@"]) {
        return;
    }
    else{
        self.stringValue=@"";
        self.placeholderString=@"输入错误";
    }
    [super textDidEndEditing:notification];
}
@end
