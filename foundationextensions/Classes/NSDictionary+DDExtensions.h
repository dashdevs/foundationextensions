//
//  NSDictionary+DDExtensions.h
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (DDNetworking)

- (nullable id)dd_objectForKey:(nonnull id)aKey; // returns nil if object is kind of class NSNull

- (nullable NSString *)dd_stringObjectForKey:(nonnull id)aKey; // returns nil if object is not kind of class NSString

- (nullable NSString *)dd_stringValueForKey:(nonnull id)aKey; // returns object's string value for key

- (nullable NSDictionary *)dd_dictionaryObjectForKey:(nonnull id)aKey; // returns nil if object isn't kind of class NSDictionary

- (nullable NSArray *)dd_arrayObjectForKey:(nonnull id)aKey; // returns nil if object isn't kind of class NSArray

- (nullable NSNumber *)dd_numberObjectForKey:(nonnull id)aKey; // returns nil if object isn't kind of class NSNumber

@end

NS_ASSUME_NONNULL_END
