//
//  AppDelegate.m
//  Moment
//
//  Created by Edward Liu on 2016-06-02.
//  Copyright © 2016 Edward Liu. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
- (IBAction)saveAction:(id)sender;

@end

@implementation AppDelegate

-(void)loadMovieCoreData{
    NSManagedObjectContext *moc=self.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Movie"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Movie objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    if ([results count]==0) {
        [self initMovie];
    }
}

-(void)initMovie{
    NSManagedObject *firstComment=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Message" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [firstComment setValue:@"楼主" forKey:@"sender"];
    [firstComment setValue:@"沙发" forKey:@"message"];
    [firstComment setValue:[NSDate date] forKey:@"time"];
  
    NSManagedObject *secondComment=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Message" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [secondComment setValue:@"楼主" forKey:@"sender"];
    [secondComment setValue:@"沙发" forKey:@"message"];
    [secondComment setValue:[NSDate date] forKey:@"time"];
    
    NSManagedObject *thirdComment=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Message" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [thirdComment setValue:@"楼主" forKey:@"sender"];
    [thirdComment setValue:@"沙发" forKey:@"message"];
    [thirdComment setValue:[NSDate date] forKey:@"time"];
    
    NSManagedObject *fourthComment=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Message" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [fourthComment setValue:@"楼主" forKey:@"sender"];
    [fourthComment setValue:@"沙发" forKey:@"message"];
    [fourthComment setValue:[NSDate date] forKey:@"time"];
    
    NSManagedObject *fifthComment=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Message" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [fifthComment setValue:@"楼主" forKey:@"sender"];
    [fifthComment setValue:@"沙发" forKey:@"message"];
    [fifthComment setValue:[NSDate date] forKey:@"time"];
    
    NSImage *firstImage=[NSImage imageNamed:@"澳门风云"];
    NSData *firstImageData=[firstImage TIFFRepresentation];
    
    NSManagedObject *firstMovie=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Movie" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [firstMovie setValue:@"澳门风云" forKey:@"name"];
    [firstMovie setValue:@"剧情" forKey:@"type"];
    [firstMovie setValue:@"周润发、张学友" forKey:@"actor"];
    [firstMovie setValue:[NSNumber numberWithFloat:4.8] forKey:@"score"];
    [firstMovie setValue:@"Great Movie" forKey:@"introduction"];
    [firstMovie setValue:@"2hours" forKey:@"time"];
    [firstMovie setValue:firstImageData forKey:@"image"];
    [firstMovie setValue:[NSSet setWithObject:firstComment] forKey:@"comments"];
    //[firstComment setValue:firstMovie forKey:@"movieComment"];
   
    NSManagedObject *secondMovie=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Movie" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [secondMovie setValue:@"精武门" forKey:@"name"];
    [secondMovie setValue:@"功夫" forKey:@"type"];
    [secondMovie setValue:@"李连杰" forKey:@"actor"];
    [secondMovie setValue:[NSNumber numberWithFloat:5.0] forKey:@"score"];
    [secondMovie setValue:@"Classic Kongfu Movie" forKey:@"introduction"];
    [secondMovie setValue:@"2hours" forKey:@"time"];
    [secondMovie setValue:firstImageData forKey:@"image"];
    [secondMovie setValue:[NSSet setWithObject:secondComment] forKey:@"comments"];
    //[secondComment setValue:secondMovie forKey:@"movieComment"];

    NSManagedObject *thirdMovie=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Movie" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [thirdMovie setValue:@"敢死队" forKey:@"name"];
    [thirdMovie setValue:@"欧美" forKey:@"type"];
    [thirdMovie setValue:@"杰森斯坦森" forKey:@"actor"];
    [thirdMovie setValue:[NSNumber numberWithFloat:5.0] forKey:@"score"];
    [thirdMovie setValue:@"Wounderful Movie" forKey:@"introduction"];
    [thirdMovie setValue:@"2.5hours" forKey:@"time"];
    [thirdMovie setValue:firstImageData forKey:@"image"];
    [thirdMovie setValue:[NSSet setWithObject:thirdComment] forKey:@"comments"];
    //[thirdComment setValue:thirdMovie forKey:@"movieComment"];
    
    NSManagedObject *fourthMovie=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Movie" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [fourthMovie setValue:@"野蛮女友" forKey:@"name"];
    [fourthMovie setValue:@"爱情" forKey:@"type"];
    [fourthMovie setValue:@"全智贤" forKey:@"actor"];
    [fourthMovie setValue:[NSNumber numberWithFloat:4.5] forKey:@"score"];
    [fourthMovie setValue:@"Great Movie about Love" forKey:@"introduction"];
    [fourthMovie setValue:@"2hours" forKey:@"time"];
    [fourthMovie setValue:firstImageData forKey:@"image"];
    [fourthMovie setValue:[NSSet setWithObject:fourthComment] forKey:@"comments"];
    //[fourthComment setValue:fourthMovie forKey:@"movieComment"];
    
    NSManagedObject *fifthMovie=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Movie" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [fifthMovie setValue:@"电锯惊魂" forKey:@"name"];
    [fifthMovie setValue:@"恐怖" forKey:@"type"];
    [fifthMovie setValue:@"未知" forKey:@"actor"];
    [fifthMovie setValue:[NSNumber numberWithFloat:3.9] forKey:@"score"];
    [fifthMovie setValue:@"Horrible Movie" forKey:@"introduction"];
    [fifthMovie setValue:@"2hours" forKey:@"time"];
    [fifthMovie setValue:firstImageData forKey:@"image"];
    [fifthMovie setValue:[NSSet setWithObject:fifthComment] forKey:@"comments"];
    //[fifthComment setValue:fifthMovie forKey:@"movieComment"];
    
    
    [self.managedObjectContext save:nil];
}

-(void)loadMusicCoreData{
    NSManagedObjectContext *moc=self.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Music"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Music objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    if ([results count]==0) {
        [self initMusic];
    }
}


-(void)initMusic{
    NSManagedObject *firstMusicComment=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Message" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [firstMusicComment setValue:@"楼主" forKey:@"sender"];
    [firstMusicComment setValue:@"沙发" forKey:@"message"];
    [firstMusicComment setValue:[NSDate date] forKey:@"time"];
    
    NSImage *firstImage=[NSImage imageNamed:@"Let it go"];
    NSData *firstImageData=[firstImage TIFFRepresentation];
    
    NSManagedObject *firstMusic=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Music" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [firstMusic setValue:@"Your raise me up" forKey:@"name"];
    [firstMusic setValue:@"欧美" forKey:@"type"];
    [firstMusic setValue:@"未知" forKey:@"singer"];
    [firstMusic setValue:[NSNumber numberWithFloat:4.8] forKey:@"score"];
    [firstMusic setValue:@"Great Music" forKey:@"introduction"];
    [firstMusic setValue:@"2minute" forKey:@"time"];
    [firstMusic setValue:firstImageData forKey:@"image"];
    [firstMusic setValue:[NSSet setWithObject:firstMusicComment] forKey:@"comments"];
   
    NSManagedObject *secondMusic=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Music" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [secondMusic setValue:@"Let it go" forKey:@"name"];
    [secondMusic setValue:@"欧美" forKey:@"type"];
    [secondMusic setValue:@"未知" forKey:@"singer"];
    [secondMusic setValue:[NSNumber numberWithFloat:5.0] forKey:@"score"];
    [secondMusic setValue:@"Fantastic Music" forKey:@"introduction"];
    [secondMusic setValue:@"2minute" forKey:@"time"];
    [secondMusic setValue:firstImageData forKey:@"image"];
    [secondMusic setValue:[NSSet setWithObject:firstMusicComment] forKey:@"comments"];
    
    NSManagedObject *thirdMusic=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Music" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [thirdMusic setValue:@"爱很简单" forKey:@"name"];
    [thirdMusic setValue:@"情歌" forKey:@"type"];
    [thirdMusic setValue:@"陶喆" forKey:@"singer"];
    [thirdMusic setValue:[NSNumber numberWithFloat:4.5] forKey:@"score"];
    [thirdMusic setValue:@"经典情歌" forKey:@"introduction"];
    [thirdMusic setValue:@"2minute" forKey:@"time"];
    [thirdMusic setValue:firstImageData forKey:@"image"];
    [thirdMusic setValue:[NSSet setWithObject:firstMusicComment] forKey:@"comments"];
    
    NSManagedObject *fourthMusic=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Music" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [fourthMusic setValue:@"爱你一万年" forKey:@"name"];
    [fourthMusic setValue:@"情歌" forKey:@"type"];
    [fourthMusic setValue:@"刘德华" forKey:@"singer"];
    [fourthMusic setValue:[NSNumber numberWithFloat:4.0] forKey:@"score"];
    [fourthMusic setValue:@"经典情歌" forKey:@"introduction"];
    [fourthMusic setValue:@"2minute" forKey:@"time"];
    [fourthMusic setValue:firstImageData forKey:@"image"];
    [fourthMusic setValue:[NSSet setWithObject:firstMusicComment] forKey:@"comments"];
    
    NSManagedObject *fifthMusic=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"Music" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [fifthMusic setValue:@"飞得更高" forKey:@"name"];
    [fifthMusic setValue:@"励志" forKey:@"type"];
    [fifthMusic setValue:@"赵传" forKey:@"singer"];
    [fifthMusic setValue:[NSNumber numberWithFloat:5.0] forKey:@"score"];
    [fifthMusic setValue:@"经典励志歌曲" forKey:@"introduction"];
    [fifthMusic setValue:@"2minute" forKey:@"time"];
    [fifthMusic setValue:firstImageData forKey:@"image"];
    [fifthMusic setValue:[NSSet setWithObject:firstMusicComment] forKey:@"comments"];
    
    [self.managedObjectContext save:nil];
}
-(void)loadUserCoreData{
    NSManagedObjectContext *moc=self.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching User objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    if ([results count]==0) {
        [self initUser];
    }
}

-(void)initUser{
    NSManagedObject *user1=[[NSManagedObject alloc]initWithEntity:[NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext] insertIntoManagedObjectContext:self.managedObjectContext];
    [user1 setValue:@"Edward" forKey:@"name"];
    [user1 setValue:[NSNumber numberWithInt:18] forKey:@"age"];
    [user1 setValue:@"男" forKey:@"sex"];
    [user1 setValue:@"1234" forKey:@"password"];
    [user1 setValue:[NSNumber numberWithLong:18676666592] forKey:@"phoneNumber"];
    [user1 setValue:@"xinedwardliu@gmail.com" forKey:@"email"];
    [user1 setValue:@"nice" forKey:@"introduction"];
    
    NSError *error=nil;
    [user1.managedObjectContext save:&error];
}


-(void)readingTemperUser{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    User *tempUser=[NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    [tempUser setValue:[userDefaults valueForKey:@"Name"] forKey:@"name"];
    [tempUser setValue:[userDefaults valueForKey:@"Age"] forKey:@"age"];
    [tempUser setValue:[userDefaults valueForKey:@"Sex"] forKey:@"sex"];
    [tempUser setValue:[userDefaults valueForKey:@"Password"] forKey:@"password"];
    [tempUser setValue:[userDefaults valueForKey:@"Email"] forKey:@"email"];
    [tempUser setValue:[userDefaults valueForKey:@"PhoneNumber"] forKey:@"phoneNumber"];
    [tempUser setValue:[userDefaults valueForKey:@"Introduction"] forKey:@"introduction"];
  
    if (tempUser.name==nil) {
        BOOL accountState=NO;
        [AppDelegate setStaticAcccountState:accountState];
    }
    else{
        BOOL accountState=YES;
        [AppDelegate setStaticAcccountState:accountState];
        [AppDelegate setStaticUser:tempUser];
    }

}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self loadMovieCoreData];
    [self loadMusicCoreData];
    //[self loadUserCoreData];
    //[self readingTemperUser];
    self.mainWindowController=[[MainWindowController alloc]initWithWindowNibName:@"MainWindow"];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

//
+(User *)getStaticUser{
    return  staticUser;
}

+(User *)setStaticUser:(User *)newUser{
    staticUser=newUser;
    return staticUser;
}

+(BOOL)getStaticAccountState{
    return staticAccountState;
}

+(BOOL)setStaticAcccountState:(BOOL)newAccountState{
    
    staticAccountState=newAccountState;
    return staticAccountState;
}

+(Movie *)getStaticMovie{
    return  staticMovie;
}

+(Movie *)setStaticMovie:(Movie *)newMovie{
    staticMovie=newMovie;
    return staticMovie;
}

+(Music *)getStaticMusic{
    return  staticMusic;
}

+(Music *)setStaticMusic:(Music *)newMusic{
    staticMusic=newMusic;
    return staticMusic;
}
//

#pragma mark - Core Data stack

@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "ED.Moment" in the user's Application Support directory.
    NSURL *appSupportURL = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    return [appSupportURL URLByAppendingPathComponent:@"ED.Moment"];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
	
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Moment" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. (The directory for the store is created, if necessary.)
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *applicationDocumentsDirectory = [self applicationDocumentsDirectory];
    BOOL shouldFail = NO;
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    
    // Make sure the application files directory is there
    NSDictionary *properties = [applicationDocumentsDirectory resourceValuesForKeys:@[NSURLIsDirectoryKey] error:&error];
    if (properties) {
        if (![properties[NSURLIsDirectoryKey] boolValue]) {
            failureReason = [NSString stringWithFormat:@"Expected a folder to store application data, found a file (%@).", [applicationDocumentsDirectory path]];
            shouldFail = YES;
        }
    } else if ([error code] == NSFileReadNoSuchFileError) {
        error = nil;
        [fileManager createDirectoryAtPath:[applicationDocumentsDirectory path] withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    if (!shouldFail && !error) {
        NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        NSURL *url = [applicationDocumentsDirectory URLByAppendingPathComponent:@"OSXCoreDataObjC.storedata"];
        if (![coordinator addPersistentStoreWithType:NSXMLStoreType configuration:nil URL:url options:nil error:&error]) {
            coordinator = nil;
        }
        _persistentStoreCoordinator = coordinator;
    }
    
    if (shouldFail || error) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        if (error) {
            dict[NSUnderlyingErrorKey] = error;
        }
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        [[NSApplication sharedApplication] presentError:error];
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];

    return _managedObjectContext;
}

#pragma mark - Core Data Saving and Undo support

- (IBAction)saveAction:(id)sender {
    // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing before saving", [self class], NSStringFromSelector(_cmd));
    }
    
    NSError *error = nil;
    if ([[self managedObjectContext] hasChanges] && ![[self managedObjectContext] save:&error]) {
        [[NSApplication sharedApplication] presentError:error];
    }
}

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window {
    // Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
    return [[self managedObjectContext] undoManager];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
    // Save changes in the application's managed object context before the application terminates.
    
    if (!_managedObjectContext) {
        return NSTerminateNow;
    }
    
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing to terminate", [self class], NSStringFromSelector(_cmd));
        return NSTerminateCancel;
    }
    
    if (![[self managedObjectContext] hasChanges]) {
        return NSTerminateNow;
    }
    
    NSError *error = nil;
    if (![[self managedObjectContext] save:&error]) {

        // Customize this code block to include application-specific recovery steps.              
        BOOL result = [sender presentError:error];
        if (result) {
            return NSTerminateCancel;
        }

        NSString *question = NSLocalizedString(@"Could not save changes while quitting. Quit anyway?", @"Quit without saves error question message");
        NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
        NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
        NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:question];
        [alert setInformativeText:info];
        [alert addButtonWithTitle:quitButton];
        [alert addButtonWithTitle:cancelButton];

        NSInteger answer = [alert runModal];
        
        if (answer == NSAlertFirstButtonReturn) {
            return NSTerminateCancel;
        }
    }

    return NSTerminateNow;
}

@end
