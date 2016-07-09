//
//  UILabel+KBAttributedText.m
//  Echo
//
//  Created by Z on 15/7/28.
//  Copyright (c) 2015年 The eve of the Shanghai information technology co., LTD. All rights reserved.
//

#import "UILabel+JZAttributedText.h"
#import "NSString+JZExtention.h"

@implementation UILabel (KBAttributedText)

/*
 Label 变色
 text：原文本
 rangeText：变色文本
 color:颜色
 */
- (void) attributedTextColorWithText:(NSString *)text
                           rangeText:(NSString *)rangeText
                               color:(UIColor *)color
{
    if ([NSString isNilOrEmpty:rangeText])
    {
        self.text = text;
        return;
    }
    NSRange range = [text rangeOfString:rangeText];
    [self attributedTextColorWithText:text range:range color:color];
}


- (void) attributedTextColorWithText:(NSString *)text
                               range:(NSRange)range
                               color:(UIColor *)color
{
    NSMutableAttributedString *attibutedText = [[NSMutableAttributedString alloc] initWithString:text];
    
    if (!isnan(range.location) && range.length>0)
    {
        [attibutedText addAttribute: NSForegroundColorAttributeName value:color range:range];
        self.attributedText = attibutedText;
    }
    else
    {
        self.text = text;
    }
}

- (void) attributedTextColorWithText:(NSString *)text
                          rangeTexts:(NSArray *)rangeTexts
                              colors:(NSArray *)colors
{
    NSMutableAttributedString *attibutedText = [[NSMutableAttributedString alloc] initWithString:text];
    BOOL attributeAble = NO;
    for (NSString *textString in rangeTexts)
    {
        if (![self emptyString:textString])
        {
            NSRange range = [text rangeOfString:textString];
            NSInteger index = [rangeTexts indexOfObject:textString];
            if (index < colors.count && !isnan(range.location) && range.length>0)
            {
                [attibutedText addAttribute: NSForegroundColorAttributeName value:colors[index] range:range];
                attributeAble = YES;
            }
        }
    }
    if (attributeAble)
    {
        self.attributedText = attibutedText;
    }
    else
    {
        self.text = text;
    }
}

/***
 一个字符串多重特效
 values: 对应的数值
 */

- (void) attributedTextColorWithText:(NSString *)text
                           rangeText:(NSString *)rangeText
                          attributes:(NSArray *)attributes
                              values:(NSArray *)values
{
    NSMutableAttributedString *attibutedText = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange range = [text rangeOfString:rangeText];
    
    if (!isnan(range.location) && range.length>0)
    {
        for (NSString *attribute in attributes)
        {
            NSInteger index = [attributes indexOfObject:attribute];
            if (![self emptyString:attribute] && index < values.count)
            {
                [attibutedText addAttribute:attribute value:values[index] range:range];
            }
        }
        self.attributedText = attibutedText;
    }
    else
    {
        self.text = text;
    }
}


/**
 仅限于vaule里存在颜色和字体
 */

- (void) attributedTextColorWithText:(NSString *)text
                           rangeText:(NSString *)rangeText
                              values:(NSArray *)values
{
    NSMutableArray *attributes = @[].mutableCopy;
    for (id object in values)
    {
        if ([object isKindOfClass:[UIColor class]])
        {
            [attributes addObject:NSForegroundColorAttributeName];
        }
        else if([object isKindOfClass:[UIFont class]])
        {
            [attributes addObject:NSFontAttributeName];
        }
    }
    [self attributedTextColorWithText:text
                            rangeText:rangeText
                           attributes:attributes
                               values:values];
}

/*
 Label 改变部分字体
 text：原文本
 rangeText：变色文本
 font:字体大小
 */
- (void) attributedTextFontWithText:(NSString *)text
                           rangeText:(NSString *)rangeText
                              font:(UIFont *)font
{
    NSRange range = [text rangeOfString:rangeText];
    [self attributedTextFontWithText:text range:range font:font];
}

- (void) attributedTextFontWithText:(NSString *)text
                               range:(NSRange)range
                               font:(UIFont *)font
{
    NSMutableAttributedString *attibutedText = [[NSMutableAttributedString alloc] initWithString:text];
    
    if (!isnan(range.location) && range.length>0)
    {
        [attibutedText addAttribute: NSFontAttributeName value:font range:range];
        self.attributedText = attibutedText;
    }
    else
    {
        self.text = text;
    }
}






- (BOOL)emptyString:(NSString *)textString
{
    return [textString isKindOfClass:[NSNull class]] || !textString || textString.length == 0;
}


@end
