//
//  HomeTableViewCell.h
//  播报哥
//
//  Created by DC-002 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "DetailViewController.h"
#import "LoadViewController.h"
@class HomeTableViewCell;
//cell代理
@protocol HomeTableViewCellDelegate <NSObject>

- (void) HomeTableViewCellCallPhoneClicked : (HomeTableViewCell *)cell;
-(void) HomeTableViewCellCommentClicked:(HomeTableViewCell *)cell;
-(void) NotLoginClicked:(HomeTableViewCell *)cell;

@end

@interface HomeTableViewCell : UITableViewCell
@property(nonatomic, strong)id<HomeTableViewCellDelegate> delegate;

@property(nonatomic,strong) DetailViewController *detailViewController;
@property(nonatomic,strong) LoadViewController *loadViewController;

@property(nonatomic,strong) UILabel *sortLabel;
@property(nonatomic,strong) UILabel *timeLabel;
@property(nonatomic,strong) UILabel *addressLabel;
@property(nonatomic,strong) UILabel *descriptionLabel;
@property(nonatomic,strong) UIButton *callButton;
@property(nonatomic,strong) UIImageView *picture1;
@property(nonatomic,strong) UILabel *lineLabel;
@property(nonatomic,strong) UILabel *scanLabel;
@property(nonatomic,strong) UIButton *likeButton;
@property(nonatomic,strong) UIButton *shareButton;
@property(nonatomic,strong) UIButton *commentButton;
@property(nonatomic,strong) NSMutableArray *muArray;
//@property(nonatomic,strong) UILabel *label;
//@property(nonatomic,strong) UILabel *label1;
@property(nonatomic,strong) Model *model;
//高度约束
@property(nonatomic,strong)NSLayoutConstraint *heightConstraint;
@property(nonatomic,assign) float height;

-(void)setModel:(Model *)model : (BOOL)draw;


@property(nonatomic, strong)NSMutableArray *imageArray;
@end
