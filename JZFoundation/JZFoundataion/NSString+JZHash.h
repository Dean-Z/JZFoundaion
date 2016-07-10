//
//  NSString+JZHash.h
//  JZFoundation
//
//  Created by Z on 16/7/10.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JZHash)

/**
 Creates a MD5 hash of the current string as hex NSString representation.
 */
- (nonnull NSString*) MD5;

/**
 Creates a MD5 hash of the current string as NSData representation.
 */
- (nonnull NSData*) MD5Data;

/**
 Creates a SHA1 hash of the current string as hex NSString representation.
 */
- (nonnull NSString*) SHA1;

/**
 Creates a SHA1 hash of the current string as NSData representation.
 */
- (nonnull NSData*) SHA1Data;

/**
 Creates a SHA256 hash of the current string as hex NSString representation.
 */
- (nonnull NSString*) SHA256;

/**
 Creates a SHA256 hash of the current string as NSData representation.
 */
- (nonnull NSData*) SHA256Data;


@end
