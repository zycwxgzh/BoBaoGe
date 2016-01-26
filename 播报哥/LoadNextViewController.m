//
//  LoadNextViewController.m
//  播报哥
//
//  Created by DC015 on 16/1/19.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "LoadNextViewController.h"
#import "AFNetworking.h"
@interface LoadNextViewController ()
{
    int count;
    UIImageView *image;
}

@end

@implementation LoadNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    count = 0;
    [self layout];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)layout{


    _loadButton.layer.cornerRadius = 10;
    _loadButton.layer.borderWidth = 0.1;
    _loadButton.layer.borderColor = [UIColor grayColor].CGColor;
    _forgetButton.layer.cornerRadius = 10;
    _forgetButton.layer.borderWidth = 0.1;
    _forgetButton.layer.borderColor = [UIColor grayColor].CGColor;

    
}

- (IBAction)yes:(id)sender {
    
    //    勾选记住密码
    
    if (count == 0) {
        image = [[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 20, 20)];
        image.image = [UIImage imageNamed:@"ye"];
        image.hidden = NO;
        [sender addSubview:image];
        count = 1;
    }else if(count == 1){
        
        image.hidden = YES;
        count = 0;
        
    }
    
}

- (IBAction)load:(id)sender {
    NSLog(@"点击登录");
    //    点击登录后 先进行判断 判断账号密码正确后 方可跳转回主页面
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [Internet_URL stringByAppendingString:Login];
    NSDictionary *par = @{@"account" : _loadNumber.text,
                          @"password" : _loadPassword.text
                          };
    [manager GET:url parameters:par success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSLog(@"%@",errorCodeStr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        nil;
    }];
    
}

- (IBAction)back:(id)sender {
    
    //    返回按钮
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}
@end
