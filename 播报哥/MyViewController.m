//
//  MyViewController.m
//  播报哥
//
//  Created by DC017 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "MyViewController.h"
#import "LoadViewController.h"
#import "InformationViewController.h"
#import "PasswordViewController.h"
#import "NewTableViewCell.h"



@interface MyViewController ()//<NewTableViewCellDelegate>
{
    NSTimer *timer;
    
    int page;
    
    NSArray *array;
    NSMutableArray *arrayMu;
    
    
    
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"我（颜色）"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:255/255.0 green:54/255.0 blue:0.0 alpha:1.0];
    self.navigationController.navigationBar.topItem.title  = @"我";
    
    NSUserDefaults *frameWidth = [NSUserDefaults standardUserDefaults];
    
    float width = self.view.frame.size.width;
    [frameWidth setValue:[NSString stringWithFormat:@"%f",width] forKey:@"width"];
    [frameWidth synchronize];
    
    
    NSUserDefaults *state = [NSUserDefaults standardUserDefaults];
    NSString *stateStr = [state valueForKey:@"state"];
    
    
    array = @[@"找货",@"找加工",@"承接加工",@"招工",@"找工作",@"求租",@"出租",@"转让",@"其他需求"];
    arrayMu = [NSMutableArray arrayWithArray:array];
    if (stateStr == [NSString stringWithFormat:@"no"]) {
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(run) userInfo:nil repeats:YES];
        
    }else{
        //    如果用户已登录 则加载页面
        [self layout];
    }
    
    
}

- (void)run{
    //    判断登录状态 当判断登录状态为未登录时 跳转至登陆页面
    [timer invalidate];
    timer = nil;
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LoadViewController *load = [storyBoard instantiateViewControllerWithIdentifier:@"loadVC"];
    [self presentViewController:load animated:NO completion:nil];
}

//布局页面
-(void)layout{
    
    [_mynews setTitle:@"我的消息" forState:UIControlStateNormal];
    [_myset setTitle:@"我的设置" forState:UIControlStateNormal];
    
    [_mynews setTitleColor:[UIColor colorWithRed:250/255.0 green:68/255.0 blue:23/255.0 alpha:0.95] forState:UIControlStateNormal];
    [_mynews setImage:[UIImage imageNamed:@"我的消息（颜色）"] forState:UIControlStateNormal];
    _mynews.backgroundColor = [UIColor whiteColor];
    
    [_myset setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_myset setImage:[UIImage imageNamed:@"我的设置"] forState:UIControlStateNormal];
    _myset.backgroundColor = [UIColor colorWithRed:250/255.0 green:68/255.0 blue:23/255.0 alpha:0.95];
    
    
    _scollView.delegate = self;
    _scollView.contentSize = CGSizeMake(self.view.frame.size.width*2.0, 0);//0表示高度方向不滚动
    
    _scollView.scrollEnabled = YES;//滑动
    _scollView.pagingEnabled = YES;//翻页
    
    
    _newsTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-167) style:UITableViewStylePlain];
    
    _setTableView = [[UITableView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width,self.view.frame.size.height-167)style:UITableViewStyleGrouped];
    
    _newsTableView.delegate = self;
    _newsTableView.dataSource = self;
    
    
    _setTableView.delegate = self;
    _setTableView.dataSource = self;
    
    
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 20, 250, 60)];
    label.text = @"目前没有新的消息……";
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    [_newsTableView addSubview:label];
    [_scollView addSubview:_newsTableView];
    [_scollView addSubview:_setTableView];
    
    //    若无新消息 则 提醒用户 暂无新消息 否则隐藏掉
    if (arrayMu.count == 0) {
        label.hidden = NO;
    }else{
        
        label.hidden = YES;
    }
    
    
}


#pragma mark - UIScrollView的代理方法
#pragma mark 当scrollView正在滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    page = scrollView.contentOffset.x /scrollView.frame.size.width; //计算当前页数
    
    if (page == 0) {
        //        当滑动到第0页时，对应“我的消息”button
        [_mynews setTitleColor:[UIColor colorWithRed:250/255.0 green:68/255.0 blue:23/255.0 alpha:0.95] forState:UIControlStateNormal];
        [_mynews setImage:[UIImage imageNamed:@"我的消息（颜色）"] forState:UIControlStateNormal];
        _mynews.backgroundColor = [UIColor whiteColor];
        
        [_myset setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_myset setImage:[UIImage imageNamed:@"我的设置"] forState:UIControlStateNormal];
        _myset.backgroundColor = [UIColor colorWithRed:250/255.0 green:68/255.0 blue:23/255.0 alpha:0.95];
        
    }else if(page == 1){
        
        [_mynews setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_mynews setImage:[UIImage imageNamed:@"我的消息"] forState:UIControlStateNormal];
        _mynews.backgroundColor = [UIColor colorWithRed:250/255.0 green:68/255.0 blue:23/255.0 alpha:0.95];
        
        [_myset setTitleColor:[UIColor colorWithRed:250/255.0 green:68/255.0 blue:23/255.0 alpha:0.95] forState:UIControlStateNormal];
        [_myset setImage:[UIImage imageNamed:@"我的设置（颜色）"] forState:UIControlStateNormal];
        _myset.backgroundColor = [UIColor whiteColor];
    }
    
}

//返回行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([tableView isEqual:_newsTableView]) {
        return 150;//“我的消息”里每个cell的高时150
    }
    else{
        
        if (indexPath.section == 0) {
            return 80;
        }else
            
            return 50;
        
    }
    
}
//分组数
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    if ([tableView isEqual:_setTableView]) {
        
        return 4;//“我的设置”tableview里的组数
    }
    return arrayMu.count;
    
    
}

//每组的元素的数量
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if ([tableView isEqual:_setTableView]) {
        
        if (section == 1 ) {
            return 3;
        }else if (section == 2 ) {
            return 2;
        }
        
        return 1;
    }
    else
        
        return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    if ([tableView isEqual:_setTableView]) {
        if (section < 3) {
            return 5;
        }else
            return 30;
    }
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    
    if ([tableView isEqual:_setTableView]) {
        if (section < 3) {
            return 5;
        }else
            return 50;
    }
    
    return 0;
    
    
}


//绘制cell

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if ([tableView isEqual:_newsTableView]) {
        
        NewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
        if (cell == nil) {
            cell = [[NewTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ce"
                    ];
            
        }
        
        
        
        cell.mainImage.image = [UIImage imageNamed:@"headView"];
        
        cell.titleLabel.text = [arrayMu objectAtIndex:[indexPath section]];//主标题
        cell.dateLabel.text = @"上传日期";
        cell.addressLabel.text = @"地址";
        cell.detailLabel.text = @"内容详情";//内容详情
        cell.loveLabel.text = @"0";//点赞数
        cell.loveImage.image = [UIImage imageNamed:@"love"];//点赞图标
        cell.comentLabel.text = @"0";//评论数
        cell.commentImage.image = [UIImage imageNamed:@"comment"];
        cell.stateLabel.text = @"审核状态";
        cell.cellView.userInteractionEnabled = YES;
        cell.deleteButton.tag = [indexPath section];
        [cell.deleteButton addTarget:self action:@selector(deleteCell :) forControlEvents:UIControlEventTouchUpInside];//删除键
        return cell;
        
    }
    else if([tableView isEqual:_setTableView]){
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"
                    ];
        }
        
        
        if (indexPath.section == 0) {
            
            
            cell.detailTextLabel.text = @"设置";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.section == 1){
            if(indexPath.row == 0){
                
                cell.imageView.image = [UIImage imageNamed:@"微信"];
                cell.textLabel.text = @"123456789";
                
                
            }else if(indexPath.row == 1){
                
                cell.imageView.image = [UIImage imageNamed:@"QQ"];
                cell.textLabel.text = @"987654321";
                
                
                
            }else{
                
                
                cell.imageView.image = [UIImage imageNamed:@"手机"];
                cell.textLabel.text = @"13123456798";
                
                
            }
            
        }else if(indexPath.section == 2){
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            if (indexPath.row == 0) {
                
                cell.imageView.image = [UIImage imageNamed:@"更改密码"];
                cell.textLabel.text = @"修改密码";
            }else if (indexPath.row == 1){
                
                cell.imageView.image = [UIImage imageNamed:@"检查更新"];
                cell.textLabel.text = @"检查版本更新";
                
            }
        }else if(indexPath.section == 3){
            
            cell.imageView.image = [UIImage imageNamed:@"退出登录"];
            cell.textLabel.text = @"退出登录";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            
        }
        
        
        
        return cell;
        
    }
    return nil;
}



- (void)deleteCell : (UIButton *)button{
    //    删除cell 每删除一次 tag值会改变 所以删完要刷新 重新获取tag值
    
    //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:button.tag];
    
    [arrayMu removeObjectAtIndex:button.tag];
    
    //    [self.newsTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    [self.newsTableView reloadData];
    
}

//cell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView isEqual:_setTableView]) {
        
        if (indexPath.section == 0 ) {
            
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            InformationViewController *info = [storyBoard instantiateViewControllerWithIdentifier:@"info"];
            [self presentViewController:info animated:NO completion:nil];
        }else if (indexPath.section == 2 & indexPath.row == 0 ){
            
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            PasswordViewController *password = [storyBoard instantiateViewControllerWithIdentifier:@"password"];
            [self presentViewController:password animated:YES completion:nil];
        }else if (indexPath.section == 3 ){
            //            NSLog(@"点击退出登录");
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认退出？" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
            
            
            
        }
    }
    
    
}

- (IBAction)mynews:(id)sender {
    
    _scollView.contentOffset = CGPointMake(0, 0);
    
    [_mynews setTitleColor:[UIColor colorWithRed:250/255.0 green:68/255.0 blue:23/255.0 alpha:0.95] forState:UIControlStateNormal];
    [_mynews setImage:[UIImage imageNamed:@"我的消息（颜色）"] forState:UIControlStateNormal];
    _mynews.backgroundColor = [UIColor whiteColor];
    
    [_myset setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_myset setImage:[UIImage imageNamed:@"我的设置"] forState:UIControlStateNormal];
    _myset.backgroundColor = [UIColor colorWithRed:250/255.0 green:68/255.0 blue:23/255.0 alpha:0.95];
    
    
}

- (IBAction)mySet:(id)sender {
    
    _scollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
    [_mynews setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_mynews setImage:[UIImage imageNamed:@"我的消息"] forState:UIControlStateNormal];
    _mynews.backgroundColor = [UIColor colorWithRed:250/255.0 green:68/255.0 blue:23/255.0 alpha:0.95];
    
    [_myset setTitleColor:[UIColor colorWithRed:250/255.0 green:68/255.0 blue:23/255.0 alpha:0.95] forState:UIControlStateNormal];
    [_myset setImage:[UIImage imageNamed:@"我的设置（颜色）"] forState:UIControlStateNormal];
    _myset.backgroundColor = [UIColor whiteColor];
    
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
