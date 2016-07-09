//
//  NSMutableArray+JZSafeMutableArray.h
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (JZSafeMutableArray)

- (void)jz_addObject:(id)object;
- (void)jz_shuffle;
- (void)jz_reverse;
- (void)jz_moveObjectsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)idx;
- (void)insertObjects:(NSArray *)objects atIndex:(NSUInteger)index;
- (BOOL)jz_appendNotExistingObjectsToArray:(NSArray *)arr;

@end
