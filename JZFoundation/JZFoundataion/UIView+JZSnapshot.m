//
//  UIView+JZSnapshot.m
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import "UIView+JZSnapshot.h"

@implementation UIView (JZSnapshot)

- (UIImage *)jz_renderAsImage
{
    UIImage *snapshotImage;
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    {
        [self.layer.presentationLayer renderInContext:UIGraphicsGetCurrentContext()];
        snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return snapshotImage;
}

//---------------------------------------------------------------------

- (UIImage *)jz_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates
{
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return [self jz_renderAsImage];
    } else {
        
        UIImage *snapshotImage;
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
        {
            [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
            snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        }
        UIGraphicsEndImageContext();
        
        return snapshotImage;
    }
}

@end
