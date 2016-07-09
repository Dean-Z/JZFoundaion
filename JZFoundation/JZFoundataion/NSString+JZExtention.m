//
//  NSString+JZExtention.m
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import "NSString+JZExtention.h"

@implementation NSString (JZExtention)

+ (BOOL)isNilOrEmpty:(NSString *)aNSString
{
    if ([aNSString isKindOfClass:[NSString class]]) {
        return [aNSString isKindOfClass:[NSNull class]] || !aNSString || aNSString.length == 0;
    }
    else if ([aNSString isKindOfClass:[NSString class]]) {
        return YES;
    }
    else {
        return aNSString ? NO : YES;
    }
}

@end
