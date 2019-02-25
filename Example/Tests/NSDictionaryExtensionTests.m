//
//  NSDictionaryExtensionTests.m
//  FoundationExtensionsTests
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+DDExtensions.h"

#define kArray @"array"
#define kDictionary @"dictionary"
#define kEmptyArray @"emptyArray"
#define kEmptyDictionary @"emptyDictionary"
#define kEmptyString @"emptyString"
#define kNullObject @"nullObject"
#define kNumber @"number"
#define kNumberInString @"numberInString"
#define kString @"string"

@interface NSDictionaryExtensionTests : XCTestCase

@property (nonatomic, strong) NSDictionary *json;

@end

@implementation NSDictionaryExtensionTests

- (void)setUp {
    [super setUp];
    
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"NSDictionary+DDNetworkingJSONTest" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:nil];
    self.json = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingOptions)kNilOptions error:nil];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testObjectForKey {
    id string = [self.json dd_objectForKey:kString];
    XCTAssertEqual(string, self.json[kString]);
    
    id dictionary = [self.json dd_objectForKey:kDictionary];
    XCTAssertEqual(dictionary, self.json[kDictionary]);
    
    id emptyArray = [self.json dd_objectForKey:kEmptyArray];
    XCTAssertEqual(emptyArray, self.json[kEmptyArray]);
    
    id nullObject = [self.json dd_objectForKey:kNullObject];
    XCTAssertEqual(nullObject, nil);
}

- (void)testStringObjectForKey {
    id string = [self.json dd_stringObjectForKey:kString];
    XCTAssertEqual(string, self.json[kString]);
    
    id number = [self.json dd_stringObjectForKey:kNumber];
    XCTAssertEqual(number, nil);
    
    id emptyString = [self.json dd_stringObjectForKey:kEmptyString];
    XCTAssertEqual(emptyString, self.json[kEmptyString]);
    
    id numberInString = [self.json dd_stringObjectForKey:kNumberInString];
    XCTAssertEqual(numberInString, self.json[kNumberInString]);
    
    id dictionary = [self.json dd_stringObjectForKey:kDictionary];
    XCTAssertEqual(dictionary, nil);
    
    id nullObject = [self.json dd_stringObjectForKey:kNullObject];
    XCTAssertEqual(nullObject, nil);
}

- (void)testStringValueForKey {
    id array = [self.json dd_stringValueForKey:kArray];
    XCTAssertEqual(array, nil);
    
    id emptyArray = [self.json dd_stringValueForKey:kEmptyArray];
    XCTAssertEqual(emptyArray, nil);
    
    id dictionary = [self.json dd_stringValueForKey:kDictionary];
    XCTAssertEqual(dictionary, nil);
    
    id number = [self.json dd_stringValueForKey:kNumber];
    XCTAssertEqual(number, [self.json[kNumber] stringValue]);
    
    id nullObject = [self.json dd_stringValueForKey:kNullObject];
    XCTAssertEqual(nullObject, nil);
    
    id string = [self.json dd_stringValueForKey:kString];
    XCTAssertEqual(string, self.json[kString]);
}

- (void)testDictionaryObjectForKey {
    id string = [self.json dd_dictionaryObjectForKey:kString];
    XCTAssertEqual(string, nil);
    
    id array = [self.json dd_dictionaryObjectForKey:kArray];
    XCTAssertEqual(array, nil);
    
    id dictionary = [self.json dd_dictionaryObjectForKey:kDictionary];
    XCTAssertEqual(dictionary, self.json[kDictionary]);
    
    id emptyDictionary = [self.json dd_dictionaryObjectForKey:kEmptyDictionary];
    XCTAssertEqual(emptyDictionary, self.json[kEmptyDictionary]);
    
    id nullObject = [self.json dd_dictionaryObjectForKey:kNullObject];
    XCTAssertEqual(nullObject, nil);
}

- (void)testArrayObjectForKey {
    id string = [self.json dd_arrayObjectForKey:kString];
    XCTAssertEqual(string, nil);
    
    id dictionary = [self.json dd_arrayObjectForKey:kDictionary];
    XCTAssertEqual(dictionary, nil);
    
    id array = [self.json dd_arrayObjectForKey:kArray];
    XCTAssertEqual(array, self.json[kArray]);
    
    id emptyArray = [self.json dd_arrayObjectForKey:kEmptyArray];
    XCTAssertEqual(emptyArray, self.json[kEmptyArray]);
    
    id nullObject = [self.json dd_arrayObjectForKey:kNullObject];
    XCTAssertEqual(nullObject, nil);
}

- (void)testNumberObjectForKey {
    id string = [self.json dd_numberObjectForKey:kString];
    XCTAssertEqual(string, nil);
    
    id numberInString = [self.json dd_numberObjectForKey:kNumberInString];
    XCTAssertEqual(numberInString, nil);
    
    id number = [self.json dd_numberObjectForKey:kNumber];
    XCTAssertEqual(number, self.json[kNumber]);
    
    id nullObject = [self.json dd_numberObjectForKey:kNullObject];
    XCTAssertEqual(nullObject, nil);
}

@end
