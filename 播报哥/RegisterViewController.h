//
//  RegisterViewController.h
//  播报哥
//
//  Created by DC015 on 16/1/19.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

- (IBAction)receive:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *receive;

- (IBAction)Register:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@end
