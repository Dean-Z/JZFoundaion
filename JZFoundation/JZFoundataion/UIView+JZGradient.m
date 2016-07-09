//
//  UIView+JZGradient.m
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import "UIView+JZGradient.h"

@implementation UIView (JZGradient)

- (void)jz_addGradientLayerWithcolors:(NSArray<UIColor *> *)colors{
    [self jz_addGradientLayerWithcolors:colors
                              locations:@[@0.0,@1.0]];
}

- (void)jz_addGradientLayerWithcolors:(NSArray<UIColor *> *)colors
                            locations:(NSArray<NSNumber*> *)locations{
    [self jz_addGradientLayer:self.bounds
                       colors:colors
                    locations:locations];
}

- (void)jz_addGradientLayer:(CGRect)fream
                     colors:(NSArray<UIColor *> *)colors
                  locations:(NSArray<NSNumber*> *)locations{
    [self jz_addGradientLayer:fream
                       colors:colors
                   startPoint:CGPointZero
                     endPoint:CGPointZero
                    locations:locations];
}

- (void)jz_addGradientLayer:(CGRect)fream
                     colors:(NSArray<UIColor*> *)colors
                 startPoint:(CGPoint)startPoint
                   endPoint:(CGPoint)endPoint
                  locations:(NSArray<NSNumber*> *)locations{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = fream;
    gradientLayer.colors = [self jz_colorToCGColor:colors];
    if (!CGPointEqualToPoint(startPoint, CGPointZero) &&
        !CGPointEqualToPoint(endPoint, CGPointZero)) {
        gradientLayer.startPoint = startPoint;
        gradientLayer.endPoint = endPoint;
    }
    gradientLayer.locations = locations;
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (NSArray *)jz_colorToCGColor:(NSArray<UIColor*> *)colors{
    NSMutableArray *gradientColors = @[].mutableCopy;
    for (UIColor *color in colors) {
        [gradientColors addObject:(id)color.CGColor];
    }
    return gradientColors;
}

@end
