//
//  NSURLComponents+DDExtensions.m
//  foundationextensions
//
//  Copyright © 2019 dashdevs.com. All rights reserved.
//

#import "NSURLComponents+DDExtensions.h"

@implementation NSURLComponents (DDURLQueryItem)

- (nullable NSString *)dd_queryItemValueForName:(NSString *)name {
    for (NSURLQueryItem *item in self.queryItems) {
        if ([item.name isEqualToString:name]) {
            return item.value;
        }
    }
    return nil;
}

@end

