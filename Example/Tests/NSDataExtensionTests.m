//
//  NSDataExtensionTests.m
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSData+DDExtensions.h"

@interface NSDataExtensionTests : XCTestCase

@end


@implementation NSDataExtensionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testdd_hexString {

    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"NSDataExtensionTestText" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSString *testString = @"5465787420666f722074657374696e67206d6574686f6420696e20657874656e73696f6e20666f72204e534461746120776869636"
    "820636f6e76657274204e534461746120746f20686578537472696e672e0a416674657220636f6e76657274696e6720696e20686578537472"
    "696e672077652063616e20636865636b20726573756c74206865726520687474703a2f2f737472696e672d66756e6374696f6e732e636f6d2"
    "f6865782d737472696e672e617370780a2b2052616e646f6d204a534f4e20666f722074657374696e673a0a7b0a22696e766f696365494422"
    "3a20223138303133312d524f482d3639383137222c0a2264617465223a20224a616e756172792033312c203230313820383a343220414d222c"
    "0a226974656d73507572636861736564223a20322c0a226974656d73223a2022626565722c737072697465222c0a2263617264223a20223439"
    "31362d383431382d323731372d33313536222c0a22746f74616c223a20222432302e3232220a7d0a";
    
    //Tested with http://string-functions.com/hex-string.aspx
    
    XCTAssertEqualObjects(testString, [data dd_hexString]);
    
}

@end
