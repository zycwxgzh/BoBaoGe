//
//  PostViewController.h
//  播报哥
//
//  Created by DC017 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *bigScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *sumScrollView;
@property (weak, nonatomic) IBOutlet UIButton *titleButton;//标题按钮
- (IBAction)titlebutton:(id)sender;//标题按钮方法
@property (weak, nonatomic) IBOutlet UILabel *titleLable;//标题内容
@property (weak, nonatomic) IBOutlet UITextView *contentView;//textView
@property (weak, nonatomic) IBOutlet UIButton *quickInputButton;//快捷输入按钮
- (IBAction)quickInputbutton:(id)sender;//快捷输入按钮方法
@property (weak, nonatomic) IBOutlet UIButton *clearButton;//清除按钮
- (IBAction)clearbutton:(id)sender;//清除按钮方法
@property (nonatomic,strong) UIView *phoneView;
@property (nonatomic,strong) UIImageView *phoneImage;
@property (nonatomic,strong) UILabel *phoneLable;
@property (nonatomic,strong) UILabel *phoneNumberLable;//手机号

@property (nonatomic,strong) UIButton *putButton;//发布按钮

@end
