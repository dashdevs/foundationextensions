//
//  NSBundle+DDExtensions.m
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import "NSBundle+DDExtensions.h"

static NSString *kBundleShortVersion = @"CFBundleShortVersionString";

@implementation NSBundle (DDApplicationWideInfo)

- (NSString *) dd_appVersion {
    return [self objectForInfoDictionaryKey: kBundleShortVersion];
}
- (NSString *) dd_appBuildNumber {
    return [self objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
}

@end
