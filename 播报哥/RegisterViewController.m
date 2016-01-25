//
//  RegisterViewController.m
//  播报哥
//
//  Created by DC015 on 16/1/19.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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

-(UIStatusBarStyle)preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;
}

- (IBAction)receive:(id)sender {
    
//    点击获取手机验证码
}

- (IBAction)Register:(id)sender {
//    点击登录按钮 判断账号无误后可跳转至登陆页面进行登录
    
    
}


- (IBAction)save:(id)sender {
    
//    点击浏览《播报哥使用条款与隐私政策》
    
}

- (IBAction)back:(id)sender {
    
    
    //    返回按钮
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
