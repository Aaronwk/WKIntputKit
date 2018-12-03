//
//  WKTextView.h
//  WKInputKit_Example
//
//  Created by Aaron_wk on 2018/12/3.
//  Copyright © 2018 objective. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKInputEnum.h"

NS_ASSUME_NONNULL_BEGIN

@class WKTextView;

typedef void(^ContentLengthBLock)(WKTextView *textView, NSInteger count);
typedef void(^TextDidBeginEditingBlock)(WKTextView *textView);
typedef void(^TextDidEndEditingBlock)(WKTextView *textView);
typedef void(^TextDidChangeBlock)(WKTextView *textView);

@interface WKTextView : UITextView

/** Desc:允许最大输入边界（单位:字数） */
@property (assign, nonatomic) NSInteger maxLength;

/** Desc:placeholder颜色 */
@property (strong, nonatomic) UIColor *placeholderColor;

/** Desc:placeholder字体 */
@property (strong, nonatomic) UIFont *placeholderFont;

/** Desc:光标颜色 */
@property (strong, nonatomic) UIColor *cursorColor;

/** Desc:边框颜色 */
@property (strong, nonatomic) UIColor *borderColor;

/** Desc:边框粗细 */
@property (assign, nonatomic) CGFloat borderWidth;

/** Desc:是否显示边框,默认：NO */
@property (assign, nonatomic) BOOL showBorder;

/** Desc:圆角默认：0 */
@property (assign, nonatomic) CGFloat roundedCornerRadius;

/** Desc:文本输入白名单 默认: WKInputAllowNormal */
@property (assign, nonatomic) WKInputLimitConditions inputLimitConditions;

/** Desc:文本长度监听 */
@property (copy, nonatomic) ContentLengthBLock contentLengthBLock;

/** Desc:开始编辑 */
@property (copy, nonatomic) TextDidBeginEditingBlock textDidBeginEditingBlock;

/** Desc:结束编辑 */
@property (copy, nonatomic) TextDidEndEditingBlock textDidEndEditingBlock;

/** Desc:编辑中... */
@property (copy, nonatomic) TextDidChangeBlock textDidChangeBlock;

@end

NS_ASSUME_NONNULL_END
