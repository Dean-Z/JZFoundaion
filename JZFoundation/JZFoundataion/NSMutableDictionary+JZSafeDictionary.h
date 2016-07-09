//
//  NSMutableDictionary+JZSafeDictionary.h
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (JZSafeDictionary)

- (void)jz_setObject:(id)anObject forKey:(NSString *)aKey;

@end
