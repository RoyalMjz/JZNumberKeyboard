//
//  MainViewController.m
//  JZNumberKeyboard
//
//  Created by RoyalMjz on 15/11/28.
//  Copyright © 2015年 RoyalMjz. All rights reserved.
//

#import "MainViewController.h"
#import "JZNumberKeyboard.h"

@interface MainViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50, 100, 100, 44)];
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.delegate = self;
    _textField.keyboardType = UIKeyboardTypeDefault;
    
    JZNumberKeyboard *keyBoard = [[JZNumberKeyboard alloc] init];
    [keyBoard setInputView:_textField];
    
    [self.view addSubview:_textField];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
