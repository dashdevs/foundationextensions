//
//  NSURLComponents+DDExtensions.h
//  foundationextensions
//
//  Copyright © 2019 dashdevs.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURLComponents (DDURLQueryItem) 

/**
 Allows to access query item value by its name. This string is not percent-encoded

 @param name The name of the query item. For example, in the URL http://www.apple.com/search/?q=iPad, the name parameter is q.
 @return The value for the query item by its name. For example, in the URL http://www.apple.com/search/?q=iPad, the value parameter is iPad.


 */
- (nullable NSString *)dd_queryItemValueForName:(NSString *)name API_AVAILABLE(macos(10.10), ios(8.0), watchos(2.0), tvos(9.0));

@end

NS_ASSUME_NONNULL_END
