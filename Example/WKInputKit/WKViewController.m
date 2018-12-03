//
//  WKViewController.m
//  WKInputKit
//
//  Created by objective on 11/30/2018.
//  Copyright (c) 2018 objective. All rights reserved.
//

#import "WKViewController.h"
#import "WKTextField.h"
#import "WKCheckTool.h"
#import "WKTextView.h"


@interface WKViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet WKTextField *testTF;
@property (weak, nonatomic) IBOutlet WKTextView *testTV;

@end

@implementation WKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.testTF.maxLength = 10;
    self.testTF.inputLimitConditions = WKInputAllowPunct | WKInputAllowEnglishAndNumber;
    self.testTV.contentInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.testTV.roundedCornerRadius = 5;
    self.testTV.borderWidth = 1;
    self.testTV.borderColor = [UIColor greenColor];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if([self.testTF isInputLimitConditionsOfContent:string textField:textField] || [string isEqualToString:@""]) {
        return YES;
    }
    return NO;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}



@end
