//
//  InformationViewController.m
//  播报哥
//
//  Created by DC015 on 16/1/20.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

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

- (IBAction)sendButton:(id)sender {
    //    提交按钮
}

- (IBAction)backButton:(id)sender {
    //    返回按钮
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}
@end
