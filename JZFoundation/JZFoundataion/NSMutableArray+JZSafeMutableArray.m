//
//  NSMutableArray+JZSafeMutableArray.m
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import "NSMutableArray+JZSafeMutableArray.h"

@implementation NSMutableArray (JZSafeMutableArray)

- (void)jz_addObject:(id)object{
    if (object) {
        [self addObject:object];
    }
}

- (void)jz_shuffle{
    for (NSInteger times=0; times < 3; ++times) {
        for (NSInteger i=self.count - 1; i >= 0; --i) {
            NSInteger fromIndex = arc4random() % self.count;
            NSInteger toIndex = arc4random() % self.count;
            
            [self exchangeObjectAtIndex:fromIndex withObjectAtIndex:toIndex];
        }
    }
}

- (void)jz_reverse{
    for (NSInteger i=0, j=self.count - 1; i < j; ++i, --j) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
}

- (void)jz_moveObjectsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)idx{
    NSArray *objectsToMove = [self objectsAtIndexes:indexes];
    idx -= [indexes countOfIndexesInRange:(NSRange){0, idx}];
    [self removeObjectsAtIndexes:indexes];
    [self replaceObjectsInRange:(NSRange){idx,0} withObjectsFromArray:objectsToMove];
}

- (void)insertObjects:(NSArray *)objects atIndex:(NSUInteger)index{
    [self insertObjects:objects atIndexes:
     [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(index, [objects count])]];
}

- (BOOL)jz_appendNotExistingObjectsToArray:(NSArray *)arr{
    BOOL updated = NO;
    for (NSObject *obj in arr) {
        if (![self containsObject:obj]) {
            updated = YES;
            [self addObject:obj];
        }
    }
    return updated;
}



@end
