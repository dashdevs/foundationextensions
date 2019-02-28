//
//  NSFileManager+DDExtensions.h
//  foundationextensions
//
//  Copyright © 2019 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (DDCachesDirectory)

/**
 Returns URL for directory with name inside 'Library/Caches' discardable cache files directory. If no directory found - creates it

 @param name name of the directory to found
 @param error A pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify nil for this parameter if you do not want the error information.
 @return URL object for directory with name
 */
- (nullable NSURL *)dd_URLForCachesSubdirectoryWithName:(NSString *)name error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
