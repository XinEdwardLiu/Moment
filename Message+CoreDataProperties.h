//
//  Message+CoreDataProperties.h
//  Moment
//
//  Created by Edward Liu on 2016-06-06.
//  Copyright © 2016 Edward Liu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface Message (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *message;
@property (nullable, nonatomic, retain) NSString *sender;
@property (nullable, nonatomic, retain) NSDate *time;
@property (nullable, nonatomic, retain) Movie *movieComment;
@property (nullable, nonatomic, retain) Music *musicComment;
@property (nullable, nonatomic, retain) User *userComment;

@end

NS_ASSUME_NONNULL_END
