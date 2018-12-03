//
//  WKInputEnum.h
//  WKInputKit
//
//  Created by Aaron_wk on 2018/11/28.
//  Copyright © 2018 Aaron_wk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 文本输入白名单
 
 - WKInputAllowNormal: 不做任何限制
 - WKInputAllowNumber: 允许输入数字
 - WKInputAllowEnglish: 允许输入英文
 - WKInputAllowPunct:允许输入标点符号
 - WKInputAllowEnglishAndNumber:允许输入英文加字幕
 - WKInputAllowEmoji: 允许输入Emoji  *暂未实现
 */
typedef NS_ENUM(NSUInteger, WKInputLimitConditions) {
    WKInputAllowNormal  = 0,
    WKInputAllowNumber  = 1 << 1,
    WKInputAllowEnglish = 1 << 2,
    WKInputAllowPunct   = 1 << 3,
    WKInputAllowEmoji   = 1 << 4,
    WKInputAllowChinese = 1 << 5, // There is a Bug
    WKInputAllowEnglishAndNumber = 1 << 6,
};


@interface WKInputEnum : NSObject

@end

NS_ASSUME_NONNULL_END
