//
//  NSMutableDictionary+JZSafeDictionary.m
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import "NSMutableDictionary+JZSafeDictionary.h"

@implementation NSMutableDictionary (JZSafeDictionary)

- (void)jz_setObject:(id)anObject forKey:(NSString *)aKey{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}


@end
