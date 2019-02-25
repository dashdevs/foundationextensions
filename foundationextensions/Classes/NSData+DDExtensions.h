//
//  NSData+DDExtensions.h
//  FoundationExtensions
//
//  Copyright © 2018 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (DDTransformations)

/**
 Returns concatenated bytes string version of raw NSData. Useful for getting push notifications token, for instance

 @return Concatenated bytes string version
 */
-(NSString *)dd_hexString;

@end

NS_ASSUME_NONNULL_END
