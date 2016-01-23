//
//  ForgetPasswordViewController.m
//  播报哥
//
//  Created by DC015 on 16/1/21.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "PasswordNextViewController.h"

@interface ForgetPasswordViewController ()

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self layout];
}


-(void)layout{
    
    _sendButton.layer.cornerRadius = 10;
    _sendButton.layer.borderWidth = 0.1;
    _sendButton.layer.borderColor = [UIColor grayColor].CGColor;
    _receive.layer.cornerRadius = 10;
    _receive.layer.borderWidth = 0.1;
    _receive.layer.borderColor = [UIColor grayColor].CGColor;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)backButton:(id)sender {
//    点击返回按钮
    [self dismissViewControllerAnimated:NO completion:nil];
    
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}

- (IBAction)sendButtton:(id)sender {
    
//    判断短信验证码是否验证成功 验证成功跳转修改密码页面 不成功则弹出警告框
    NSString *checkNumber = @"123456";
    if ([_checkNumber.text isEqualToString:checkNumber]) {
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        PasswordNextViewController *passNext = [storyBoard instantiateViewControllerWithIdentifier:@"passNext"];
        [self presentViewController:passNext animated:NO completion:nil];
        
    }else{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证码输入错误！" message:@"请重新输入或重新获取验证码" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    
        
    }
    
}
@end
