//
//  NSBundleExtensionTests.m
//  FoundationExtensionsTests
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSBundle+DDExtensions.h"

@interface NSBundleExtensionTests : XCTestCase

@end


@implementation NSBundleExtensionTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testdd_appVersion {
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"BundleTest" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    NSString *appVersion = [bundle dd_appVersion];

    XCTAssertEqualObjects(appVersion, @"2.2");
}

- (void) testdd_appBuildNumber {
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"BundleTest" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    NSString *appBuildNumber = [bundle dd_appBuildNumber];

    XCTAssertEqualObjects(appBuildNumber, @"2");
}

@end
