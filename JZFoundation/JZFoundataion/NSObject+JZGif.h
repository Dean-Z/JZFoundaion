//
//  NSObject+JZGif.h
//  JZFoundation
//
//  Created by Z on 16/7/10.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (JZGif)

- (void)publishForGif:(NSArray *)images
             complete:(void (^)(NSString *result, NSError *error))complete;

@end
