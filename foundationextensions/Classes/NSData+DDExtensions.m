//
//  NSData+DDExtensions.m
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import "NSData+DDExtensions.h"

@implementation NSData (DDTransformations)

- (NSString *)dd_hexString {
    const unsigned char *bytes = (const unsigned char *)self.bytes;
    NSMutableString *hex = [NSMutableString new];
    for (NSInteger i = 0; i < self.length; i++) {
        [hex appendFormat:@"%02x", bytes[i]];
    }
    return [hex copy];
}

@end
