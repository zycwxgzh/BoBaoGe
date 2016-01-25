//
//  NewTableViewCell.m
//  播报哥
//
//  Created by DC015 on 16/1/23.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "NewTableViewCell.h"
#import "MyViewController.h"

@implementation NewTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        [self layout];
        
        
        
    }
    return self;
}

- (void)layout{

    
    NSUserDefaults *frameWidth = [NSUserDefaults standardUserDefaults];
    NSString *widthF = [frameWidth valueForKey:@"width"];
    
    _mainImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, (150-[widthF floatValue]/4.0)/2.0, [widthF floatValue]/4.0,[widthF floatValue]/4.0)];
    [self addSubview:_mainImage];
    
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_mainImage.frame.size.width+30, 10, 80, 20)];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_titleLabel];
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(_mainImage.frame.size.width+30+_titleLabel.frame.size.width+20, 15, 50, 15)];
    _dateLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_dateLabel];
    
    _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(_mainImage.frame.size.width+30, _titleLabel.frame.size.height+20, self.frame.size.width-_mainImage.frame.size.width-40, 15)];
    _addressLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_addressLabel];
    
    _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(_mainImage.frame.size.width+30, _titleLabel.frame.size.height+_addressLabel.frame.size.height+30, self.frame.size.width-_mainImage.frame.size.width-40, 30)];
    _detailLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_detailLabel];
    
    _comentLabel = [[UILabel alloc]initWithFrame:CGRectMake(_mainImage.frame.size.width+30,_titleLabel.frame.size.height+_addressLabel.frame.size.height+_detailLabel.frame.size.height+40 , 20, 15)];
    _comentLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_comentLabel];
    
    
    _commentImage = [[UIImageView alloc]initWithFrame:CGRectMake(_mainImage.frame.size.width+_comentLabel.frame.size.width+30, _titleLabel.frame.size.height+_addressLabel.frame.size.height+_detailLabel.frame.size.height+40 , 15, 15)];
    [self addSubview:_commentImage];
    
    _loveLabel = [[UILabel alloc]initWithFrame:CGRectMake(_mainImage.frame.size.width+_comentLabel.frame.size.width+_commentImage.frame.size.width +45,  _titleLabel.frame.size.height+_addressLabel.frame.size.height+_detailLabel.frame.size.height+40, 20, 15)];
    _loveLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_loveLabel];
    
    
    _loveImage = [[UIImageView alloc]initWithFrame:CGRectMake(_mainImage.frame.size.width+_comentLabel.frame.size.width+_commentImage.frame.size.width + _loveLabel.frame.size.width+45,_titleLabel.frame.size.height+_addressLabel.frame.size.height+_detailLabel.frame.size.height+40, 15, 15)];
    [self addSubview:_loveImage];
    
    _stateLabel = [[UILabel alloc]initWithFrame:CGRectMake([widthF floatValue]-210 + _loveLabel.frame.size.width+_loveImage.frame.size.width + 70,_titleLabel.frame.size.height+_addressLabel.frame.size.height+_detailLabel.frame.size.height+40-3, 60, 20)];
    _stateLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_stateLabel];
    
    _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake([widthF floatValue]-40,_titleLabel.frame.size.height+_addressLabel.frame.size.height+_detailLabel.frame.size.height+40-3, 30, 20)];
    [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [_deleteButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _deleteButton.titleLabel.font = [UIFont systemFontOfSize:12];
    self.userInteractionEnabled = YES;
    [self addSubview:_deleteButton];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
