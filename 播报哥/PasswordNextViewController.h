//
//  PasswordNextViewController.h
//  播报哥
//
//  Created by DC015 on 16/1/22.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordNextViewController : UIViewController
- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

- (IBAction)sendButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *theNewPassword;

@property (weak, nonatomic) IBOutlet UITextField *checkThePassword;

@end
