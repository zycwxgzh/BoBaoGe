//
//  NewsTableViewCell.m
//  播报哥
//
//  Created by DC015 on 16/1/20.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"NewsTableViewCell" owner:nil options:nil];
        self = [arr firstObject];

        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (IBAction)deleteButton:(id)sender {
    
  

    
}

@end
