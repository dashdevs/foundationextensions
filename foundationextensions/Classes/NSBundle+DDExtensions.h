//
//  NSBundle+DDExtensions.h
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (DDApplicationWideInfo)

/**
 Returns current bundle release-version-number string. Useful for getting application version info

 @return bundle short version string
 */
- (NSString *)dd_appVersion;

/**
 Returns current bundle version information from the Info.plist format. 

 @return Version information for the Info.plist format
 */
- (NSString *)dd_appBuildNumber;
    
@end

NS_ASSUME_NONNULL_END
