//
//  NSURLComponentsTests.m
//  foundationextensions_Tests
//
//  Copyright © 2019 dashdevs.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURLComponents+DDExtensions.h"

@interface NSURLComponentsTests : XCTestCase

@end

@implementation NSURLComponentsTests

- (void)testQuery {
    NSURLComponents *components = [NSURLComponents componentsWithString:@"http://www.apple.com/search/?q=iPad"];
    XCTAssertNotNil(components.query);
    XCTAssertGreaterThan(components.queryItems.count, 0);
    
    XCTAssertNil([components dd_queryItemValueForName:@"test"]);
    XCTAssertNotNil([components dd_queryItemValueForName:@"q"]);
}

@end
