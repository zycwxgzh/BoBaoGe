//
//  DetailViewController.h
//  播报哥
//
//  Created by DC-002 on 16/1/19.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"
#import "Model.h"
#import "LoadViewController.h"
#import "ContentView.h"


@interface DetailViewController : UIViewController<ContentViewDelegate>


@property(nonatomic,strong) LoadViewController *loadViewController;

@property(nonatomic,strong) UILabel *sortLabel;
@property(nonatomic,strong) UILabel *timeLabel;
@property(nonatomic,strong) UILabel *addressLabel;
@property(nonatomic,strong) UILabel *descriptionLabel;
@property(nonatomic,strong) UIButton *callButton;
@property(nonatomic,strong) UIImageView *picture1;
@property(nonatomic,strong) UIButton *likeButton;
@property(nonatomic,strong) UIButton *shareButton;
@property(nonatomic,strong) Model *model;

@property(nonatomic,strong) ContentView *contentView;
@property(nonatomic,strong) UIScrollView *scrollerView;

@end
