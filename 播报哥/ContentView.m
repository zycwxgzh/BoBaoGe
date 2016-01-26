//
//  ContentView.m
//  播报哥
//
//  Created by DC-002 on 16/1/25.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "ContentView.h"
#import <ShareSDK/ShareSDK.h>

@implementation ContentView
{
    NSMutableArray *_muArray;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layOut];
    }
    return self;
}

//-(void)drawRect:(CGRect)rect
//{
//    [self layOut];
//   
//}

-(void)layOut
{
    _muArray = [NSMutableArray array];
    
    
    //分类标签
    _sortLabel = [[UILabel alloc]init];
    _sortLabel.font = [UIFont systemFontOfSize:16];
    //_sortLabel.backgroundColor = [UIColor redColor];
    
    //时间标签
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor colorWithWhite:0.4 alpha:1];
    
    //地址标签
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.font = [UIFont systemFontOfSize:12];
    _addressLabel.textColor = [UIColor colorWithWhite:0.4 alpha:1];
    
    //描述信息标签
    _descriptionLabel = [[UILabel alloc]init];
    _descriptionLabel.font = [UIFont systemFontOfSize:16];
    _descriptionLabel.numberOfLines = 0;
    _descriptionLabel.textColor = [UIColor colorWithWhite:0.4 alpha:1];
    
    _likeLabel = [[UILabel alloc]init];
    _likeLabel.text = @"赞";
    _likeLabel.font = [UIFont systemFontOfSize:15];
    
    _likeCountLabel = [[UILabel alloc]init];
    _likeCountLabel.text = @"0";
    _likeCountLabel.font = [UIFont systemFontOfSize:14];
    
    //评论标签
    _commentLabel = [[UILabel alloc]init];
    _commentLabel.text = @"              0条评论";
    _commentLabel.font = [UIFont systemFontOfSize:13];
    _commentLabel.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1];
    
    
    //评论标签上的图标
    _image = [[UIImageView alloc]init];
    _image.image = [UIImage imageNamed:@"评论"];
   
    
    //评论输入框
    _textFiled = [[UITextField alloc]init];
    _textFiled.placeholder = @"回复楼主:";
    _textFiled.borderStyle = UITextBorderStyleNone;
    _textFiled.textColor = [UIColor blackColor];
   
    
    //
    _view = [[UIView alloc]init];
    _view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    
    
    //发送评论按钮
    _sendButton = [[UIButton alloc]init];
    [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [_sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _sendButton.backgroundColor = [UIColor colorWithRed:1.000 green:0.201 blue:0.085 alpha:1.000];
    _sendButton.layer.cornerRadius = 10;
    _sendButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_sendButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    _sendButton.tag = 3;
    
    
    
    
    //打电话按钮
    _callButton = [[UIButton alloc]init];
    [_callButton setTitle:@"  马上拨打" forState:UIControlStateNormal];
    [_callButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _callButton.titleLabel.font = [UIFont systemFontOfSize:16];
    _callButton.tag = 0;
    [_callButton setImage:[UIImage imageNamed:@"马上拨打"] forState:UIControlStateNormal];
    [_callButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    //点赞按钮
    _likeButton = [[UIButton alloc]init];
   // [_likeButton setTitle:@"  赞" forState:UIControlStateNormal];
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
    [self addSubview:_picture1];
    [self addSubview:_callButton];
    [self addSubview:_likeButton];
    [self addSubview:_shareButton];
    [self addSubview:_commentLabel];
    [self addSubview:_image];
    [self addSubview:_textFiled];
    [self addSubview:_view];
    [self addSubview:_sendButton];
    [self addSubview:_likeCountLabel];
    [self addSubview:_likeLabel];

}

-(void)setModel:(Model *)model
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    _sortLabel.text = [userDefault valueForKey:@"sort"];
    _timeLabel.text = [userDefault valueForKey:@"time"];
    _addressLabel.text = [userDefault valueForKey:@"address"];
    _descriptionLabel.text = [userDefault valueForKey:@"description"];
    _model = model;
    //1.分类标签
    CGSize sizeOfSort = [_sortLabel.text boundingRectWithSize:CGSizeMake(335,
                                                                    MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
    
    _sortLabel.frame = CGRectMake(10 , 10, sizeOfSort.width, sizeOfSort.height);
    
    //2.时间标签
    CGSize sizeOfTime = [_timeLabel.text boundingRectWithSize:CGSizeMake(335, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    
    _timeLabel.frame = CGRectMake(_sortLabel.frame.origin.x + _sortLabel.frame.size.width , 13, sizeOfTime.width, sizeOfTime.height);
    
    //3.地址标签
    CGSize sizeOfAddress= [_addressLabel.text boundingRectWithSize:CGSizeMake(335, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    
    _addressLabel.frame = CGRectMake(20, _sortLabel.frame.origin.y + _sortLabel.frame.size.height , sizeOfAddress.width, sizeOfAddress.height);
    
    //4.信息描述标签
    CGSize sizeOfDescription= [ _descriptionLabel.text boundingRectWithSize:CGSizeMake(355, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
    //NSLog(@"====%f",sizeOfDescription.width);
    _descriptionLabel.frame = CGRectMake(20, _addressLabel.frame.origin.y + _addressLabel.frame.size.height + 10, sizeOfDescription.width, sizeOfDescription.height);
    
    //5.图片
    //图片
    _picture1 = [[UIImageView alloc]init];
    
    [_muArray addObject:_picture1];
    _picture1 = nil;
    
    float distance = (self.frame.size.width - 115 * 3)/4.0;//图片间距
    
    //图片布局
    if ( ( _muArray.count == 1 || _muArray.count == 2 || _muArray.count == 3) ) {
        for (int i = 0; i < model.picture.count; i++) {
            _picture1 = [[UIImageView alloc]init];
            _picture1.image = [UIImage imageNamed:@""];
            _picture1.frame = CGRectMake((distance+115)*i+distance , _descriptionLabel.frame.origin.y + _descriptionLabel.frame.size.height + 20, 115, 115);
            
        }
//        _likeButton.frame = CGRectMake(0, _picture1.frame.origin.y + _picture1.frame.size.height + 10, 115, 30);
        _likeButton.frame = CGRectMake(0, 200, 115, 30);
        
    }
    else if ( (_muArray.count == 4 || _muArray.count == 5 || _muArray.count == 6 )) {
        int a = 0;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 3; j++) {
                _picture1 = [[UIImageView alloc]init];
                _picture1.image = [UIImage imageNamed:@""];
                _picture1.frame = CGRectMake((distance+115)*j+distance , _descriptionLabel.frame.origin.y + _descriptionLabel.frame.size.height + 20 + (distance+115)*i+distance, 115, 115);
                               a++;
                if (a >= [_muArray count]) {
                    break;
                }
            }
        }
//        _likeButton.frame = CGRectMake(0, _picture1.frame.origin.y + _picture1.frame.size.height + 10, 115, 30);
         _likeButton.frame = CGRectMake(0, 200, 115, 30);
       
    }
    else if ((_muArray.count == 7 || _muArray.count == 8 || _muArray.count == 9 )) {
        int a = 0;
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                _picture1 = [[UIImageView alloc]init];
                _picture1.image = [UIImage imageNamed:@""];
                _picture1.frame = CGRectMake((distance+115)*j+distance , _descriptionLabel.frame.origin.y + _descriptionLabel.frame.size.height + 20 + (distance+115)*i+distance, 115, 115);
                               a++;
                if (a >= [_muArray count]) {
                    break;
                }
            }
        }
        
//        _likeButton.frame = CGRectMake(0, _picture1.frame.origin.y + _picture1.frame.size.height + 10, 115, 30);
        _likeButton.frame = CGRectMake(0, 200, 80, 30);
    }
    else if (_muArray.count == 0) {
        
//        _likeButton.frame = CGRectMake(0, _picture1.frame.origin.y + _picture1.frame.size.height + 10, 115, 30);
        _likeButton.frame = CGRectMake(0, 200, 115, 30);
    }

    _likeCountLabel.frame = CGRectMake(_likeButton.frame.origin.x + _likeButton.frame.size.width-30, 202, 30, 30);
    
    _likeLabel.frame = CGRectMake(_likeCountLabel.frame.origin.x + _likeCountLabel.frame.size.width - 10, 202, 30, 30);
    
    
    //6.拨打电话按钮
    _callButton.frame = CGRectMake(_timeLabel.frame.origin.x + _timeLabel.frame.size.width  + 120, 10, 100,40);
    
   
    
    //7.点赞按钮
//    _likeButton.frame = CGRectMake(0, _picture1.frame.origin.y + _picture1.frame.size.height + 10, 115, 30);
    
    //8.分享按钮
//    _shareButton.frame = CGRectMake(_likeButton.frame.origin.x + _likeButton.frame.size.width + 80, _picture1.frame.origin.y + _picture1.frame.size.height + 10, 115, 30);
    
    _shareButton.frame = CGRectMake(_likeButton.frame.origin.x + _likeButton.frame.size.width + 80, 200 , 115, 30);
    
    //9.评论标签
    _commentLabel.frame = CGRectMake(0, _likeButton.frame.origin.y + _likeButton.frame.size.height + 40, self.frame.size.width, 30);
    //
    _image.frame = CGRectMake(20, _likeButton.frame.origin.y + _likeButton.frame.size.height+ 45, 20, 20);
    
    //输入框
    _textFiled.frame = CGRectMake(10, _commentLabel.frame.origin.y + _commentLabel.frame.size.height + 13, 355, 50);
    
    _view.frame = CGRectMake(10, _textFiled.frame.origin.y + 2 + _textFiled.frame.size.height-13, 355, 2);
    
    //评论按钮
    _sendButton.frame = CGRectMake(310, _view.frame.origin.y + _view.frame.size.height + 10, 40, 40);
    
    
}

-(void)click:(UIButton *)sender
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *state = [user valueForKey:@"state"];
    
    ///未登录状态下都跳转到登录注册界面
    if ([state isEqualToString:@""]) {
        if ([self.delegate respondsToSelector:@selector(NotLoginClicked:)]) {
            [self.delegate NotLoginClicked:self];
        }    }
    
    //登录状态下点击拨打电话按钮
    else if(sender.tag == 0)
    {
     if ([self.delegate respondsToSelector:@selector(CallPhoneClicked:)]) {
            [self.delegate CallPhoneClicked:self];
        }    }
    
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
//

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
