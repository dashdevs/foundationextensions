//
//  NSURLRequest+DDExtensions.m
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import "NSURLRequest+DDExtensions.h"

@implementation NSURLRequest (DDDebug)

- (NSString * _Nullable)dd_escapeQuotesInString:(NSString * _Nullable)string {
    NSParameterAssert(string.length);
    return [string stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
}

- (NSString * _Nonnull)dd_curl {
    NSMutableString *curlString = [NSMutableString stringWithFormat:@"curl -X %@", self.HTTPMethod];
    
    for (NSString *key in self.allHTTPHeaderFields.allKeys) {
        
        NSString *headerKey = [self dd_escapeQuotesInString:key];
        NSString *headerValue = [self dd_escapeQuotesInString:self.allHTTPHeaderFields[key] ];
        
        [curlString appendFormat:@" -H \"%@: %@\"", headerKey, headerValue];
    }
    
    NSString *bodyDataString = [[NSString alloc] initWithData:self.HTTPBody encoding:NSUTF8StringEncoding];
    
    if (bodyDataString.length > 0) {
        bodyDataString = [self dd_escapeQuotesInString:bodyDataString];
        [curlString appendFormat:@" -d \"%@\"", bodyDataString];
    }
    
    [curlString appendFormat:@" \"%@\"", self.URL.absoluteString];
    
    return curlString;
}

@end
