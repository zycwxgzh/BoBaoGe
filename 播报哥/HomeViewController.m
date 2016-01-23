//
//  HomeViewController.m
//  播报哥
//
//  Created by DC017 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "HomeViewController.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    NSInteger imageCount;
    NSTimer *_timer;
    NSArray *imageArray;
    UIImageView *_imageView;
    UIView *view;
    UIButton *button;
   UITableView *tableViewSort;
    NSArray *sortArray;
    NSArray *headerTitle;
    //UIView *view1;
    
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
      self.tabBarItem.selectedImage = [[UIImage imageNamed:@"即时播报（颜色）"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
      self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:255/255.0 green:54/255.0 blue:0.0 alpha:1.0];
    
    //    判断用户 登录状态
    NSUserDefaults *state = [NSUserDefaults standardUserDefaults];
    [state setValue:@"no" forKey:@"state"];
    [state synchronize];
    
    headerTitle = @[@"[热门] 找羊毛衫",@"[热门] 找横机",@"[热门] 找工作",@"[热门] 找羊毛衫",@"[热门] 找羊毛衫",@"[热门] 找羊毛衫",@"[热门] 找羊毛衫",@"[热门] 找羊毛衫",@"[热门] 找羊毛衫",@"[热门] 找羊毛衫"];
    
    imageArray = @[@"00",@"01",@"02"];
    sortArray = @[@"找货",@"找加工",@"承接加工",@"招工",@"找工作",@"求租",@"出租",@"转让",@"其他需求"];
    
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tag = 0;
    
//    tableViewSort = [[UITableView alloc]initWithFrame:CGRectMake(20, 150, 335, 350) style:UITableViewStylePlain];
    tableViewSort = [[UITableView alloc]init];
    tableViewSort.delegate = self;
    tableViewSort.dataSource = self;
    tableViewSort.tag = 1;
    
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
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
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
    _pageController.currentPageIndicatorTintColor = [UIColor colorWithRed:0.301 green:0.766 blue:1.000 alpha:1.000];
    
    _pageController.pageIndicatorTintColor = [UIColor grayColor];
    _pageController.numberOfPages = imageCount;
    [self.view addSubview:_pageController];
    
    //图片自动轮播
    [self startTimer];
    
}

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





#pragma mark  货物信息
//返回多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    for (int i = 0; i<headerTitle.count; i++) {
        if (section == i && tableView.tag == 0) {
            
            return 1;
        }
    }
    if (tableView.tag == 1) {
        return  sortArray.count;
    }
    
    return 0;
}

//返回多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag == 0) {
        return headerTitle.count;
    }
    return 1;
}

//返回头标题
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 0) {
        
        for (int i = 0; i<headerTitle.count; i++) {
            if (section == i && tableView.tag == 0) {
                UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 44)];
                view1.backgroundColor = [UIColor colorWithWhite:0.903 alpha:1.000];
                
                UILabel *littleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 8, 20, 30)];
                littleLabel.backgroundColor = [UIColor whiteColor];
                UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectZero];
                headerLabel.backgroundColor = [UIColor whiteColor];
                headerLabel.opaque = NO;
                headerLabel.textColor = [UIColor blackColor];
                headerLabel.font = [UIFont systemFontOfSize:16];
                headerLabel.frame = CGRectMake(20, 8, 375, 30) ;
                headerLabel.text = headerTitle[i];
                [view1 addSubview:littleLabel];
                [view1 addSubview:headerLabel];
                return view1;
            }
            
        }
    }
    return nil;
}


//设置头部高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 0) {
        return 44;
    }
    return 0;
}

//单元格复用
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _homeCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (_homeCell == nil) {
        _homeCell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    if (tableView.tag == 0) {
        tableView.rowHeight = 300;
         _homeCell.sortLabel.text = @"[找货]";
        _homeCell.timeLabel.text = @"一天前";
        _homeCell. addressLabel.text = @"[浙江省嘉兴市南湖区昌盛南路]";
        _homeCell.descriptionLabel.text = @"转让一台吸风机,九成新,没怎么用";
        _homeCell.scanLabel.text = @"50人浏览";
        
        //拨打电话按钮
        [_homeCell.callButton setTitle:@"马上拨打" forState:UIControlStateNormal];
        [_homeCell.callButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _homeCell.callButton.titleLabel.font = [UIFont systemFontOfSize:14];

        [_homeCell.callButton setImage:[UIImage imageNamed:@"call"] forState:UIControlStateNormal];
        [_homeCell.callButton addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
        _homeCell.picture.image = [UIImage imageNamed:@"00"];
        
        
        //点赞按钮
        [_homeCell.likeButton setTitle:@"  赞" forState:UIControlStateNormal];
        [_homeCell.likeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _homeCell.likeButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [_homeCell.likeButton setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
        [_homeCell.likeButton addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
        
        //分享按钮
        [_homeCell.shareButton setTitle:@"  分享" forState:UIControlStateNormal];
        [_homeCell.shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _homeCell.shareButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [_homeCell.shareButton setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
        [_homeCell.shareButton addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
        
        
        //评论按钮
        [_homeCell.commentButton setTitle:@"  评论" forState:UIControlStateNormal];
        [_homeCell.commentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _homeCell.commentButton.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [_homeCell.commentButton setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
        [_homeCell.commentButton addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
        
         
    }
    else if (tableView.tag == 1)
    {
        _homeCell.textLabel.text = sortArray[indexPath.row];
        _homeCell.textLabel.textColor = [UIColor colorWithRed:0.206 green:0.704 blue:1.000 alpha:1.000];
        tableViewSort.rowHeight = 40;
        tableViewSort.scrollEnabled = NO;
        _homeCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return _homeCell;
}

#pragma mark tableViewCell的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 0) {
        //取出当前点击的cell
        _homeCell = [tableView cellForRowAtIndexPath:indexPath];
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        
        [userDefault setValue:_homeCell.sortLabel.text forKey:@"sort"];
        [userDefault setValue:_homeCell.timeLabel.text forKey:@"time"];
        [userDefault setValue:_homeCell.addressLabel.text forKey:@"address"];
        [userDefault setValue:_homeCell.descriptionLabel.text forKey:@"description"];
        
        UIImage *image = [UIImage imageNamed:@"00"];
        NSData *data = UIImagePNGRepresentation(image);
        [userDefault setValue:data forKey:@"image"];
        
        _detailViewController = [[DetailViewController alloc]init];
        [self presentViewController:_detailViewController animated:NO completion:nil];
    }
     if(tableView.tag == 1)
    {
        
    }
    
   
}

-(void)call
{
    //拨打电话点击跳转登录注册界面
    NSLog(@"跳转界面");
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

- (IBAction)search:(id)sender {
}

- (IBAction)sortSearch:(id)sender {
    
    button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    button.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    [button addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    view = [[UIView alloc]initWithFrame:CGRectMake(20, 150, 335, 360)];
    view.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    
    [button addSubview:view];
    
    if (tableViewSort.tag == 1) {
        tableViewSort.frame = CGRectMake(0, 0, 335, 360);
        [view addSubview:tableViewSort];
    }
  

    
}

-(void)cancle
{
    [view removeFromSuperview];
    [button removeFromSuperview];
}



@end
