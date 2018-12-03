//
//  WKInputUtil.m
//  WKInputKit_Example
//
//  Created by Aaron_wk on 2018/12/3.
//  Copyright © 2018 objective. All rights reserved.
//

#import "WKInputUtil.h"

@implementation WKInputUtil

+ (CGFloat)getContentHeight:(NSString *)str withFont:(UIFont *)font withWidth:(CGFloat)width
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = NSTextAlignmentLeft;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle
                          };
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}

@end
