//
//  NSDictionary+DDExtensions.h
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (DDNetworking)

/**
 Provides safe way to extract value from dictionary. Useful for parsing server response with changeable structure

 @param aKey The key for which to return the corresponding value
 @return The value associated with aKey, or nil if no value is associated with aKey or if value is kind of class NSNull
 */
- (nullable id)dd_objectForKey:(nonnull id)aKey;

/**
 Provides safe way to extract string value from dictionary. Useful for parsing server response with changeable structure

 @param aKey The key for which to return the corresponding value
 @return The value associated with aKey, or nil if no value is associated with aKey or if object is not kind of class NSString
 */
- (nullable NSString *)dd_stringObjectForKey:(nonnull id)aKey;

/**
 Provides safe way to extract string value from dictionary. Useful for parsing server response with changeable structure

 @param aKey The key for which to return the corresponding value
 @return String value of object associated with aKey, or nil if no value is associated with aKey
 */
- (nullable NSString *)dd_stringValueForKey:(nonnull id)aKey;

/**
 Provides safe way to extract nested dictionary value from dictionary. Useful for parsing server response with changeable structure

 @param aKey The key for which to return the corresponding value
 @return Dictionary value of object associated with aKey, or nil if no value is associated with aKey or if object isn't kind of class NSDictionary
 */
- (nullable NSDictionary *)dd_dictionaryObjectForKey:(nonnull id)aKey;

/**
 Provides safe way to extract nested array value from dictionary. Useful for parsing server response with changeable structure

 @param aKey The key for which to return the corresponding value
 @return Array value of object associated with aKey, or nil if no value is associated with aKey or if object isn't kind of class NSArray
 */
- (nullable NSArray *)dd_arrayObjectForKey:(nonnull id)aKey; // returns nil if object isn't kind of class NSArray

/**
 Provides safe way to extract number value from dictionary. Useful for parsing server response with changeable structure

 @param aKey The key for which to return the corresponding value
 @return Number value of object associated with aKey, or nil if no value is associated with aKey or if object isn't kind of class NSNumber
 */
- (nullable NSNumber *)dd_numberObjectForKey:(nonnull id)aKey;

@end

NS_ASSUME_NONNULL_END
