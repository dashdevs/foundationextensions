//
//  NSBundle+DDExtensions.h
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (DDApplicationWideInfo)

- (NSString *)dd_appVersion;
- (NSString *)dd_appBuildNumber;
    
@end

NS_ASSUME_NONNULL_END
