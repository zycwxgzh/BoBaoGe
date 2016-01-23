//
//  PasswordNextViewController.m
//  播报哥
//
//  Created by DC015 on 16/1/22.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "PasswordNextViewController.h"
#import "LoadViewController.h"

@interface PasswordNextViewController ()

@end

@implementation PasswordNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self layout];
}

-(void)layout{

    _sendButton.layer.cornerRadius = 10;
    _sendButton.layer.borderWidth = 0.1;
    _sendButton.layer.borderColor = [UIColor grayColor].CGColor;

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

- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)sendButton:(id)sender {
    
//    判断密码格式是否输入正确 重新输入是否与新密码一致 输入正确返回登录页面 输入错误弹出提示框提醒用户重新输入
    
    //    正则表达式 密码 请输入6-16位密码（密码只能是字母数字或下划线组成）
    NSString *password = _theNewPassword.text;
    NSString *thePredicatePass = @"^\\w{6,16}$";
    NSPredicate *prePass = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",thePredicatePass];
 

    
    if(_theNewPassword.text == nil){
    
    
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"密码不能为空" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if(![prePass evaluateWithObject:password]){
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"密码格式错误" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if([prePass evaluateWithObject:password]){
        
        
        if ([_checkThePassword.text isEqualToString:_theNewPassword.text]) {
            
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            LoadViewController *load = [storyBoard instantiateViewControllerWithIdentifier:@"loadVC"];
            [self presentViewController:load animated:YES completion:nil];
            
        }else{
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"两次密码输入不同！" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }


    
}
@end
