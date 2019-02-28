//
//  NSFileManager+DDExtensions.m
//  foundationextensions
//
//  Copyright © 2019 dashdevs.com. All rights reserved.
//

#import "NSFileManager+DDExtensions.h"

@implementation NSFileManager (DDCachesDirectory)

- (NSURL *)dd_URLForCachesSubdirectoryWithName:(NSString *)name error:(NSError *_Nullable __autoreleasing *)error {
    NSURL *URL = [self URLForDirectory:NSCachesDirectory
                              inDomain:NSUserDomainMask
                     appropriateForURL:nil
                                create:NO
                                 error:error];
    if (URL) {
        URL = [URL URLByAppendingPathComponent:name isDirectory:YES];
        NSString *path = URL.path;
        BOOL isDirectory;
        if ([self fileExistsAtPath:path isDirectory:&isDirectory]) {
            if (isDirectory) {
                return URL;
            }
            NSError *underlyingError = [NSError errorWithDomain:NSPOSIXErrorDomain code:ENOTDIR userInfo:nil];
            *error = [NSError errorWithDomain:NSCocoaErrorDomain
                                         code:NSFileReadUnknownError
                                     userInfo:@{ NSFilePathErrorKey : path,
                                                 NSUnderlyingErrorKey : underlyingError }];
        } else if ([self createDirectoryAtURL:URL withIntermediateDirectories:NO attributes:nil error:error]) {
            return URL;
        }
    }
    return nil;
}

@end
