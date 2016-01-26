//
//  RegisterViewController.m
//  播报哥
//
//  Created by DC015 on 16/1/19.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "RegisterViewController.h"
#import "AFNetworking.h"
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
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [Internet_URL stringByAppendingString:SendMessage];
    NSDictionary *par = @{@"user_phone" : _phoneNumber.text,
                          @"validate_type" : @1
                          };
    [manager GET:url parameters:par success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSLog(@"%@",errorCodeStr);
        [self setCookie:url];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        nil;
    }];
}

- (IBAction)Register:(id)sender {
//    点击登录按钮 判断账号无误后可跳转至登陆页面进行登录
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [Internet_URL stringByAppendingString:Registerd];
    NSDictionary *par = @{@"user_phone" : _phoneNumber.text,
                          @"code" : _checkNumber.text,
                          @"user_password" : _firstPassword.text,
                          @"user_weixin" : _wechatNumber.text,
                          @"user_qq" : _qqNumber.text
                          };
    [self getCookie];
    [manager GET:url parameters:par success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSLog(@"%@",errorCodeStr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        nil;
    }];

    
}


- (IBAction)save:(id)sender {
    
//    点击浏览《播报哥使用条款与隐私政策》
    
}

- (IBAction)back:(id)sender {
    
    
    //    返回按钮
    [self dismissViewControllerAnimated:NO completion:nil];
}




#pragma mark SetCookie
- (void)setCookie : (NSString *)url
{
    
    NSArray *cookieArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:url]];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookieArray];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"UserCookie"];
}

#pragma mark GetCookie
- (void)getCookie
{
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserCookie"];
    if([cookiesdata length]) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        for (cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }
}
@end
