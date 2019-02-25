//
//  NSDictionary+DDExtensions.m
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import "NSDictionary+DDExtensions.h"

@implementation NSDictionary (DDNetworking)

- (id)dd_objectForKey:(id)aKey {
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:[NSNull class]]) {
        object = nil;
    }
    return object;
}

- (NSString *)dd_stringObjectForKey:(id)aKey {
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    }
    return nil;
}

- (NSString *)dd_stringValueForKey:(id)aKey {
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else if ([object respondsToSelector:@selector(stringValue)]) {
        return [object stringValue];
    }
    return nil;
}

- (NSDictionary *)dd_dictionaryObjectForKey:(id)aKey {
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:[NSDictionary class]]) {
        return object;
    }
    return nil;
}

- (NSArray *)dd_arrayObjectForKey:(id)aKey {
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:[NSArray class]]) {
        return object;
    }
    return nil;
}

- (NSNumber *)dd_numberObjectForKey:(id)aKey {
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:[NSNumber class]]) {
        return object;
    }
    return nil;
}

@end
