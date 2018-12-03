//
//  WKInputUtil.h
//  WKInputKit_Example
//
//  Created by Aaron_wk on 2018/12/3.
//  Copyright © 2018 objective. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKInputUtil : NSObject

/** Desc:获取文本实际高度 */
+ (CGFloat)getContentHeight:(NSString *)str withFont:(UIFont *)font withWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
