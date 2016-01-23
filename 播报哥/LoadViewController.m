//
//  LoadViewController.m
//  播报哥
//
//  Created by DC015 on 16/1/19.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "LoadViewController.h"


@interface LoadViewController ()

@end

@implementation LoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layout];

    
    
  
}
-(void)layout{
    
    _registerButton.layer.cornerRadius = 10;
    _registerButton.backgroundColor = [UIColor whiteColor];
    _registerButton.layer.borderWidth = 0.1;
    _registerButton.layer.borderColor = [UIColor grayColor].CGColor;
    _loadButton.layer.cornerRadius = 10;
    _loadButton.backgroundColor = [UIColor colorWithRed:88/255.0 green:198/255.0 blue:26/255.0 alpha:1.0];
    _loadButton.layer.borderWidth = 0.1;
    _loadButton.layer.borderColor = [UIColor grayColor].CGColor;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
