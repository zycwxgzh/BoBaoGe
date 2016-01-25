//
//  InformationViewController.h
//  播报哥
//
//  Created by DC015 on 16/1/20.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *wechatNumber;
@property (weak, nonatomic) IBOutlet UITextField *qqNumber;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
- (IBAction)sendButton:(id)sender;
- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

@end

