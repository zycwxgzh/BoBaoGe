//
//  MyViewController.h
//  播报哥
//
//  Created by DC017 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *newsTableView;//我的消息里的tableview
@property(nonatomic,strong)UITableView *setTableView;//我的设置里的tableview
- (IBAction)mynews:(id)sender;
- (IBAction)mySet:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *mynews;
@property (weak, nonatomic) IBOutlet UIButton *myset;
@property (weak, nonatomic) IBOutlet UIScrollView *scollView;



@end
