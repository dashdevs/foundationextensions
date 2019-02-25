//
//  NSURLRequest+DDExtensions.h
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLRequest (DDDebug)

- (NSString * _Nonnull)dd_curl;

@end

NS_ASSUME_NONNULL_END
