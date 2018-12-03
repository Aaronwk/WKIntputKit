//
//  WKTextField.m
//  海星
//
//  Created by Aaron_wk on 2018/10/22.
//  Copyright © 2018 HaiDaXingYi. All rights reserved.
//

#import "WKTextField.h"
#import "WKInputEnum.h"
#import "WKCheckTool.h"
#import "WKInputConst.h"

@implementation WKTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    [self defaultConfiguration];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)defaultConfiguration {
    _maxLength = WKInputMaxLength;
}


- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self setValue:_placeholderColor forKey:@"_placeholderLabel.textColor"];
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    _placeholderFont = placeholderFont;
    [self setValue:_placeholderFont forKey:@"_placeholderLabel.font"];
}

- (void)setCursorColor:(UIColor *)cursorColor {
    _cursorColor = cursorColor;
    self.tintColor = _cursorColor;
}

- (void)setMaxLength:(NSInteger)maxLength {
    _maxLength = maxLength;
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setInputLimitConditions:(WKInputLimitConditions)inputLimitConditions {
    _inputLimitConditions = inputLimitConditions;
}


- (BOOL)isInputLimitConditionsOfContent:(NSString *)content textField:(UITextField *)textField {
    
    return [WKCheckTool isInputLimitConditionsOfContent:content object:textField inputLimitConditions:self.inputLimitConditions];
}


/** Desc:检测键盘输入 */
- (void)textFieldDidChange:(UITextField *)textField
{
    [WKCheckTool textFieldDidChange:textField maxLength:_maxLength inputLimitConditions:self.inputLimitConditions];
}




@end
