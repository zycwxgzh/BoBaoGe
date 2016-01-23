//
//  HomeTableViewCell.m
//  播报哥
//
//  Created by DC-002 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

//重写UITableViewCell的方法
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 300)];
        [self.contentView addSubview:view];
        
        _sortLabel = [[UILabel alloc]initWithFrame:CGRectMake(20  , 10, 50, 30)];
        _sortLabel.font = [UIFont systemFontOfSize:16];
        [view addSubview:_sortLabel];
        
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 10, 50, 30)];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        [view addSubview:_timeLabel];
        
        _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 200, 30)];
        _addressLabel.font = [UIFont systemFontOfSize:12];

        [view addSubview:_addressLabel];
        
        _callButton = [[UIButton alloc]initWithFrame:CGRectMake(240, 5, 100, 40)];
        [view addSubview:_callButton];
        
        _descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 80, 355, 50)];
        _descriptionLabel.font = [UIFont systemFontOfSize:14];
        [view addSubview:_descriptionLabel];
        
        _picture = [[UIImageView alloc]initWithFrame:CGRectMake(20, 150, 100, 80)];
        [view addSubview:_picture];
        
        _scanLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 240, 100, 20)];
        _scanLabel.font = [UIFont systemFontOfSize:12];
        [view addSubview:_scanLabel];
        
        
        _likeButton = [[UIButton alloc]initWithFrame:CGRectMake(30, 250, 80, 50)];
        _shareButton = [[UIButton alloc]initWithFrame:CGRectMake(140, 250, 80, 50)];
        _commentButton = [[UIButton alloc]initWithFrame:CGRectMake(260, 250, 80, 50)];
        
        [view addSubview:_likeButton];
        [view addSubview:_shareButton];
        [view addSubview:_commentButton];
        
//        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, 375, 0.5)];
//        _label.backgroundColor = [UIColor colorWithWhite:0.6 alpha:1];
//        [view addSubview:_label];
        
         
     }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
