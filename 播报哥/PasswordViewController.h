//
//  PasswordViewController.h
//  播报哥
//
//  Created by DC015 on 16/1/20.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *originalPassword;//原密码


@property (weak, nonatomic) IBOutlet UITextField *setNewPassword;//新密码

@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;//确认密码
- (IBAction)sendButton:(id)sender;//提交
- (IBAction)back:(id)sender;//返回
@property (weak, nonatomic) IBOutlet UIButton *sendButton;


@end
