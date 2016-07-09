//
//  UIView+JZSnapshot.h
//  GamesDemo
//
//  Created by Z on 16/7/9.
//  Copyright © 2016年 DZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JZSnapshot)

/** Similar to snapshot... but uses the old <iOS7 layer renderInContext paradigm. */
- (UIImage *)jz_renderAsImage;

/** Returns a UIImage snapshot using the new iOS7 `drawViewHierarchyInRect:...` method. Falls back to `renderAsImage` for <ios7.0 */
- (UIImage *)jz_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

@end
