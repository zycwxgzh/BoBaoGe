//
//  InputViewController.m
//  播报哥
//
//  Created by DC-002 on 16/1/26.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "InputViewController.h"
#import "PostViewController.h"

@interface InputViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic,strong )UITableView *tableView;
@property(nonatomic,strong )NSArray *kindList;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _kindList = @[@"我要找货",@"我要招横机",@"我要招套口",@"我要招平车",@"我要招绣花",@"我要承接横机加工",@"我要承接套口加工",@"我要招工",@"我要找工作",@"我要求租",@"我要出租",@"我要转让店铺",@"我要转让其他",@"我要其他需求"];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 13;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (Cell == nil) {
        Cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    Cell.textLabel.text = _kindList[indexPath.row];
    return Cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //向postView传值
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:_kindList[indexPath.row] forKey:@"arrayInput"];
    //[user synchronize];
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
