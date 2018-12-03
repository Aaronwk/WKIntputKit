//
//  WKCheckTool.m
//  Pods-WKInputKit_Example
//
//  Created by Aaron_wk on 2018/11/30.
//

#import "WKCheckTool.h"
#import "WKInputEnum.h"

@implementation WKCheckTool

/** Desc:当c为数字0-9时，返回非零值，否则返回零 */
+ (BOOL)isSymbolInputRuleAndNumber:(NSString *)str
{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    unsigned long len=str.length;
    for(int i=0;i<len;i++)
    {
        unichar c=[str characterAtIndex:i];
        if(!((isdigit(c))
             ||([other rangeOfString:str].location != NSNotFound)
             ))
            return NO;
    }
    
    return YES;
}
/** Desc:当c为英文字母a-z或A-Z时，返回非零值，否则返回零 */
+ (BOOL)isSymbolInputRuleAndEnglish:(NSString *)str
{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    unsigned long len=str.length;
    for(int i=0;i<len;i++)
    {
        unichar c=[str characterAtIndex:i];
        if(!((isalpha(c))
             ||([other rangeOfString:str].location != NSNotFound)
             ))
            return NO;
    }
    
    return YES;
}

/** Desc:字母+数字 */
+ (BOOL)isSymbolInputRuleAndEnglishOrNumber:(NSString *)str
{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    unsigned long len=str.length;
    for(int i=0;i<len;i++)
    {
        unichar c=[str characterAtIndex:i];
        if(!((isalpha(c))
             || (isdigit(c))
             ||([other rangeOfString:str].location != NSNotFound)
             ))
            return NO;
    }
    
    return YES;
}

/** Desc:当c为小写英文字母(a-z)时，返回非零值，否则返回零。 */
+ (BOOL)isSymbolInputRuleAndEnglishForLower:(NSString *)str
{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    unsigned long len=str.length;
    for(int i=0;i<len;i++)
    {
        unichar c=[str characterAtIndex:i];
        if(!((islower(c))
             ||([other rangeOfString:str].location != NSNotFound)
             ))
            return NO;
    }
    
    return YES;
}

/** Desc:当c为大写英文字母(A-Z)时，返回非零值，否则返回零。 */
+ (BOOL)isSymbolInputRuleAndEnglishForUpper:(NSString *)str
{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    unsigned long len=str.length;
    for(int i=0;i<len;i++)
    {
        unichar c=[str characterAtIndex:i];
        if(!((isupper(c))
             ||([other rangeOfString:str].location != NSNotFound)
             ))
            return NO;
    }
    
    return YES;
}

/** Desc:当c为标点符号时，返回非零值，否则返回零。 */
+ (BOOL)isSymbolInputRuleAndPunct:(NSString *)str
{
    NSString *other = @"➋➌➍➎➏➐➑➒";
    unsigned long len=str.length;
    for(int i=0;i<len;i++)
    {
        unichar c=[str characterAtIndex:i];
        if(!((ispunct(c))
             ||([other rangeOfString:str].location != NSNotFound)
             ))
            return NO;
    }
    
    return YES;
}

/** Desc:当输入文本为中文时，返回非零值，否则返回零。 */
+ (BOOL)isSymbolInputRuleAndEnglishForChinese:(NSString *)str
{
    NSString *regex = @"^[\\u4E00-\\u9FEA]+$";
    
    return ([str rangeOfString:regex options:NSRegularExpressionSearch].length>0);
}
/** Desc:获取文本中汉字的长度 */
+ (NSInteger)getContentChineseLength:(NSString *)content
{
    NSInteger count = 0;
    for(int i=0; i< [content length];i++)
    {
        int a =[content characterAtIndex:i];
        if( a >0x4e00&& a <0x9fff){
            count++;
        }
    }
    return count;
}

+ (BOOL)isInputLimitConditionsOfContent:(NSString *)content object:(id)object inputLimitConditions:(WKInputLimitConditions)inputLimitConditions {
    
    BOOL isAllowInput = NO;
    if(inputLimitConditions & WKInputAllowNormal) {
        return YES;
    }
    if(inputLimitConditions & WKInputAllowNumber) {
        if([WKCheckTool isSymbolInputRuleAndNumber:content]) {
            return YES;
        }else{
            isAllowInput = NO;
        }
    }
    if(inputLimitConditions & WKInputAllowEnglish) {
        if([WKCheckTool isSymbolInputRuleAndEnglish:content]) {
            return YES;
        }else{
            isAllowInput = NO;
        }
    }
    if(inputLimitConditions & WKInputAllowPunct) {
        if([WKCheckTool isSymbolInputRuleAndPunct:content]) {
            return YES;
        }else{
            isAllowInput = NO;
        }
    }
    if(inputLimitConditions & WKInputAllowEnglishAndNumber) {
        if([WKCheckTool isSymbolInputRuleAndEnglishOrNumber:content]) {
            return YES;
        }else{
            isAllowInput = NO;
        }
    }
    if(inputLimitConditions & WKInputAllowChinese) {
        if([WKCheckTool isSymbolInputRuleAndEnglishForChinese:content]) {
            return YES;
        }else{
            isAllowInput = NO;
            if([WKCheckTool isSymbolInputRuleAndEnglish:content]) {
                isAllowInput = YES;
            }else{
                isAllowInput = NO;
            }
        }
    }
    if(inputLimitConditions & WKInputAllowEmoji) {
        return YES;
    }
    return isAllowInput;
}

/** Desc:检测键盘输入 */
+ (void)textFieldDidChange:(id)object maxLength:(NSInteger)maxLength inputLimitConditions:(WKInputLimitConditions)inputLimitConditions
{
    UITextField *textField = (UITextField *)object;
    NSString *toBeString = textField.text;
    NSString *lang = [textField.textInputMode primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"])
    {
        UITextRange *selectedRange = [textField markedTextRange];
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if (!position)
        {
            if (toBeString.length > maxLength)
            {
                NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:maxLength];
                if (rangeIndex.length == 1)
                {
                    textField.text = [toBeString substringToIndex:maxLength];
                }
                else
                {
                    NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                    textField.text = [toBeString substringWithRange:rangeRange];
                }
            }else{
                if(inputLimitConditions & WKInputAllowChinese) {
                    if(inputLimitConditions & WKInputAllowEnglish) {
                        
                    }else{
                        NSInteger count = [WKCheckTool getContentChineseLength:toBeString];
                        NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, count)];
                        if(count == 0) {
                            if(textField.text.length == 0) {
                                textField.text = @"";
                            }
                            
                        }else{
                            textField.text = [toBeString substringWithRange:rangeRange];
                        }
                    }
                }
            }
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else
    {
        if (toBeString.length > maxLength)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:maxLength];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:maxLength];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

@end
