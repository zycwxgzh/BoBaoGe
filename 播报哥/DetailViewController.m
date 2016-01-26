//
//  DetailViewController.m
//  播报哥
//
//  Created by DC-002 on 16/1/19.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "DetailViewController.h"
#import <ShareSDK/ShareSDK.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    label.backgroundColor = [UIColor colorWithRed:255/255.0 green:59/255.0 blue:10/255.0 alpha:1.000];
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 80, 44)];
    [button setTitle:@"  详情" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    _contentView = [[ContentView alloc]initWithFrame:CGRectMake(0, 10, 375, 600)];
    [_contentView setModel:_model];
    _contentView.backgroundColor = [UIColor whiteColor];
       _contentView.delegate = self;
    
    
    _scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, 375, 600)];
    _scrollerView.contentSize = CGSizeMake(0, 1.2 * _contentView.frame.size.height);
    [self.view addSubview:_scrollerView];
    [_scrollerView addSubview:_contentView];

    
    
    
}


//代理的跳转方法
-(void)NotLoginClicked:(ContentView *)contentView
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    _loadViewController = [storyBoard instantiateViewControllerWithIdentifier:@"loadVC"];
    [self presentViewController:_loadViewController animated:YES completion:nil];
}

-(void)CallPhoneClicked:(ContentView *)contentView
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"消息提醒" message:@"是否拨打电话?" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)back
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
