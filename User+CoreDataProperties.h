//
//  User+CoreDataProperties.h
//  Moment
//
//  Created by Edward Liu on 2016-06-06.
//  Copyright © 2016 Edward Liu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *introduction;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *password;
@property (nullable, nonatomic, retain) NSNumber *phoneNumber;
@property (nullable, nonatomic, retain) NSString *sex;
@property (nullable, nonatomic, retain) NSSet<Message *> *comments;
@property (nullable, nonatomic, retain) NSSet<Movie *> *favoriteMovie;
@property (nullable, nonatomic, retain) NSSet<Music *> *favoriteMusic;
@property (nullable, nonatomic, retain) NSSet<Movie *> *historyMovie;
@property (nullable, nonatomic, retain) NSSet<Music *> *historyMusic;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Message *)value;
- (void)removeCommentsObject:(Message *)value;
- (void)addComments:(NSSet<Message *> *)values;
- (void)removeComments:(NSSet<Message *> *)values;

- (void)addFavoriteMovieObject:(Movie *)value;
- (void)removeFavoriteMovieObject:(Movie *)value;
- (void)addFavoriteMovie:(NSSet<Movie *> *)values;
- (void)removeFavoriteMovie:(NSSet<Movie *> *)values;

- (void)addFavoriteMusicObject:(Music *)value;
- (void)removeFavoriteMusicObject:(Music *)value;
- (void)addFavoriteMusic:(NSSet<Music *> *)values;
- (void)removeFavoriteMusic:(NSSet<Music *> *)values;

- (void)addHistoryMovieObject:(Movie *)value;
- (void)removeHistoryMovieObject:(Movie *)value;
- (void)addHistoryMovie:(NSSet<Movie *> *)values;
- (void)removeHistoryMovie:(NSSet<Movie *> *)values;

- (void)addHistoryMusicObject:(Music *)value;
- (void)removeHistoryMusicObject:(Music *)value;
- (void)addHistoryMusic:(NSSet<Music *> *)values;
- (void)removeHistoryMusic:(NSSet<Music *> *)values;

@end

NS_ASSUME_NONNULL_END
