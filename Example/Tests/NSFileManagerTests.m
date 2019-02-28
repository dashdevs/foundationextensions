//
//  NSFileManagerTests.m
//  foundationextensions_Tests
//
//  Copyright © 2019 dashdevs.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSFileManager+DDExtensions.h"

@interface NSFileManagerTests : XCTestCase
@property (nonatomic, strong, readonly) NSString *directoryName;
@property (nonatomic, strong, readonly) NSString *fileName;
@end

@implementation NSFileManagerTests

- (void)testExistingDirectory {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *cachesURL = [fileManager URLForDirectory:NSCachesDirectory
                                           inDomain:NSUserDomainMask
                                  appropriateForURL:nil
                                             create:NO
                                              error:nil];
    NSString *imagesPath = [[cachesURL URLByAppendingPathComponent:self.directoryName] path];
    if (![fileManager fileExistsAtPath:imagesPath]) {
        [fileManager createDirectoryAtPath:imagesPath
               withIntermediateDirectories:NO
                                attributes:nil
                                     error:nil];
    }

    NSURL *url = [fileManager dd_URLForCachesSubdirectoryWithName:self.directoryName error:nil];
    XCTAssertNotNil(url);
    
    BOOL isDir;
    [fileManager fileExistsAtPath:url.path isDirectory:&isDir];
    XCTAssertTrue(isDir);
    
    [fileManager removeItemAtPath:url.path error:nil];
}

- (void)testErrorCase {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *cachesURL = [fileManager URLForDirectory:NSCachesDirectory
                                           inDomain:NSUserDomainMask
                                  appropriateForURL:nil
                                             create:NO
                                              error:nil];
    NSString *name = @"test.pdf";
    NSString *imagesPath = [[cachesURL URLByAppendingPathComponent:name] path];
    [fileManager createFileAtPath:imagesPath contents:nil attributes:nil];
    
    NSError *er;
    [fileManager dd_URLForCachesSubdirectoryWithName:name error:&er];
    XCTAssertNotNil(er);
    
    [fileManager removeItemAtPath:imagesPath error:nil];
}

- (void)testNonExistingDirectory {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *url = [fileManager dd_URLForCachesSubdirectoryWithName:self.directoryName error:nil];
    XCTAssertNotNil(url);

    BOOL isDir;
    [fileManager fileExistsAtPath:url.path isDirectory:&isDir];
    XCTAssertTrue(isDir);
}

- (NSString *)directoryName {
    return @"images";
}

- (NSString *)fileName {
    return @"test.pdf";
}

@end
