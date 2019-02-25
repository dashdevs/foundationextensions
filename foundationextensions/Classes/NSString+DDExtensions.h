//
//  NSString+DDExtensions.h
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DDDate)

- (nullable NSDate *)dd_dateWithFallbackFormatters:(nonnull NSArray<NSDateFormatter *> *)dateFormatters;

@end

@interface NSString (DDValidation)

- (BOOL)dd_consistsOfWhitespaces;

@end

NS_ASSUME_NONNULL_END
