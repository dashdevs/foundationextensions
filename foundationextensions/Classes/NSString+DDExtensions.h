//
//  NSString+DDExtensions.h
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DDDate)

/**
 Returns a date representation of a given string interpreted using passed date formatters. May be nil if passed date formatters cannot parse date from string representation

 @param dateFormatters array of date formatters to parse date representation of a given string
 @return Date parsed from string. May be nil
 */
- (nullable NSDate *)dd_dateWithFallbackFormatters:(nonnull NSArray<NSDateFormatter *> *)dateFormatters;

@end

@interface NSString (DDValidation)

/**
 Returns a Boolean value that indicates whether a given string contains only whitespace symbols. Useful for user input validation

 @return Returns YES if string is empty or containing only whitespace symbols
 */
- (BOOL)dd_consistsOfWhitespaces;

@end

@interface NSString (DDSeparator)

/**
 Constructs and returns an NSString object that is the result of interposing a given separator between the substrings with length of interval of original string.

 @param separator Separator string
 @param interval Length of substrings joined by separator
 @return NSString object that is the result of interposing separator between substrings of original string
 */
- (NSString *)dd_stringByInsertingSeparator:(nonnull NSString *)separator withInterval:(NSUInteger)interval;

@end


NS_ASSUME_NONNULL_END
