//
//  User.m
//  Moment
//
//  Created by Edward Liu on 2016-06-06.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "User.h"
#import "Message.h"
#import "Movie.h"
#import "Music.h"

@implementation User

// Insert code here to add functionality to your managed object subclass
-(void) encodeWithCoder: (NSCoder *) encoder
{
    [encoder encodeObject: self.name];
    [encoder encodeObject: self.age];
    [encoder encodeObject: self.sex];
    [encoder encodeObject: self.email];
    [encoder encodeObject:self.introduction];
    [encoder encodeObject:self.password];
    [encoder encodeObject:self.phoneNumber];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObject];
        self.age = [coder decodeObject];
        self.sex=[coder decodeObject];
        self.email = [coder decodeObject];
        self.phoneNumber = [coder decodeObject];
        self.password=[coder decodeObject];
        self.introduction=[coder decodeObject];
    }
    return self;
}

@end
