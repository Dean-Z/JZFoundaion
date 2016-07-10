//
//  NSArray+JZEnumeration.h
//  JZFoundation
//
//  Created by Z on 16/7/10.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JZEnumeration)

- (NSArray *)mappedArrayUsingBlock:(id (^)(id obj, NSUInteger idx))block;
- (id)reducedObjectByBlock:(id (^)(id memo, id obj))block memo:(id)memo;
- (id)find:(BOOL (^)(id obj, NSUInteger idx))block;
- (id)objectUsingBlock:(BOOL (^)(id obj, NSUInteger idx))block;
- (NSArray *)filteredArrayUsingBlock:(BOOL (^)(id obj, NSUInteger idx))block;
- (NSArray *)rejectedArrayUsingBlock:(BOOL (^)(id obj, NSUInteger idx))block;

@end
