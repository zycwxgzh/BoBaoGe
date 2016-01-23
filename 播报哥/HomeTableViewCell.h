//
//  HomeTableViewCell.h
//  播报哥
//
//  Created by DC-002 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell
@property(nonatomic,strong) UILabel *sortLabel;
@property(nonatomic,strong) UILabel *timeLabel;
@property(nonatomic,strong) UILabel *addressLabel;
@property(nonatomic,strong) UILabel *descriptionLabel;
@property(nonatomic,strong) UIButton *callButton;
@property(nonatomic,strong) UIImageView *picture;
@property(nonatomic,strong) UILabel *scanLabel;
@property(nonatomic,strong) UIButton *likeButton;
@property(nonatomic,strong) UIButton *shareButton;
@property(nonatomic,strong) UIButton *commentButton;
//@property(nonatomic,strong) UILabel *label;
//@property(nonatomic,strong) UILabel *label1;

@end
