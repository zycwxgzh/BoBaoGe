//
//  ForgetPasswordViewController.h
//  播报哥
//
//  Created by DC015 on 16/1/21.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetPasswordViewController : UIViewController
- (IBAction)backButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
- (IBAction)sendButtton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *checkNumber;
@property (weak, nonatomic) IBOutlet UIButton *receive;

@end
