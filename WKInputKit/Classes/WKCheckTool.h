//
//  WKCheckTool.h
//  Pods-WKInputKit_Example
//
//  Created by Aaron_wk on 2018/11/30.
//

#import <Foundation/Foundation.h>
#import "WKInputEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKCheckTool : NSObject

/** Desc:当c为数字0-9时，返回非零值，否则返回零 */
+ (BOOL)isSymbolInputRuleAndNumber:(NSString *)str;

/** Desc:当c为英文字母a-z或A-Z时，返回非零值，否则返回零 */
+ (BOOL)isSymbolInputRuleAndEnglish:(NSString *)str;

/** Desc:字母+数字 */
+ (BOOL)isSymbolInputRuleAndEnglishOrNumber:(NSString *)str;

/** Desc:当c为小写英文字母(a-z)时，返回非零值，否则返回零。 */
+ (BOOL)isSymbolInputRuleAndEnglishForLower:(NSString *)str;

/** Desc:当c为大写英文字母(A-Z)时，返回非零值，否则返回零。 */
+ (BOOL)isSymbolInputRuleAndEnglishForUpper:(NSString *)str;

/** Desc:当c为标点符号时，返回非零值，否则返回零。 */
+ (BOOL)isSymbolInputRuleAndPunct:(NSString *)str;

/** Desc:当输入文本为中文时，返回非零值，否则返回零。 */
+ (BOOL)isSymbolInputRuleAndEnglishForChinese:(NSString *)str;
/** Desc:后去中文长度 - 有序排列 */
+ (NSInteger)getContentChineseLength:(NSString *)content;

/** Desc:检测键盘输入 */
+ (void)textFieldDidChange:(id )object maxLength:(NSInteger)maxLength inputLimitConditions:(WKInputLimitConditions)inputLimitConditions;

+ (BOOL)isInputLimitConditionsOfContent:(NSString *)content object:(id)object inputLimitConditions:(WKInputLimitConditions)inputLimitConditions;

@end

NS_ASSUME_NONNULL_END
