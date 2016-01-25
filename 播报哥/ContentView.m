//
//  ContentView.m
//  播报哥
//
//  Created by DC-002 on 16/1/25.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "ContentView.h"

@implementation ContentView

-(void)drawRect:(CGRect)rect
{
    [self layOut];
   
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
    
    [self addSubview:_sortLabel];
    [self addSubview:_timeLabel];
    [self addSubview:_addressLabel];
    [self addSubview:_descriptionLabel];
    [self addSubview:_callButton];
    [self addSubview:_likeButton];
    [self addSubview:_shareButton];

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

//-(void)click:(UIButton *)sender
//{
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    NSString *state = [user valueForKey:@"state"];
//    
//    ///未登录状态下都跳转到登录注册界面
//    if ([state isEqualToString:@""]) {
//        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//        _loadViewController = [storyBoard instantiateViewControllerWithIdentifier:@"loadVC"];
//        [self presentViewController:_loadViewController animated:YES completion:nil];
//        
//    }
//    
//    //登录状态下点击拨打电话按钮
//    else if(sender.tag == 0)
//    {
//        NSLog(@"拨打电话");
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"消息提醒" message:@"是否拨打电话?" preferredStyle:UIAlertControllerStyleAlert];
//        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
//        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
//        [self presentViewController:alert animated:YES completion:nil];
//    }
//    //登录状态下点击点赞按钮
//    else if(sender.tag == 1)
//    {
//        NSLog(@"点赞");
//        sender.selected =! sender.selected;
//    }
//    //登录状态下点击分享按钮
//    else if(sender.tag == 2)
//    {
//        NSLog(@"分享");
//        NSLog(@"分享");
//        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK" ofType:@"png"];
//        
//        //构造分享内容
//        id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
//                                           defaultContent:@"测试一下"
//                                                    image:[ShareSDK imageWithPath:imagePath]
//                                                    title:@"ShareSDK"
//                                                      url:@"http://www.mob.com"
//                                              description:@"这是一条测试信息"
//                                                mediaType:SSPublishContentMediaTypeNews];
//        //创建弹出菜单容器
//        id<ISSContainer> container = [ShareSDK container];
//        [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
//        
//        //弹出分享菜单
//        [ShareSDK showShareActionSheet:container
//                             shareList:nil
//                               content:publishContent
//                         statusBarTips:YES
//                           authOptions:nil
//                          shareOptions:nil
//                                result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
//                                    
//                                    if (state == SSResponseStateSuccess)
//                                    {
//                                        NSLog(@"分享成功");
//                                    }
//                                    else if (state == SSResponseStateFail)
//                                    {
//                                        NSLog(@"分享失败,错误码:%ld,错误描述:%@", [error errorCode], [error errorDescription]);
//                                    }
//                                }];
//        
//    }
//    //登录状态下点击发送评论按钮
//    else if(sender.tag == 3)
//    {
//        NSLog(@"评论");
//    }
//    
//    
//}
//

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
