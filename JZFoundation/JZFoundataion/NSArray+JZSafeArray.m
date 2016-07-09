//
//  NSArray+JZSafeArray.m
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import "NSArray+JZSafeArray.h"

@implementation NSArray (JZSafeArray)

- (id)jz_objectAtIndex:(NSUInteger)index{
    if (index>=self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}

@end
