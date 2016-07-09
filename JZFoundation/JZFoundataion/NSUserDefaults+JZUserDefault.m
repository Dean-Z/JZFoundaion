//
//  NSUserDefaults+JZUserDefault.m
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import "NSUserDefaults+JZUserDefault.h"

@implementation NSUserDefaults (JZUserDefault)

+ (void)jz_setObjcet:(id)objc forkey:(NSString *)key{
    if (objc) {
        [[NSUserDefaults standardUserDefaults] setObject:objc forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (id)valueForKey:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

@end
