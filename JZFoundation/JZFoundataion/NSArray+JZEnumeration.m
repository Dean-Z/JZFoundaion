//
//  NSArray+JZEnumeration.m
//  JZFoundation
//
//  Created by Z on 16/7/10.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import "NSArray+JZEnumeration.h"

@implementation NSArray (JZEnumeration)

- (NSArray *)mappedArrayUsingBlock:(id (^)(id, NSUInteger))block {
    NSMutableArray *mappedArray = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id o = block(obj, idx);
        if (o != nil) {
            [mappedArray addObject:o];
        }
    }];
    return mappedArray;
}

- (id)reducedObjectByBlock:(id (^)(id, id))block memo:(id)memo {
    __block id reducedObject = memo;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        reducedObject = block(reducedObject, obj);
    }];
    return reducedObject;
}

- (id)find:(BOOL (^)(id, NSUInteger))block {
    return [self objectUsingBlock:block];
}

- (id)objectUsingBlock:(BOOL (^)(id, NSUInteger))block {
    return [[self filteredArrayUsingBlock:block] firstObject];
}

- (NSArray *)filteredArrayUsingBlock:(BOOL (^)(id, NSUInteger))block opposite:(BOOL)opposite{
    NSMutableArray *filteredArray = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        BOOL r = block(obj, idx);
        if (r == !opposite) {
            [filteredArray addObject:obj];
        }
    }];
    return filteredArray;
}

- (NSArray *)filteredArrayUsingBlock:(BOOL (^)(id, NSUInteger))block {
    return [self filteredArrayUsingBlock:block opposite:NO];
}


- (NSArray *)rejectedArrayUsingBlock:(BOOL (^)(id, NSUInteger))block {
    return [self filteredArrayUsingBlock:block opposite:YES];
}

@end
