//
//  WKTextField.h
//  海星
//
//  Created by Aaron_wk on 2018/10/22.
//  Copyright © 2018 HaiDaXingYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKInputEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKTextField : UITextField

/** Desc:允许最大输入边界（单位:字数） */
@property (assign, nonatomic) NSInteger maxLength;

/** Desc:placeholder颜色 */
@property (strong, nonatomic) UIColor *placeholderColor;

/** Desc:placeholder字体 */
@property (strong, nonatomic) UIFont *placeholderFont;

/** Desc:光标颜色 */
@property (strong, nonatomic) UIColor *cursorColor;

/** Desc:文本输入白名单 默认: WKInputAllowNormal */
@property (assign, nonatomic) WKInputLimitConditions inputLimitConditions;



- (BOOL)isInputLimitConditionsOfContent:(NSString *)content textField:(UITextField *)textField;

@end

NS_ASSUME_NONNULL_END
