//
//  DetailViewController.m
//  播报哥
//
//  Created by DC-002 on 16/1/19.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
//    label.backgroundColor = [UIColor colorWithRed:0.2 green:0.4 blue:0.8 alpha:1];
    label.backgroundColor = [UIColor colorWithRed:0.250 green:0.757 blue:1.000 alpha:1.000];
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 80, 44)];
    [button setTitle:@"  详情" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    UILabel *sortLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 84, 50, 30)];
    sortLabel.font = [UIFont systemFontOfSize:16];
    sortLabel.text = [userDefault valueForKey:@"sort"];
    [self.view addSubview:sortLabel];
    
    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 84, 50, 30)];
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.text = [userDefault valueForKey:@"time"];
    [self.view addSubview:timeLabel];
    
    UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 134, 200, 30)];
    addressLabel.font = [UIFont systemFontOfSize:12];
    addressLabel.text = [userDefault valueForKey:@"address"];
    [self.view addSubview:addressLabel];
    
    UILabel *descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 184, self.view.frame.size.width, 30)];
    descriptionLabel.font = [UIFont systemFontOfSize:14];
    descriptionLabel.text = [userDefault valueForKey:@"description"];
    [self.view addSubview:descriptionLabel];

    UIButton *callButton = [[UIButton alloc]initWithFrame:CGRectMake(230, 74, 100, 40)];
    [callButton setTitle:@"马上拨打" forState:UIControlStateNormal];
    [callButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    callButton.titleLabel.font = [UIFont systemFontOfSize:16];
    
    [callButton setImage:[UIImage imageNamed:@"call"] forState:UIControlStateNormal];
    [callButton addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:callButton];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 224, 100, 80)];
    NSData *data = [userDefault valueForKey:@"image"];
    imageView.image = [UIImage imageWithData:data];
    [self.view addSubview:imageView];
    
    UIButton *likeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 324, self.view.frame.size.width/2-1, 30)];
    likeButton.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [likeButton setTitle:@"  赞" forState:UIControlStateNormal];
    [likeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    likeButton.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [likeButton setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    [likeButton addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:likeButton];
    
    UIButton *shareButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+1, 324, self.view.frame.size.width/2, 30)];
    shareButton.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [shareButton setTitle:@"  分享" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareButton.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [shareButton setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareButton];
    
    UILabel *commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 374, self.view.frame.size.width, 30)];
    commentLabel.text = @"          0条评论";
    commentLabel.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    commentLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:commentLabel];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 380, 20, 20)];
    image.image = [UIImage imageNamed:@"comment"];
    [self.view addSubview:image];

    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 420, 355, 50)];
    textFiled.placeholder = @"回复楼主:";
    textFiled.borderStyle = UITextBorderStyleNone;
    textFiled.textColor = [UIColor blackColor];
    [self.view addSubview:textFiled];
    
    View *myView = [[View alloc]initWithFrame:CGRectMake(10, 455, 355, 2)];;
    myView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    
    [self.view addSubview:myView];
    
    UIButton *sendButton = [[UIButton alloc]initWithFrame:CGRectMake(300, 467, 50, 50)];
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sendButton.backgroundColor = [UIColor colorWithRed:0.250 green:0.757 blue:1.000 alpha:1.000];
    sendButton.layer.cornerRadius = 15;
    sendButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:sendButton];
    
}


-(void)call
{
    //点击拨打电话跳转界面
    NSLog(@"跳转界面");
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
