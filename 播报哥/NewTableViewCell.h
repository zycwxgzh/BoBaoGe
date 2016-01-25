//
//  NewTableViewCell.h
//  播报哥
//
//  Created by DC015 on 16/1/23.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewTableViewCell;

//@protocol NewTableViewCellDelegate <NSObject>
@protocol NewTableViewCell <NSObject>
//-(void) NewTableViewCellDeleteCell : (NewTableViewCell *)cell;

@end

@interface NewTableViewCell : UITableViewCell//<NewTableViewCellDelegate>

//@property(nonatomic, strong)id<NewTableViewCellDelegate> delegate;

@property (strong,nonatomic) UIView *cellView;
@property (strong, nonatomic)  UIImageView *mainImage;

@property (strong, nonatomic)  UILabel *titleLabel;
@property (strong, nonatomic)  UILabel *dateLabel;
@property (strong, nonatomic)  UILabel *addressLabel;


@property (strong, nonatomic)  UILabel *detailLabel;
@property (strong, nonatomic)  UILabel *loveLabel;
@property (strong, nonatomic)  UILabel *comentLabel;

@property (strong, nonatomic)  UIImageView *loveImage;
@property (strong, nonatomic)  UIImageView *commentImage;
@property (strong, nonatomic)  UILabel *stateLabel;
@property (strong, nonatomic)  UIButton *deleteButton;

@end
