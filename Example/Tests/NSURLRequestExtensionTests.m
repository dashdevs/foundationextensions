//
//  NSURLRequestExtensionTests.m
//  FoundationExtensionsTests
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "NSURLRequest+DDExtensions.h"

@interface NSURLRequestExtensionTests : XCTestCase

@end

@implementation NSURLRequestExtensionTests

- (NSMutableURLRequest *)defaultRequest {
    NSString *urlString = @"http://www.google.ua";
    NSURL *url = [NSURL URLWithString:urlString];
    
    return [NSMutableURLRequest requestWithURL:url];
}

- (void)testdd_curlWithGETRequest {
    
    NSURLRequest *request = [self defaultRequest];
    XCTAssertEqualObjects(@"curl -X GET \"http://www.google.ua\"", [request dd_curl]);
}

- (void)testdd_curlWithRequestWithCustomHeaders {
    
    NSMutableURLRequest *request = [self defaultRequest];
    [request setValue:@"header Value" forHTTPHeaderField:@"customHeader"];
    
    XCTAssertEqualObjects(@"curl -X GET -H \"customHeader: header Value\" \"http://www.google.ua\"", [request dd_curl]);
}

- (void)testdd_curlWithPOSTRequestWithData {
    
    NSMutableURLRequest *request = [self defaultRequest];
    request.HTTPMethod = @"POST";
    
    NSDictionary *postData = @{ @"key1" : @"value1", @"key2" : @"value2" };
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:postData options:0 error:nil];
    
    NSString *testString = @"curl -X POST -d \"{\\\"key1\\\":\\\"value1\\\",\\\"key2\\\":\\\"value2\\\"}\" \"http://www.google.ua\"";
    XCTAssertEqualObjects(testString, [request dd_curl]);
}

- (void)testdd_curlWithPutRequest {
    NSMutableURLRequest *request = [self defaultRequest];
    request.HTTPMethod = @"PUT";
    
    NSDictionary *putData = @{ @"key1" : @"value1", @"key2" : @"value2" };
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:putData options:0 error:nil];
    
    NSString *testString = @"curl -X PUT -d \"{\\\"key1\\\":\\\"value1\\\",\\\"key2\\\":\\\"value2\\\"}\" \"http://www.google.ua\"";
    XCTAssertEqualObjects(testString, [request dd_curl]);
}

- (void)testdd_curlWithDeleteRequest {
    NSMutableURLRequest *request = [self defaultRequest];
    request.HTTPMethod = @"DELETE";
    
    NSString *testString = @"curl -X DELETE \"http://www.google.ua\"";
    XCTAssertEqualObjects(testString, [request dd_curl]);
}

- (void)testdd_curlWithPatchRequestWithDataWithCustomHeader {
    NSMutableURLRequest *request = [self defaultRequest];
    request.HTTPMethod = @"PATCH";
    
    [request setValue:@"header Value" forHTTPHeaderField:@"customHeader"];
    
    NSDictionary *putData = @{ @"key1" : @"value1", @"key2" : @"value2" };
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:putData options:0 error:nil];
    
    NSString *testString = @"curl -X PATCH -H \"customHeader: header Value\" -d \"{\\\"key1\\\":\\\"value1\\\",\\\"key2\\\":\\\"value2\\\"}\" \"http://www.google.ua\"";
    XCTAssertEqualObjects(testString, [request dd_curl]);
}

- (void)testdd_curlWithPostRequestWithFormUrlencoded {
    NSMutableURLRequest *request = [self defaultRequest];
    request.HTTPMethod = @"POST";
    
    NSString *post = @"key1=value1&key2=value2";
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)postData.length];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    request.HTTPBody = postData;
    
    NSString *testString =[NSString stringWithFormat:@"curl -X POST -H \"Content-Type: application/x-www-form-urlencoded\" -H \"Content-Length: %@\" -d \"key1=value1&key2=value2\" \"http://www.google.ua\"", postLength];
    XCTAssertEqualObjects(testString, [request dd_curl]);
}

@end
