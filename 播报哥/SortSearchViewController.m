//
//  SortSearchViewController.m
//  播报哥
//
//  Created by DC-002 on 16/1/25.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "SortSearchViewController.h"

@interface SortSearchViewController ()
<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *sortArray;
}


@end

@implementation SortSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    sortArray = @[@"招套口",@"招平车",@"招绣花",@"承接横机加工",@"承接套口加工",@"招工",@"找工作",@"求租",@"出租",@"转让店铺",@"转让其他",@"其他需求"];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    label.backgroundColor =[UIColor colorWithRed:255/255.0 green:59/255.0 blue:10/255.0 alpha:1.000];
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 130, 44)];
    [button setTitle:@"  选择分类" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 114, 375, 667) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
    
    
    UILabel *searchLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, 375, 40)];
    searchLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:searchLabel];
    
    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 69, 355, 30)];
    textFiled.borderStyle = UITextBorderStyleRoundedRect;
    textFiled.placeholder = @"🔍寻找我要的信息";
    textFiled.layer.cornerRadius = 15.0f;
    textFiled.layer.masksToBounds = YES;
    textFiled.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1]CGColor];
    textFiled.layer.borderWidth = 1.0f;
    [self.view addSubview:textFiled];
    

}

-(void)back
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

//返回多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sortArray count];
}

//单元格复用
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = sortArray[indexPath.row];
    return cell;
}
//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setValue:sortArray[indexPath.row] forKey:@"sort"];
    
    //    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //      _homeViewController = [storyBoard instantiateViewControllerWithIdentifier:@"home"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
