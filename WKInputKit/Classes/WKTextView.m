//
//  WKTextView.m
//  WKInputKit_Example
//
//  Created by Aaron_wk on 2018/12/3.
//  Copyright © 2018 objective. All rights reserved.
//

#import "WKTextView.h"
#import "WKInputUtil.h"
#import "WKInputConst.h"

@interface WKTextView ()

/** Desc: 占位符文字 */
@property (strong, nonatomic) UILabel *placeholderLabel;

@property(nonatomic) UIEdgeInsets currentContentInset;




@end

@implementation WKTextView

@synthesize contentInset = _contentInset;

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addObserver];
    [self defaultConfiguration];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver];
        [self defaultConfiguration];
    }
    return self;
}

- (void)defaultConfiguration {
    _maxLength = WKInputMaxLength;
    self.placeholderLabel.text = WKInputTextViewPlaceholder;
    self.placeholderLabel.hidden = (self.text.length > 0)?YES:NO;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self insertSubview:self.placeholderLabel atIndex:0];
    [self loadSubviewsFrame];
}

- (void)loadSubviewsFrame {
    CGFloat placeholderHeight = [WKInputUtil getContentHeight:self.placeholderLabel.text withFont:self.placeholderLabel.font withWidth:self.frame.size.width-10];
    [self.placeholderLabel setFrame:CGRectMake(5, 8.5, self.frame.size.width-10, placeholderHeight)];
}

- (void)configContentEdgeInsets {
    CGFloat top = self.currentContentInset.top;
    CGFloat left = self.currentContentInset.left;
    CGFloat right = self.currentContentInset.right;
    CGRect placeholderLabelFrame = self.placeholderLabel.frame;
    NSLog(@"contentInset.left:%f", self.currentContentInset.left);
    [self.placeholderLabel setFrame:CGRectMake(placeholderLabelFrame.origin.x + left, placeholderLabelFrame.origin.y + top, placeholderLabelFrame.size.width - left - right, placeholderLabelFrame.size.height)];
}

- (void)addObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginediting:) name:UITextViewTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endediting:) name:UITextViewTextDidEndEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doingEditing:) name:UITextViewTextDidChangeNotification object:self];
}

#pragma mark 开始编译
-(void)beginediting:(NSNotification *)notification
{
    if(self.textDidBeginEditingBlock){
        self.textDidBeginEditingBlock(self);
    }
}
#pragma mark 停止编译
-(void)endediting:(NSNotification *)notification
{
    if(self.textDidEndEditingBlock) {
        self.textDidEndEditingBlock(self);
    }
}
#pragma mark 正在编译
-(void)doingEditing:(NSNotification *)notification
{
    [self updateRemainCount];
}
- (void)updateRemainCount {
    
    long count = MAX(0, (int)(self.text.length));
    if(count > _maxLength) {
        self.text = [self.text substringToIndex:_maxLength];
        count = _maxLength;
    }
    self.placeholderLabel.hidden = (count > 0)?YES:NO;
    if(count <= 0) {
        [self configContentEdgeInsets];
    }
    if(self.contentLengthBLock) {
        self.contentLengthBLock(self, count);
    }
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
}

- (void)setInputLimitConditions:(WKInputLimitConditions)inputLimitConditions {
    _inputLimitConditions = inputLimitConditions;
}

- (void)setContentInset:(UIEdgeInsets)contentInset {
    [super setContentInset:contentInset];
    _currentContentInset = contentInset;
    [self configContentEdgeInsets];
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
}

- (void)setRoundedCornerRadius:(CGFloat)roundedCornerRadius {
    _roundedCornerRadius = roundedCornerRadius;
    self.layer.cornerRadius = _roundedCornerRadius;
}


- (UILabel *)placeholderLabel {
    if(!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] init];
        _placeholderLabel.font = _placeholderFont?:self.font;
        _placeholderLabel.textColor = _placeholderColor;
        _placeholderLabel.numberOfLines = 2;
    }
    return _placeholderLabel;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
