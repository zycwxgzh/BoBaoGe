//
//  AlbumViewController.m
//  播报哥
//
//  Created by DC-002 on 16/1/26.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "AlbumViewController.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "PostViewController.h"
#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface AlbumViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>{
    
    UIScrollView *_scrollView;
    UIImageView *_leftImageView;
    UIImageView *_middleImageView;
    UIImageView *_rightImageView;
    int currentImage;
    
    UIPageControl *_pageControl;
    int ImageCount;
    UIButton *backButton;
    UILabel *label;
    int selectNum;
    UIAlertController *_chooseview;
}

@property(nonatomic, strong)NSMutableArray *images;//存储相册图片

@property(nonatomic, strong)UICollectionView *collectView;

@property(nonatomic, strong)NSMutableArray *selectedImageIndex;//存储选择的图片索引
//蒙层
@property(nonatomic,strong)UIView * mengView;

@property(nonatomic,strong)UIScrollView * scrollView;

@property(nonatomic,strong)UIImageView * imageView;
@property(nonatomic,strong)NSMutableArray *selectArray;
@property(nonatomic,strong)NSMutableArray *saveArray;

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"相册胶卷";
    _selectedImageIndex = [NSMutableArray array];
    _selectArray = [NSMutableArray array];
    _saveArray = [NSMutableArray array];
    selectNum = 0;
    [self addToolBar];
    [self reloadImagesFromLibrary];
}

-(void)yvlan{
    if(!(_selectArray.count)){
        _chooseview = [UIAlertController alertControllerWithTitle:@"请选取图片"  message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        [_chooseview addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [self presentViewController:_chooseview animated:NO completion:nil];
    }
    else{
        ImageCount = (int)_selectArray.count;
        [self mengceng];
        //移除navigationBar
        [self.navigationController.navigationBar removeFromSuperview];
    }
    
    
}
-(void)mengceng{
    _mengView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,self.view.frame.size.height)];
    _mengView.backgroundColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    [self.view addSubview:_mengView];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, 375, 200)];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*3, 200);
    _scrollView.showsHorizontalScrollIndicator = NO;
    //设置当前scrollView显示中间区域
    _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width, 0);
    
    _scrollView.pagingEnabled = YES;
    
    backButton = [[UIButton alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [_mengView addSubview:backButton];
    
    //添加imageView
    //左
    _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    _leftImageView.contentMode= UIViewContentModeScaleAspectFill;
    [_scrollView addSubview:_leftImageView];
    //右
    _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, 200)];
    _rightImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_scrollView addSubview:_rightImageView];
    //中
    _middleImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, 200)];
    _middleImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_scrollView addSubview:_middleImageView];
    [_mengView addSubview:_scrollView];
    currentImage = 0;
    
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(375/2.0-10, 500, 375, 20)];
    label.text = [NSString stringWithFormat:@"%d/%d",currentImage,ImageCount];
    [_mengView addSubview:label];
    
    
    
    [self setImage];
    
    
    
}
-(void)back{
    [_scrollView removeFromSuperview];
    [_mengView removeFromSuperview];
}

-(void) setImage
{
    //    加载默认图片
    _leftImageView.image = _selectArray[ (ImageCount+currentImage-1)%ImageCount];
    _rightImageView.image = _selectArray[(currentImage+1)%ImageCount];
    _middleImageView.image = _selectArray[ currentImage];
    label.text = [NSString stringWithFormat:@"%d/%d",currentImage+1,ImageCount];
}




-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //如果向右滑动
    if (scrollView.contentOffset.x == SCREEN_WIDTH*2) {
        currentImage = (currentImage+1)%ImageCount;
        scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        [self setImage];
    }
    //如果向左滑动
    else if(scrollView.contentOffset.x == 0)
    {
        currentImage = (ImageCount+currentImage-1)%ImageCount;
        scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        [self setImage];
    }
}




-(void)wancheng{
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    [notification postNotificationName:@"array" object:self userInfo:@{@"pic":_selectArray}];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//增加工具栏
- (void)addToolBar{
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 623, 375, 44)];
    NSString * str=[NSString stringWithFormat:@"预览(%li)",[_selectArray count]];
    
    UIBarButtonItem *itemLeft = [[UIBarButtonItem alloc]initWithTitle:str style:UIBarButtonItemStyleDone target:self action:@selector(yvlan)];
    UIBarButtonItem *mid = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *itemRight = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(wancheng)];
    toolBar.items = @[itemLeft, mid, itemRight];
    [self.view addSubview:toolBar];
}

//当相册图片加载完毕时触发
- (void)layoutView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    _collectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, 375, 558) collectionViewLayout:layout];
    [_collectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _collectView.delegate = self;
    _collectView.dataSource = self;
    _collectView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_images count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //以下两步非常重要，大大减少内存的利用，移除之前的view
    UIView *viewR = [cell viewWithTag:100];
    [viewR removeFromSuperview];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 87.5, 87.5)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;//平铺
    imageView.clipsToBounds = YES;//去除交叉部分
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 87.5, 87.5)];
    view.tag = 100;
    [view addSubview:imageView];
    imageView.image = _images[indexPath.row];
    imageView.userInteractionEnabled = YES;//开启用户交互
    //图片右上角选择按钮
    UIButton *checkButton = [[UIButton alloc]initWithFrame:CGRectMake(62.5, 5, 20, 20)];
    if ([_selectedImageIndex containsObject:@(indexPath.row)]){
        [checkButton setImage:[UIImage imageNamed:@"iconfont-ck-true"] forState:UIControlStateNormal];
    }
    else{
        [checkButton setImage:[UIImage imageNamed:@"iconfont-xuanze"] forState:UIControlStateNormal];
    }
    [imageView addSubview:checkButton];
    checkButton.tag = indexPath.row;
    [checkButton addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.contentView addSubview: view];
    return cell;
}

//图片选择,取消选择
- (void)selectImage : (UIButton *)button{
    //取消选中
    if ([_selectedImageIndex containsObject:@(button.tag)]) {
        [_selectedImageIndex removeObject:@(button.tag)];
        [_selectArray removeObject:_images[button.tag]];
        [button setImage:[UIImage imageNamed:@"iconfont-xuanze"] forState:UIControlStateNormal];
        [self addToolBar];
    }
    //选中
    else
    {
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if ([user valueForKey:@"array"] != nil) {
            selectNum = [[user valueForKey:@"array"] intValue];
        }
        
        
        if([_selectedImageIndex count] == 9 ||[_selectedImageIndex count] >=(9-selectNum)){
            return;//最多选择9张
        }
        [_selectedImageIndex addObject:@(button.tag)];
        [button setImage:[UIImage imageNamed:@"iconfont-ck-true"] forState:UIControlStateNormal];
        [_selectArray addObject:_images[button.tag]];
        [self addToolBar];
        NSLog(@"%@",_saveArray);
        
        
    }
    NSLog(@"当前选中的图片数量: %ld", [_selectedImageIndex count]);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(87.5, 87.5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 0, 5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)reloadImagesFromLibrary
{
    self.images = [[NSMutableArray alloc] init];
    
    
    // 获取所有资源的集合，并按资源的创建时间排序
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];//抓取符合条件的，存到assetsFetchResults中，类似数组
    
    // 在资源的集合中获取其中的图片
    PHCachingImageManager *imageManager = [[PHCachingImageManager alloc] init];
    
    PHImageRequestOptions *RequestOptions = [[PHImageRequestOptions alloc]init];
    //开启同步（异步会执行1次或多次）
    RequestOptions.synchronous = YES;
    
    for (int i = 0; i < [assetsFetchResults count]; i++) {
        PHAsset *asset = assetsFetchResults[i];
        CGSize SomeSize = CGSizeMake(120, 120);//目标size
        [imageManager requestImageForAsset:asset targetSize:SomeSize contentMode:PHImageContentModeAspectFill options:RequestOptions resultHandler:^(UIImage *result, NSDictionary *info) {
            [_images addObject:result];
            
            //当相册所有图片加载完毕，开始布局界面
            if ([_images count] == [assetsFetchResults count]) {
                [self layoutView];
            }
        }];
        
}
    
    
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
