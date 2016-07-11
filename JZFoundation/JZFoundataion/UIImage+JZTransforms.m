//
//  UIImage+JZTransforms.m
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import "UIImage+JZTransforms.h"
#import "JZFoundation.h"

@implementation UIImage (JZTransforms)

- (UIImage *)jz_imageRotatedByRadians:(CGFloat)radians{
    // Get the bounds for the destination images
    CGRect imgRect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGRect rotatedRect = CGRectApplyAffineTransform(imgRect, CGAffineTransformMakeRotation(-radians));
    
    // Create the contedt with the correct scale
    UIGraphicsBeginImageContextWithOptions(rotatedRect.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Rotate the context around the centre and draw in he image
    CGContextTranslateCTM(ctx, rotatedRect.size.width/2, rotatedRect.size.height/2);
    CGContextRotateCTM(ctx, -radians);
    [self drawAtPoint:CGPointMake(-imgRect.size.width/2, -imgRect.size.height/2)];
    
    // Get the image to return and cleanup
    UIImage *rtnImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return rtnImg;
}

//---------------------------------------------------------------------

- (UIImage *)jz_imageRotatedByDegrees:(CGFloat)degrees{
    return [self jz_imageRotatedByRadians:JZDegreesToRadian(degrees)];
}


@end
