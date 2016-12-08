//
//  JZNumberKeyboard.m
//  JZNumberKeyboard
//
//  Created by RoyalMjz on 15/4/1.
//  Copyright © 2015年 RoyalMjz. All rights reserved.
//

#import "JZNumberKeyboard.h"

static CGFloat const marginvalue = 0.5;

@interface JZNumberKeyboard ()
{
    
    id inputView;
}

@end

@implementation JZNumberKeyboard

/**
 *  初始化
 */
- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3);
        
        self.backgroundColor = [UIColor lightGrayColor];
        
        [self setUpViews];
    }
    return self;
}


/**
 *  初始化界面
 */
-(void)setUpViews{
    
    
    for (int i = 0; i<=13; i++) {
        
        UIButton *btn = [[UIButton alloc] init];
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        if (i<=12) {
            
            [btn setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
            [btn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:186.0/255 green:189.0/255 blue:194.0/255 alpha:1.0]] forState:UIControlStateHighlighted];
        }
        else{
            
            [btn setBackgroundColor:[UIColor blueColor]];
            [btn setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateHighlighted];
        }
        
        NSString *titleStr;
        switch (i) {
                case 13:
                    titleStr = @"确定";
                
                    [btn setTitle:titleStr forState:UIControlStateNormal];
                    [btn addTarget:self action:@selector(finishBtnAction) forControlEvents:UIControlEventTouchUpInside];
                    break;
                
                case 12:{
                    UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - (5*0.5))/4/2-13, (self.frame.size.height - (5*0.5))/2/2-9, 26, 19)];
                    arrow.image = [UIImage imageNamed:@"JZNumberKeyboard.bundle/image/delete.png"];
                    [btn addSubview:arrow];
                    
                    [btn addTarget:self action:@selector(deleteBtnAction) forControlEvents:UIControlEventTouchUpInside];
                    [btn addGestureRecognizer:[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longpressGesture)]];
                    
                    break;
                }
                
            case 11:{
                UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - (5*0.5))/4/2-16, (self.frame.size.height - (5*0.5))/4/2-12, 33, 24)];
                arrow.image = [UIImage imageNamed:@"JZNumberKeyboard.bundle/image/resign.png"];
                [btn addSubview:arrow];
                
                [btn addTarget:self action:@selector(finishBtnAction) forControlEvents:UIControlEventTouchUpInside];
                
                break;
            }
            case 10:
                titleStr = @"0";
                [btn setTitle: titleStr forState:UIControlStateNormal];
                
                [btn addTarget:self action:@selector(numberBtnAction:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 9:
                titleStr = @".";
                [btn setTitle: titleStr forState:UIControlStateNormal];
                [ btn addTarget:self action:@selector(numberBtnAction:) forControlEvents:UIControlEventTouchUpInside];
                break;
            default:
                [ btn addTarget:self action:@selector(numberBtnAction:) forControlEvents:UIControlEventTouchUpInside];
                
                break;
        }
        
        if (i < 9) {
            [btn setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        }
        
        CGFloat width = self.frame.size.width/4*3;
        CGFloat btnW;
        CGFloat btnH;
        CGFloat btnX;
        CGFloat btnY;
        
        if (i>=12) {
            btnX = width + marginvalue;
            btnY = ((i-12)%2) * (self.frame.size.height/2.0 + marginvalue)+marginvalue;
            btnW = self.frame.size.width/4;
            btnH = (self.frame.size.height - marginvalue)/2.0;
        }
        else{
            btnX = (i%3) * ((width - 2*marginvalue)/3+marginvalue);
            btnY = (i/3) * (self.frame.size.height/4.0 + marginvalue)+marginvalue;
            btnW = (width - 2*marginvalue)/3;
            btnH = self.frame.size.height/4.0;
            
        }
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        [self addSubview:btn];
    }
}

#pragma mark - Action

//完成
-(void)finishBtnAction{

    [inputView endEditing:YES];
}

//删除
-(void)deleteBtnAction{
    
    if ([inputView isFirstResponder]) {
        
        [inputView deleteBackward];
    }
}

//输入
-(void)numberBtnAction:(UIButton *)btn{
    
    if ([inputView isFirstResponder]) {
        
        [inputView insertText:btn.titleLabel.text];
    }
}

//长按删除
-(void)longpressGesture{
    
    [inputView setText:nil];
}

#pragma mark - get set
- (void)setInputView:(UIView *)view{
    
    if ([view isKindOfClass:[UITextField class]]) {
        UITextField *m =  (UITextField *)  view;
        m.inputView  = self;
    
    }
    if ([view isKindOfClass:[UITextView class]]) {
        UITextView *m =  (UITextView *)  view;
        m.inputView  = self;
    }
    inputView = view;
}


#pragma mark - private method
- (UIImage *)imageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
