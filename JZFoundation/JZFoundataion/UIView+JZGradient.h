//
//  UIView+JZGradient.h
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JZGradient)

- (void)jz_addGradientLayerWithcolors:(NSArray<UIColor *> *)colors;

- (void)jz_addGradientLayerWithcolors:(NSArray<UIColor *> *)colors
                            locations:(NSArray<NSNumber*> *)locations;

- (void)jz_addGradientLayer:(CGRect)fream
                     colors:(NSArray<UIColor *> *)colors
                  locations:(NSArray<NSNumber*> *)locations;

- (void)jz_addGradientLayer:(CGRect)fream
                     colors:(NSArray<UIColor*> *)colors
                 startPoint:(CGPoint)startPoint
                   endPoint:(CGPoint)endPoint
                  locations:(NSArray<NSNumber*> *)locations;

@end
