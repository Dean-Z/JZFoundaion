//
//  UIImage+JZTransforms.h
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JZTransforms)

/** Returns a new image which is this one rotated by the specified angle.  NOT THREAD SAFE: Call form the main thread only */
- (UIImage *)jz_imageRotatedByRadians:(CGFloat)radians;

/** Convenience method for degree rotations.  See imageRotatedByRadians: */
- (UIImage *)jz_imageRotatedByDegrees:(CGFloat)degrees;


@end
