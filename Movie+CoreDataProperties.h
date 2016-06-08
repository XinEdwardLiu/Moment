//
//  Movie+CoreDataProperties.h
//  Moment
//
//  Created by Edward Liu on 2016-06-06.
//  Copyright © 2016 Edward Liu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Movie.h"

NS_ASSUME_NONNULL_BEGIN

@interface Movie (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *actor;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSString *introduction;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *score;
@property (nullable, nonatomic, retain) NSString *time;
@property (nullable, nonatomic, retain) NSString *type;
@property (nullable, nonatomic, retain) NSSet<Message *> *comments;
@property (nullable, nonatomic, retain) NSSet<User *> *userFavorite;
@property (nullable, nonatomic, retain) NSSet<User *> *userHistory;

@end

@interface Movie (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Message *)value;
- (void)removeCommentsObject:(Message *)value;
- (void)addComments:(NSSet<Message *> *)values;
- (void)removeComments:(NSSet<Message *> *)values;

- (void)addUserFavoriteObject:(User *)value;
- (void)removeUserFavoriteObject:(User *)value;
- (void)addUserFavorite:(NSSet<User *> *)values;
- (void)removeUserFavorite:(NSSet<User *> *)values;

- (void)addUserHistoryObject:(User *)value;
- (void)removeUserHistoryObject:(User *)value;
- (void)addUserHistory:(NSSet<User *> *)values;
- (void)removeUserHistory:(NSSet<User *> *)values;

@end

NS_ASSUME_NONNULL_END
