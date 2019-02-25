//
//  NSStringExtensionTests.m
//  FoundationExtensionsTests
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+DDExtensions.h"

@interface NSStringExtensionTests : XCTestCase

@end

@implementation NSStringExtensionTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - NSString+DDDate

- (void)testDateWithFallbackFormatters {
    NSDateFormatter *fullMonthDayYearWithSlashes = [[NSDateFormatter alloc] init];
    fullMonthDayYearWithSlashes.dateFormat = @"MMMM/dd/yyyy";
    NSDateFormatter *dayPointMonth = [[NSDateFormatter alloc] init];
    dayPointMonth.dateFormat = @"dd.MM";
    NSDateFormatter *weekdayShortMonthDayYear = [[NSDateFormatter alloc] init];
    weekdayShortMonthDayYear.dateFormat = @"EEEE, MMM d, yyyy";
    NSDateFormatter *fullDate = [[NSDateFormatter alloc] init];
    fullDate.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SS";
    NSDateFormatter *shortMonthShortDayYear = [[NSDateFormatter alloc] init];
    shortMonthShortDayYear.dateFormat = @"MMM d, yyyy";
    NSDateFormatter *fullDateWithoutMilisec = [[NSDateFormatter alloc] init];
    fullDateWithoutMilisec.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
    NSDateFormatter *fullDateWithoutMilisec12HoursFormat = [[NSDateFormatter alloc] init];
    fullDateWithoutMilisec12HoursFormat.dateFormat = @"MM/dd/yyyy hh:mm a";
    NSDateFormatter *fullMonthYear = [[NSDateFormatter alloc] init];
    fullMonthYear.dateFormat = @"MMMM yyyy";
    NSDateFormatter *monthDayYearWithDashes = [[NSDateFormatter alloc] init];
    monthDayYearWithDashes.dateFormat = @"MM-dd-yyyy";
    NSDateFormatter *shortWeekdayShortMonthWithTimeZone = [[NSDateFormatter alloc] init];
    shortWeekdayShortMonthWithTimeZone.dateFormat = @"EEE, d MMM yyyy HH:mm:ss zzz";
    NSDateFormatter *shortMonth12HoursFormat = [[NSDateFormatter alloc] init];
    shortMonth12HoursFormat.dateFormat = @"MMM d, yyyy HH:mm a";
    NSDateFormatter *shortMonthDay = [[NSDateFormatter alloc] init];
    shortMonthDay.dateFormat = @"MMM dd";

    NSString *dateString = @"June/12/2009";
    NSDate *date = [dateString dd_dateWithFallbackFormatters:@[fullMonthDayYearWithSlashes]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[dayPointMonth, weekdayShortMonthDayYear, fullDateWithoutMilisec]];
    XCTAssertNil(date);
    
    dateString = @"01.12";
    date = [dateString dd_dateWithFallbackFormatters:@[fullMonthDayYearWithSlashes, dayPointMonth, fullDateWithoutMilisec12HoursFormat]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[weekdayShortMonthDayYear, fullMonthYear, shortMonth12HoursFormat]];
    XCTAssertNil(date);
    
    dateString = @"Wed, July 10, 1996";
    date = [dateString dd_dateWithFallbackFormatters:@[weekdayShortMonthDayYear, fullDateWithoutMilisec, shortMonthDay]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[shortWeekdayShortMonthWithTimeZone, shortMonth12HoursFormat, fullMonthYear]];
    XCTAssertNil(date);
    
    dateString = @"2016-04-19T07:51:11.847";
    date = [dateString dd_dateWithFallbackFormatters:@[fullDate]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[shortWeekdayShortMonthWithTimeZone, fullDateWithoutMilisec]];
    XCTAssertNil(date);
    
    dateString = @"2016-04-19T07:51:11";
    date = [dateString dd_dateWithFallbackFormatters:@[fullDateWithoutMilisec]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[fullDateWithoutMilisec12HoursFormat, fullDate]];
    XCTAssertNil(date);
    
    dateString = @"05/09/1994 07:54 PM";
    date = [dateString dd_dateWithFallbackFormatters:@[fullDateWithoutMilisec12HoursFormat]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[fullDateWithoutMilisec, shortMonth12HoursFormat, shortMonthDay]];
    XCTAssertNil(date);
    
    dateString = @"June 1992";
    date = [dateString dd_dateWithFallbackFormatters:@[fullMonthYear]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[shortMonthDay, dayPointMonth]];
    XCTAssertNil(date);
    
    dateString = @"June-01-1992";
    date = [dateString dd_dateWithFallbackFormatters:@[monthDayYearWithDashes]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[fullMonthDayYearWithSlashes]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[shortMonthDay, shortWeekdayShortMonthWithTimeZone, weekdayShortMonthDayYear]];
    XCTAssertNil(date);

    dateString = @"Monday, Feb 01, 1992";
    date = [dateString dd_dateWithFallbackFormatters:@[weekdayShortMonthDayYear]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[shortWeekdayShortMonthWithTimeZone, fullDateWithoutMilisec, fullMonthYear]];
    XCTAssertNil(date);
    
    dateString = @"Feb 01, 1992";
    date = [dateString dd_dateWithFallbackFormatters:@[shortMonthShortDayYear]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[fullMonthYear, shortMonthDay]];
    XCTAssertNil(date);
    
    dateString = @"Mon, 01 Sep 1992 12:35:41 PDT";
    date = [dateString dd_dateWithFallbackFormatters:@[shortWeekdayShortMonthWithTimeZone]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[fullDate, fullDateWithoutMilisec]];
    XCTAssertNil(date);
    
    dateString = @"Sep 8, 2018 09:35 AM";
    date = [dateString dd_dateWithFallbackFormatters:@[shortMonth12HoursFormat]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[fullDateWithoutMilisec12HoursFormat]];
    XCTAssertNotNil(date);
    date = [dateString dd_dateWithFallbackFormatters:@[shortWeekdayShortMonthWithTimeZone, weekdayShortMonthDayYear]];
    XCTAssertNil(date);
}

#pragma mark - NSString+DDValidation

- (void)testConsistsOfWhitespaces {
    NSString *string = @"asada sdfs";
    XCTAssertFalse([string dd_consistsOfWhitespaces]);
    
    string = @"";
    XCTAssertTrue([string dd_consistsOfWhitespaces]);
    
    string = @"   \n   ";
    XCTAssertTrue([string dd_consistsOfWhitespaces]);
    
    string = @"  ";
    XCTAssertTrue([string dd_consistsOfWhitespaces]);
}

@end
