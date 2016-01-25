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
    
    [self layOut];
    
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    UILabel *sortLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 84, 100, 30)];
//    sortLabel.font = [UIFont systemFontOfSize:16];
//    sortLabel.text = [userDefault valueForKey:@"sort"];
//    [self.view addSubview:sortLabel];
//    
//    UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(sortLabel.frame.origin.x + sortLabel.frame.size.width, 84, 50, 30)];
//    timeLabel.font = [UIFont systemFontOfSize:12];
//    timeLabel.text = [userDefault valueForKey:@"time"];
//    [self.view addSubview:timeLabel];
//    
//    UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 134, 200, 30)];
//    addressLabel.font = [UIFont systemFontOfSize:12];
//    addressLabel.text = [userDefault valueForKey:@"address"];
//    [self.view addSubview:addressLabel];
//    
//    UILabel *descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 164, self.view.frame.size.width, 50)];
//    descriptionLabel.font = [UIFont systemFontOfSize:14];
//    descriptionLabel.numberOfLines = 0;
//    descriptionLabel.text = [userDefault valueForKey:@"description"];
//    
//    [self.view addSubview:descriptionLabel];
//    
//    //拨打电话按钮
//    UIButton *callButton = [[UIButton alloc]initWithFrame:CGRectMake(230, 82, 100, 30)];
//    [callButton setTitle:@"  马上拨打" forState:UIControlStateNormal];
//    [callButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    callButton.titleLabel.font = [UIFont systemFontOfSize:16];
//    
//    [callButton setImage:[UIImage imageNamed:@"马上拨打"] forState:UIControlStateNormal];
//    [callButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    callButton.tag = 0;
//    [self.view addSubview:callButton];
//    
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 224, 100, 80)];
//    NSData *data = [userDefault valueForKey:@"image"];
//    imageView.image = [UIImage imageWithData:data];
//    [self.view addSubview:imageView];
//    
//    //点赞按钮
//    UIButton *likeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 324, self.view.frame.size.width/2-1, 30)];
//    likeButton.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
//    [likeButton setTitle:@"  赞" forState:UIControlStateNormal];
//    [likeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    likeButton.titleLabel.font = [UIFont systemFontOfSize:13];
//    
//    [likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
//    [likeButton setImage:[UIImage imageNamed:@"点赞后"] forState:UIControlStateSelected];
//    [likeButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    likeButton.tag = 1;
//    [self.view addSubview:likeButton];
//    
//    //分享按钮
//    UIButton *shareButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2+1, 324, self.view.frame.size.width/2, 30)];
//    shareButton.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
//    [shareButton setTitle:@"  分享" forState:UIControlStateNormal];
//    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    shareButton.titleLabel.font = [UIFont systemFontOfSize:13];
//    
//    [shareButton setImage:[UIImage imageNamed:@"分享"] forState:UIControlStateNormal];
//    [shareButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    shareButton.tag = 2;
//    [self.view addSubview:shareButton];
//    
//    //评论标签
//    UILabel *commentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 374, self.view.frame.size.width, 30)];
//    commentLabel.text = @"          0条评论";
//    commentLabel.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
//    commentLabel.font = [UIFont systemFontOfSize:13];
//    [self.view addSubview:commentLabel];
//    
//    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 380, 20, 20)];
//    image.image = [UIImage imageNamed:@"评论"];
//    [self.view addSubview:image];
//    
//    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 420, 355, 50)];
//    textFiled.placeholder = @"回复楼主:";
//    textFiled.borderStyle = UITextBorderStyleNone;
//    textFiled.textColor = [UIColor blackColor];
//    [self.view addSubview:textFiled];
//    
//    View *myView = [[View alloc]initWithFrame:CGRectMake(10, 455, 355, 2)];;
//    myView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
//    
//    [self.view addSubview:myView];
//    
//    //发送评论按钮
//    UIButton *sendButton = [[UIButton alloc]initWithFrame:CGRectMake(310, 467, 40, 40)];
//    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
//    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    sendButton.backgroundColor = [UIColor colorWithRed:88/255.0 green:198/255.0 blue:26/255.0 alpha:1.000];
//    sendButton.layer.cornerRadius = 10;
//    sendButton.titleLabel.font = [UIFont systemFontOfSize:15];
//    [sendButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    sendButton.tag = 3;
//    [self.view addSubview:sendButton];
    
    [self setModel:_model];
    
}



-(void)layOut
{
    //分类标签
    _sortLabel = [[UILabel alloc]init];
    _sortLabel.font = [UIFont systemFontOfSize:16];
    //_sortLabel.backgroundColor = [UIColor redColor];
    
    //时间标签
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    
    //地址标签
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.font = [UIFont systemFontOfSize:12];
    
    //描述信息标签
    _descriptionLabel = [[UILabel alloc]init];
    _descriptionLabel.font = [UIFont systemFontOfSize:16];
    _descriptionLabel.numberOfLines = 0;
    
    //打电话按钮
    _callButton = [[UIButton alloc]init];
    [_callButton setTitle:@"  马上拨打" forState:UIControlStateNormal];
    [_callButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _callButton.titleLabel.font = [UIFont systemFontOfSize:14];
    _callButton.tag = 0;
    [_callButton setImage:[UIImage imageNamed:@"马上拨打"] forState:UIControlStateNormal];
    [_callButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    //点赞按钮
    _likeButton = [[UIButton alloc]init];
    [_likeButton setTitle:@"  赞" forState:UIControlStateNormal];
    [_likeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _likeButton.titleLabel.font = [UIFont systemFontOfSize:13];
    _likeButton.tag = 1;
    [_likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
    [_likeButton setImage:[UIImage imageNamed:@"点赞后"] forState:UIControlStateSelected];
    [_likeButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    //分享按钮
    _shareButton = [[UIButton alloc]init];
    [_shareButton setTitle:@"  分享" forState:UIControlStateNormal];
    [_shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _shareButton.titleLabel.font = [UIFont systemFontOfSize:13];
    _shareButton.tag = 2;
    [_shareButton setImage:[UIImage imageNamed:@"分享"] forState:UIControlStateNormal];
    [_shareButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_sortLabel];
    [self.view addSubview:_timeLabel];
    [self.view addSubview:_addressLabel];
    [self.view addSubview:_descriptionLabel];
    [self.view addSubview:_callButton];
    [self.view addSubview:_likeButton];
    [self.view addSubview:_shareButton];
    
    
}


-(void)setModel:(Model *)model 
{
    _model = model;
    //1.分类标签
    CGSize sizeOfSort = [model.sort boundingRectWithSize:CGSizeMake(335,
                                                                    MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
    
    _sortLabel.frame = CGRectMake(20 , 74, sizeOfSort.width, sizeOfSort.height);
    
    //2.时间标签
    CGSize sizeOfTime = [model.time boundingRectWithSize:CGSizeMake(335, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    
    _timeLabel.frame = CGRectMake(_sortLabel.frame.origin.x + _sortLabel.frame.size.width + 5, 72, sizeOfTime.width, sizeOfTime.height);
    
    //3.地址标签
    CGSize sizeOfAddress= [model.address boundingRectWithSize:CGSizeMake(335, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    
    _addressLabel.frame = CGRectMake(20, _sortLabel.frame.origin.y + _sortLabel.frame.size.height + 10, sizeOfAddress.width, sizeOfAddress.height);
    
    //4.信息描述标签
    CGSize sizeOfDescription= [model.description1 boundingRectWithSize:CGSizeMake(355, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
    //NSLog(@"====%f",sizeOfDescription.width);
    _descriptionLabel.frame = CGRectMake(20, _addressLabel.frame.origin.y + _addressLabel.frame.size.height + 10, sizeOfDescription.width, sizeOfDescription.height);
    
    //6.拨打电话按钮
    _callButton.frame = CGRectMake(250, 73, 100,30);
    
//    //7.点赞按钮
//    _likeButton.frame = CGRectMake(0, _scanLabel.frame.origin.y + _scanLabel.frame.size.height + 10, 115, 30);
//    
//    //8.分享按钮
//    _shareButton.frame = CGRectMake(_likeButton.frame.origin.x + _likeButton.frame.size.width, _scanLabel.frame.origin.y + _scanLabel.frame.size.height + 10, 115, 30);
    
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    _sortLabel.text = [userDefault valueForKey:@"sort"];
    _timeLabel.text = [userDefault valueForKey:@"time"];
    _addressLabel.text = [userDefault valueForKey:@"address"];
    _descriptionLabel.text = [userDefault valueForKey:@"description"];
    
}




-(void)click:(UIButton *)sender
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *state = [user valueForKey:@"state"];
    
    ///未登录状态下都跳转到登录注册界面
    if ([state isEqualToString:@""]) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        _loadViewController = [storyBoard instantiateViewControllerWithIdentifier:@"loadVC"];
        [self presentViewController:_loadViewController animated:YES completion:nil];
        
    }
    
    //登录状态下点击拨打电话按钮
    else if(sender.tag == 0)
    {
        NSLog(@"拨打电话");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"消息提醒" message:@"是否拨打电话?" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    //登录状态下点击点赞按钮
    else if(sender.tag == 1)
    {
        NSLog(@"点赞");
        sender.selected =! sender.selected;
    }
    //登录状态下点击分享按钮
    else if(sender.tag == 2)
    {
        NSLog(@"分享");
        NSLog(@"分享");
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK" ofType:@"png"];
        
        //构造分享内容
        id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                           defaultContent:@"测试一下"
                                                    image:[ShareSDK imageWithPath:imagePath]
                                                    title:@"ShareSDK"
                                                      url:@"http://www.mob.com"
                                              description:@"这是一条测试信息"
                                                mediaType:SSPublishContentMediaTypeNews];
        //创建弹出菜单容器
        id<ISSContainer> container = [ShareSDK container];
        [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
        
        //弹出分享菜单
        [ShareSDK showShareActionSheet:container
                             shareList:nil
                               content:publishContent
                         statusBarTips:YES
                           authOptions:nil
                          shareOptions:nil
                                result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                    
                                    if (state == SSResponseStateSuccess)
                                    {
                                        NSLog(@"分享成功");
                                    }
                                    else if (state == SSResponseStateFail)
                                    {
                                        NSLog(@"分享失败,错误码:%ld,错误描述:%@", [error errorCode], [error errorDescription]);
                                    }
                                }];

    }
    //登录状态下点击发送评论按钮
    else if(sender.tag == 3)
    {
        NSLog(@"评论");
    }
    
    
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
