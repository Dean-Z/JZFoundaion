//
//  UILabel+JZAttributedText.h
//  Echo
//
//  Created by Z on 15/7/28.
//  Copyright (c) 2015年 The eve of the Shanghai information technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JZAttributedText)

/*
 Label 变色
 text：原文本
 rangeText：变色文本
 color:颜色
 */
- (void) attributedTextColorWithText:(NSString *)text
                           rangeText:(NSString *)rangeText
                               color:(UIColor *)color;

- (void) attributedTextColorWithText:(NSString *)text
                               range:(NSRange)range
                               color:(UIColor *)color;

/***
 一个字符串多重特效
 values: 对应的数值
 */
- (void) attributedTextColorWithText:(NSString *)text
                          rangeTexts:(NSArray *)rangeTexts
                              colors:(NSArray *)colors;
/**
 仅限于vaule里存在颜色和字体
 */
- (void) attributedTextColorWithText:(NSString *)text
                           rangeText:(NSString *)rangeText
                              values:(NSArray *)values;

- (void) attributedTextColorWithText:(NSString *)text
                           rangeText:(NSString *)rangeText
                          attributes:(NSArray *)attributes
                              values:(NSArray *)values;

/*
 Label 改变部分字体
 text：原文本
 rangeText：变色文本
 font:字体大小
 */
- (void) attributedTextFontWithText:(NSString *)text
                          rangeText:(NSString *)rangeText
                               font:(UIFont *)font;

- (void) attributedTextFontWithText:(NSString *)text
                              range:(NSRange)range
                               font:(UIFont *)font;


@end
