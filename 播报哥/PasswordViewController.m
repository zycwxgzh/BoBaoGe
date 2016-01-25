//
//  PasswordViewController.m
//  播报哥
//
//  Created by DC015 on 16/1/20.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "PasswordViewController.h"

@interface PasswordViewController ()

@end

@implementation PasswordViewController

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

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}


- (IBAction)sendButton:(id)sender {
}
- (IBAction)back:(id)sender {
    
//    返回按钮
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    
}
@end
