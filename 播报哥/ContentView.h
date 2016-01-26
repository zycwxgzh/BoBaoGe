//
//  ContentView.h
//  播报哥
//
//  Created by DC-002 on 16/1/25.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@class ContentView;
@protocol ContentViewDelegate <NSObject>

@optional

-(void) CallPhoneClicked:(ContentView *)contentView;
-(void) NotLoginClicked:(ContentView *)contentView;

@end

@interface ContentView : UIView<ContentViewDelegate>

@property(nonatomic,strong) id <ContentViewDelegate>delegate;

@property(nonatomic,strong) UILabel *sortLabel;
@property(nonatomic,strong) UILabel *timeLabel;
@property(nonatomic,strong) UILabel *addressLabel;
@property(nonatomic,strong) UILabel *descriptionLabel;
@property(nonatomic,strong) UIButton *callButton;
@property(nonatomic,strong) UIImageView *picture1;
@property(nonatomic,strong) UIButton *likeButton;
@property(nonatomic,strong) UIButton *shareButton;

@property(nonatomic,strong) UILabel *commentLabel;
@property(nonatomic,strong) UIImageView *image;
@property(nonatomic,strong) UITextField *textFiled;
@property(nonatomic,strong) UIView *view;
@property(nonatomic,strong) UIButton *sendButton;

@property(nonatomic,strong) UILabel *likeLabel;
@property(nonatomic,strong) UILabel *likeCountLabel;



@property(nonatomic,strong) Model *model;
-(void)layOut;



@end
