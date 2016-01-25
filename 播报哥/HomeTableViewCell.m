//
//  HomeTableViewCell.m
//  播报哥
//
//  Created by DC-002 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "HomeTableViewCell.h"
#import <ShareSDK/ShareSDK.h>

@implementation HomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

//重写UITableViewCell的方法
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, 375, 0);
        _imageArray = [NSMutableArray array];
        [self layOut];
    }
    return self;
}

-(void)layOut
{
    _sortLabel = [[UILabel alloc]init];
    _sortLabel.font = [UIFont systemFontOfSize:16];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.font = [UIFont systemFontOfSize:12];
    
    _descriptionLabel = [[UILabel alloc]init];
    _descriptionLabel.font = [UIFont systemFontOfSize:16];
    
    
    
    _scanLabel = [[UILabel alloc]init];
    _scanLabel.text = @"50人浏览";
    _scanLabel.font = [UIFont systemFontOfSize:14];
    
    _lineLabel = [[UILabel alloc]init];
    _lineLabel.backgroundColor = [UIColor colorWithWhite:0.903 alpha:1.000];
    
    _descriptionLabel.numberOfLines = 0;
    
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
    
    
    //评论按钮
    _commentButton = [[UIButton alloc]init];
    [_commentButton setTitle:@"  评论" forState:UIControlStateNormal];
    [_commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _commentButton.titleLabel.font = [UIFont systemFontOfSize:13];
    _commentButton.tag = 3;
    [_commentButton setImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
    [_commentButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_sortLabel];
    [self addSubview:_timeLabel];
    [self addSubview:_addressLabel];
    [self addSubview:_descriptionLabel];
    [self addSubview:_scanLabel];
    [self addSubview:_callButton];
    [self addSubview:_likeButton];
    [self addSubview:_shareButton];
    [self addSubview:_commentButton];
    [self addSubview:_lineLabel];
}
-(void)setModel:(Model *)model : (BOOL)draw
{
    _model = model;
    //1.分类标签
    CGSize sizeOfSort = [model.sort boundingRectWithSize:CGSizeMake(335, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
    
    _sortLabel.frame = CGRectMake(20 , 10, sizeOfSort.width, sizeOfSort.height);
    
    //2.时间标签
    CGSize sizeOfTime = [model.time boundingRectWithSize:CGSizeMake(335, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    
    _timeLabel.frame = CGRectMake(_sortLabel.frame.origin.x + _sortLabel.frame.size.width + 5, 12, sizeOfTime.width, sizeOfTime.height);
    
    //3.地址标签
    CGSize sizeOfAddress= [model.address boundingRectWithSize:CGSizeMake(335, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    
    _addressLabel.frame = CGRectMake(20, _sortLabel.frame.origin.y + _sortLabel.frame.size.height + 10, sizeOfAddress.width, sizeOfAddress.height);
    
    //4.信息描述标签
    CGSize sizeOfDescription= [model.description1 boundingRectWithSize:CGSizeMake(355, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
    //NSLog(@"====%f",sizeOfDescription.width);
    _descriptionLabel.frame = CGRectMake(20, _addressLabel.frame.origin.y + _addressLabel.frame.size.height + 10, sizeOfDescription.width, sizeOfDescription.height);
    
       
    _picture1 = nil;
    
    float distance = (self.frame.size.width - 115 * 3)/4.0;//图片间距
    
    //图片布局
    if ( ( model.picture.count == 1 || model.picture.count == 2 || model.picture.count == 3) ) {
        for (int i = 0; i < model.picture.count; i++) {
            _picture1 = [[UIImageView alloc]init];
            _picture1.image = [UIImage imageNamed:model.picture[i]];
            _picture1.frame = CGRectMake((distance+115)*i+distance , _descriptionLabel.frame.origin.y + _descriptionLabel.frame.size.height + 20, 115, 115);
            if (draw) {
                [_imageArray addObject:_picture1];
               // NSLog(@"%@", NSStringFromCGRect(_picture1.frame));
                [self.contentView addSubview:_picture1];
            }
            
        }
        _scanLabel.frame = CGRectMake(20, _picture1.frame.origin.y + _picture1.frame.size.height + 10, 100, 30);
    }
    else if ( (model.picture.count == 4 || model.picture.count == 5 || model.picture.count == 6 )) {
        int a = 0;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 3; j++) {
                _picture1 = [[UIImageView alloc]init];
                _picture1.image = [UIImage imageNamed:model.picture[a]];
                _picture1.frame = CGRectMake((distance+115)*j+distance , _descriptionLabel.frame.origin.y + _descriptionLabel.frame.size.height + 20 + (distance+115)*i+distance, 115, 115);
                if (draw) {
                    [_imageArray addObject:_picture1];
                   // NSLog(@"%@", NSStringFromCGRect(_picture1.frame));
                    [self.contentView addSubview:_picture1];
                }
                a++;
                if (a >= [model.picture count]) {
                    break;
                }
            }
        }
        _scanLabel.frame = CGRectMake(20, _picture1.frame.origin.y + _picture1.frame.size.height + 10, 100, 30);
    }
    else if ((model.picture.count == 7 || model.picture.count == 8 || model.picture.count == 9 )) {
        int a = 0;
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                _picture1 = [[UIImageView alloc]init];
                _picture1.image = [UIImage imageNamed:model.picture[a]];
                _picture1.frame = CGRectMake((distance+115)*j+distance , _descriptionLabel.frame.origin.y + _descriptionLabel.frame.size.height + 20 + (distance+115)*i+distance, 115, 115);
                if (draw) {
                    [_imageArray addObject:_picture1];
                   // NSLog(@"%@", NSStringFromCGRect(_picture1.frame));
                    [self.contentView addSubview:_picture1];
                }
                a++;
                if (a >= [model.picture count]) {
                    break;
                }
            }
        }
        
        
        _scanLabel.frame = CGRectMake(20, _picture1.frame.origin.y + _picture1.frame.size.height + 10, 100, 30);
    }
    else if (model.picture.count == 0) {
        _scanLabel.frame = CGRectMake(20, _descriptionLabel.frame.origin.y + _descriptionLabel.frame.size.height + 10, 100, 30);
    }
    
    //标签
    _lineLabel.frame = CGRectMake(0, _scanLabel.frame.origin.y + _scanLabel.frame.size.height, self.frame.size.width, 2);
    
    
    
    //6.拨打电话按钮
    _callButton.frame = CGRectMake(250, 3, 100,30);
    
    //7.点赞按钮
    _likeButton.frame = CGRectMake(0, _scanLabel.frame.origin.y + _scanLabel.frame.size.height + 10, 115, 30);
    
    //8.分享按钮
    _shareButton.frame = CGRectMake(_likeButton.frame.origin.x + _likeButton.frame.size.width, _scanLabel.frame.origin.y + _scanLabel.frame.size.height + 10, 115, 30);
    
    //9.评论按钮
    _commentButton.frame = CGRectMake(_shareButton.frame.origin.x + _shareButton.frame.size.width, _scanLabel.frame.origin.y + _scanLabel.frame.size.height + 10, 115, 30);
    
    
    
    _sortLabel.text = model.sort;
    _timeLabel.text = model.time;
    _addressLabel.text = model.address;
    _descriptionLabel.text = model.description1;
    
       _height = _likeButton.frame.origin.y + _likeButton.frame.size.height + 10;
    
 }

-(void)click:(UIButton *)sender
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *state = [user valueForKey:@"state"];
    
    ///未登录状态下都跳转到登录注册界面
    if ([state isEqualToString:@""]) {
        
        if ([self.delegate respondsToSelector:@selector(NotLoginClicked:)]) {
            [self.delegate NotLoginClicked:self];
        }
    }
    
    //登录状态下点击拨打电话按钮
    else if(sender.tag == 0)
    {
        NSLog(@"拨打电话");
        
        if ([self.delegate respondsToSelector:@selector(HomeTableViewCellCallPhoneClicked:) ]) {
            [self.delegate HomeTableViewCellCallPhoneClicked:self];
        }
    }
    //登录状态下点击拨打点赞按钮
    else if(sender.tag == 1)
    {
        NSLog(@"点赞");
        sender.selected =! sender.selected;
        
    }
    //登录状态下点击拨打分享按钮
    else if(sender.tag == 2)
    {
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
    //登录状态下点击拨打评论按钮
    else if(sender.tag == 3)
    {
        
        NSLog(@"评论");
        
        if ([self.delegate respondsToSelector:@selector(HomeTableViewCellCommentClicked:) ]) {
            [self.delegate HomeTableViewCellCommentClicked:self];
        }
        
    }
    
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
