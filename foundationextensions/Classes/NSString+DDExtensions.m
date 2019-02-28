//
//  NSString+DDExtensions.m
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import "NSString+DDExtensions.h"

@implementation NSString (DDDate)

- (NSDate *)dd_dateWithFallbackFormatters:(NSArray<NSDateFormatter *> *)dateFormatters {
    for (NSDateFormatter *formatter in dateFormatters) {
        NSDate *date = [formatter dateFromString:self];
        
        if (date) {
            return date;
        }
    }
    
    return nil;
}

@end

@implementation NSString (DDValidation)

- (BOOL)dd_consistsOfWhitespaces {
    NSCharacterSet *characterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:characterSet].length == 0;
    
}

@end

@implementation NSString (DDSeparator)

- (NSString *)dd_stringByInsertingSeparator:(NSString *)separator withInterval:(NSUInteger)interval {
    NSMutableString *string = [[NSMutableString alloc] init];
    NSUInteger location = 0;
    while (location + interval < self.length) {
        NSString *substring = [self substringWithRange:NSMakeRange(location, interval)];
        [string appendString:substring];
        [string appendString:separator];
        location += interval;
    }
    [string appendString:[self substringWithRange:NSMakeRange(location, self.length - location)]];
    return string;
}

@end

