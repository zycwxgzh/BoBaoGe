//
//  HomeViewController.m
//  播报哥
//
//  Created by DC017 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,HomeTableViewCellDelegate>
{
    NSInteger imageCount;
    NSTimer *_timer;
    NSArray *imageArray;
    UIImageView *_imageView;
    UIView *view;
    UIButton *button;
    NSArray *sortArray;
    NSArray *headerTitle;
    //    CGFloat cellHeight;
    HomeTableViewCell *_homeCell;
    
    NSMutableArray *_cellArray;
    
}
@property(nonatomic,strong)NSArray *modelArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _modelArray = [self modelArray];
    _cellArray = [NSMutableArray array];
    for (int i = 0; i < [_modelArray count]; i++) {
        HomeTableViewCell *cell = [[HomeTableViewCell alloc]init];
        [_cellArray addObject:cell];
    }
    
   // _tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    //设置搜索栏
    _searchInformatiion.layer.cornerRadius = 15.0f;
    _searchInformatiion.layer.masksToBounds = YES;
    _searchInformatiion.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1]CGColor];
    _searchInformatiion.layer.borderWidth = 1.0f;
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:@"no" forKey:@"state"];
    [user synchronize];
    
    // headerTitle = @[@" 找羊毛衫",@"找横机",@" 找工作",@" 找羊毛衫",@"找羊毛衫",@" 找羊毛衫",@" 找羊毛衫",@" 找羊毛衫",@" 找羊毛衫",@" 找羊毛衫"];
    
    imageArray = @[@"轮播图1",@"广告页2",@"广告页3"];
    sortArray = @[@"找货",@"找加工",@"承接加工",@"招工",@"找工作",@"求租",@"出租",@"转让",@"其他需求"];
    
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tag = 0;
    
    CGFloat imageW = _scrollerView.frame.size.width;
    CGFloat imageH = 150;
    CGFloat imageY = 0;
    imageCount = 3;
    
    //图片轮播
    for (int i = 0; i<imageCount; i++) {
        CGFloat imageX = i*imageW;
        
        _imageView = [[UIImageView alloc]init];
        
        _imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        _imageView.image = [UIImage imageNamed:imageArray[i]];
        
        _scrollerView.showsHorizontalScrollIndicator = NO;
        
        [self.view addSubview:_scrollerView];
        [_scrollerView addSubview:_imageView];
    }
    
    //设置scrollerView的偏移量
    CGFloat contentW = imageCount*imageW;
    _scrollerView.contentSize = CGSizeMake(contentW, 0);
    _scrollerView.delegate = self;
    _scrollerView.pagingEnabled = YES;
    
    
    //设置pageController
    _pageController.currentPageIndicatorTintColor = [UIColor colorWithRed:1.000 green:0.191 blue:0.058 alpha:1.000];
    
    _pageController.pageIndicatorTintColor = [UIColor whiteColor];
    _pageController.numberOfPages = imageCount;
    
    [self.view addSubview:_pageController];
    
    //图片自动轮播
    [self startTimer];}

//图片滚动时调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollViewW = _scrollerView.frame.size.width;
    
    CGFloat x = _scrollerView.contentOffset.x;
    //NSLog(@"=======%f",x);
    int page = (x+scrollViewW/2)/scrollViewW;
    self.pageController.currentPage = page;
    
}

//开始拖拽时调用
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self closeTimer];
}
//拖拽完成时调用
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

//开启定时器
-(void)startTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}

//关闭定时器
-(void)closeTimer
{
    [_timer invalidate];
}

//每隔一秒自动换图
-(void)nextImage
{
    int page = (int)self.pageController.currentPage;
    //NSLog(@"--------%d",page);
    
    if (page == imageCount-1) {
        page = 0;
    }
    else
    {
        page++;
    }
    CGFloat x = page*_scrollerView.frame.size.width;
    _scrollerView.contentOffset = CGPointMake(x, 0);
}





- (NSArray *)modelArray{
    
    if (_modelArray ==nil) {
        //  1.读取plsit文件
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"images" ofType:@"plist" ]];
        //  2.字典转模型
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Model *blogModel = [Model blogWithDict:dict];
            [tempArray addObject:blogModel];
        }
        _modelArray = tempArray;
      // NSLog(@"+++++++++++++++%@",_modelArray);
       // Model *model = _modelArray[5];
       //NSLog(@"----------%@",model.time);
      
    }
    return _modelArray;
}




#pragma mark  货物信息
//返回多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    for (int i = 0; i<_modelArray.count; i++) {
        if (section == i) {
            
            return _modelArray.count/10;
        }
    }
    return 0;
   
}

//返回多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _modelArray.count;
    
}

//返回头标题
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    
    for (int i = 0; i<_modelArray.count; i++) {
        if (section == i && tableView.tag == 0) {
            UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
            view1.backgroundColor = [UIColor colorWithWhite:0.903 alpha:1.000];
            
            UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 15, 85, 18)];
            imageView1.image = [UIImage imageNamed:@"播报焦点"];
            
            UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(135, 15, 20, 18)];
            imageView2.image = [UIImage imageNamed:@"喇叭"];
            
            UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(165, 15, 200, 18)];
            titleLabel.text = @"播报哥,谁用谁知道!";
            titleLabel.font = [UIFont systemFontOfSize:13];
            titleLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1];
            
            UILabel *whiteLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, 375, 33)];
            whiteLabel.backgroundColor = [UIColor whiteColor];
            
            [view1 addSubview:whiteLabel];
            [view1 addSubview:imageView1];
            [view1 addSubview:imageView2];
            [view1 addSubview:titleLabel];
            return view1;
        }
    }
    
    return nil;
}


//设置头部高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 40;
    
}

//单元格复用
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _homeCell.selectionStyle = UITableViewCellSelectionStyleNone;

    _homeCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
        if (_homeCell == nil) {
        _homeCell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    Model *imageModel = _modelArray[indexPath.section];
    //    if ([imageModel.picture count] == 0) {
    for (int i = 0; i < [_homeCell.imageArray count]; i++) {
        [_homeCell.imageArray[i] removeFromSuperview];
    }
    //    }
    
    [_homeCell setModel:imageModel :YES];
    _homeCell.delegate = self;
    return _homeCell;
    
    
    
}

#pragma mark 自定义cell的三个代理方法
- (void)HomeTableViewCellCallPhoneClicked:(HomeTableViewCell *)cell
{
    //NSLog(@"%@", cell);
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"消息提醒" message:@"是否拨打电话?" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
    
}
-(void)HomeTableViewCellCommentClicked:(HomeTableViewCell *)cell
{
    _detailViewController = [[DetailViewController alloc]init];
    [self presentViewController:_detailViewController animated:NO completion:nil];
    
}

-(void)NotLoginClicked:(HomeTableViewCell *)cell
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    _loadViewController = [storyBoard instantiateViewControllerWithIdentifier:@"loadVC"];
    [self presentViewController:_loadViewController animated:YES completion:nil];
}


//返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = _cellArray[indexPath.section];
    Model *imageModel = _modelArray[indexPath.section];
    [cell setModel:imageModel :NO];
    //    NSLog(@"%f", cell.height);
    
    return cell.height;
    
}


#pragma mark tableViewCell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Model *model = [[Model alloc]init];
    
    _homeCell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setValue:_homeCell.sortLabel.text forKey:@"sort"];
    [userDefault setValue:_homeCell.timeLabel.text forKey:@"time"];
    [userDefault setValue:_homeCell.addressLabel.text forKey:@"address"];
    [userDefault setValue:_homeCell.descriptionLabel.text forKey:@"description"];
    
   // Model *model = _modelArray[2];
   // NSLog(@"_________%@",model.picture[0]);
   //UIImage *image = [UIImage imageNamed:model.picture[0]];
   // NSLog(@"----------%@",_modelArray[0][@"picture"][0]);
    //UIImage *image = [UIImage imageNamed:@"00"];
    //NSData *data = UIImagePNGRepresentation(image);
    //[userDefault setValue:data forKey:@"image"];
    
    _detailViewController = [[DetailViewController alloc]init];
    [self presentViewController:_detailViewController animated:NO completion:nil];
    
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addMessage:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    _postViewController = [storyBoard instantiateViewControllerWithIdentifier:@"post"];
    [self presentViewController:_postViewController animated:YES completion:nil];

}

- (IBAction)sortSearch:(id)sender {
    
    _sortSearchViewController = [[SortSearchViewController alloc]init];
    [self presentViewController:_sortSearchViewController animated:NO completion:nil];

    
}

-(void)cancle
{
    [view removeFromSuperview];
    [button removeFromSuperview];
}



@end
