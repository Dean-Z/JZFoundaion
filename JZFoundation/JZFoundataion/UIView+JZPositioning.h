//
//  UIView+JZPositioning.h
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JZPositioning)

/////////////////////////////////////////////////////////////////////////
#pragma mark - Frame get/set shorthand

/** Frame origin/size */
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Bounds shorthand

@property (nonatomic, assign) CGSize boundsSize;
@property (nonatomic, assign) CGFloat boundsWidth;
@property (nonatomic, assign) CGFloat boundsHeight;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Additional setters

/** Layout with respect to the superview.
 @throws NSGenericException if superview = nil */
- (void)setMargins:(UIEdgeInsets)margins;

/** Positions the view a given distance from the bottom boundary of the superview changing the frame origin (as opposed to the size)
 @throws NSGenericException if superview = nil */
- (void)setBottomMargin:(CGFloat)bottom;


@end
