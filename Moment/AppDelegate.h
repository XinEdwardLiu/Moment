//
//  AppDelegate.h
//  Moment
//
//  Created by Edward Liu on 2016-06-02.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainWindowController.h"
#import "User.h"
#import "Movie.h"
#import "Message.h"
#import "Music.h"

static User *staticUser;
static BOOL staticAccountState;
static Movie *staticMovie;
static Music *staticMusic;
static NSString *staticSearchString;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong) IBOutlet MainWindowController *mainWindowController;

+(User *)getStaticUser;
+(User *)setStaticUser:(User *)newUser;

+(BOOL)getStaticAccountState;
+(BOOL)setStaticAcccountState:(BOOL)newAccountState;

+(Movie *)getStaticMovie;
+(Movie *)setStaticMovie:(Movie *)newMovie;

+(Music *)getStaticMusic;
+(Music *)setStaticMusic:(Music *)newMusic;

+(NSString *)getStaticSearchString;
+(NSString *)setStaticSearchString:(NSString *)newString;
@end

