//
//  PostViewController.m
//  播报哥
//
//  Created by DC017 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "PostViewController.h"
#import "InputViewController.h"
#import "AlbumViewController.h"

@interface PostViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIImagePickerControllerDelegate>
{
    //种类列表
    UITableView *_listView;
    //种类数组
    NSArray *_kindList;
    //提示字内容
    UILabel *_textLable;
    //图片来源选择
    UIAlertController *_chooseview;
    
    //添加图片
    UIView *_picturenView;
    
    //添加图片按钮
    NSMutableArray *arrayPic;
    float nowHeight;
    //通知中心
    NSNotificationCenter *_noti;
    NSMutableArray *_saveArray;
    
    //添加图片
    UIButton *addPicButton;
    UILabel *addPicLable;
    UIImageView *PicimageView;
    int num;
    BOOL textNum;
}
@property (nonatomic,strong) UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property(nonatomic, strong)UIImagePickerController *imagePicker;
@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    textNum = YES;
    self.view.backgroundColor = [UIColor colorWithRed:3 green:3 blue:4 alpha:0.9];
    
    arrayPic = [NSMutableArray array];
    _noti=[NSNotificationCenter defaultCenter];
    [_noti addObserver:self selector:@selector(stateChange:) name:@"array"  object:nil];
    
    _scrollView.contentInset = UIEdgeInsetsMake(45, 0, 0, 0);//scrollView
    //list的内容
    _kindList = @[@"找货",@"招横机",@"招套口",@"招平车",@"招绣花",@"承接横机加工",@"承接套口加工",@"招工",@"找工作",@"求租",@"出租",@"转让店铺",@"转让其他",@"其他需求"];
    
    //    _scrollView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    
    _quickInputButton.layer.cornerRadius = 3;
    _quickInputButton.layer.borderWidth = 0.3;
    _quickInputButton.layer.borderColor = [UIColor grayColor].CGColor;
    _clearButton.layer.cornerRadius = 3;
    _clearButton.layer.borderWidth = 0.3;
    _clearButton.layer.borderColor = [UIColor grayColor].CGColor;
    
    
    _putButton.layer.borderWidth = 0.1;
    _putButton.layer.cornerRadius = 10;
    _putButton.layer.borderColor = [UIColor whiteColor].CGColor;
    _putButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:54/255.0 blue:0.0 alpha:1.0];
    
    NSUserDefaults *userpic = [NSUserDefaults standardUserDefaults];
    [userpic setValue:@"" forKey:@"arrayInput"];
    
    //提示字
    [self upText];
    
    [self layout];
}
- (void)addPic {
    _chooseview = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [_chooseview addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        AlbumViewController *album = [[AlbumViewController alloc]init];
        [self presentViewController:album animated:YES completion:nil];
    }]];
    
    [_chooseview addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker=[[UIImagePickerController alloc]init];
        [_imagePicker setDelegate:(id)self];
        [_imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [_imagePicker setAllowsEditing:YES];
        [self presentViewController:_imagePicker animated:YES completion:nil];
        
    }]];
    [_chooseview addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:_chooseview animated:NO completion:nil];
}
-(void)layout
{
    addPicButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 30, 100, 100)];
    
    addPicButton.layer.borderColor = [UIColor grayColor].CGColor;
    addPicButton.layer.borderWidth = 2;
    [addPicButton setImage:[UIImage imageNamed:@"照相机"] forState:UIControlStateNormal];
    [addPicButton addTarget:self action:@selector(addPic) forControlEvents:UIControlEventTouchUpInside];
    addPicLable = [[UILabel alloc]initWithFrame:CGRectMake(15, 60, 100, 20)];
    addPicLable.text = @"添加图片";
    addPicLable.font = [UIFont fontWithName:@"Arial" size:13];
    
    //手机View
    _phoneView = [[UIView alloc]initWithFrame:CGRectMake(0, 360, 375, 50)];
    _phoneView.backgroundColor = [UIColor whiteColor];
    _phoneImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 10, 30, 30)];
    _phoneImage.image = [UIImage imageNamed:@"手机"];
    _phoneLable = [[UILabel alloc]initWithFrame:CGRectMake(65, 0, 50, 50)];
    _phoneLable.text = @"手 机";
    _phoneLable.font = [UIFont systemFontOfSize:20];
    _phoneNumberLable = [[UILabel alloc]initWithFrame:CGRectMake(120, 0, 100, 50)];
    [_phoneView addSubview:_phoneNumberLable];
    [_phoneView addSubview:_phoneLable];
    [_phoneView addSubview:_phoneImage];
    [_bigScrollView addSubview:_phoneView];
    
    //发布
    _putButton = [[UIButton alloc]initWithFrame:CGRectMake(375/4, 480, 200, 40)];
    _putButton.backgroundColor = [UIColor colorWithRed:225/225.0 green:59/225.0 blue:10/225.0 alpha:1];
    [_putButton setTitle:@"发 布" forState:UIControlStateNormal];
    _putButton.layer.cornerRadius = 20;
    [_putButton addTarget:self action:@selector(putbutton) forControlEvents:UIControlEventTouchUpInside];
    
    [_bigScrollView addSubview:_putButton];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 230, 375, 120) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor=[UIColor whiteColor];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    [addPicButton addSubview:addPicLable];
    [_collectionView addSubview:addPicButton];
    [_bigScrollView addSubview:_collectionView];
    
}

-(void)stateChange : (NSNotification *)note{
    _saveArray = note.userInfo[@"pic"];
    num = (int)_saveArray.count;
    NSLog(@"%@", arrayPic);
    for (int a = 0; a<_saveArray.count; a++) {
        [arrayPic addObject:_saveArray[a]];
    }
    NSUserDefaults *userNumpic= [NSUserDefaults standardUserDefaults];
    [userNumpic setValue:@(arrayPic.count) forKey:@"array"];
    [_collectionView reloadData];
    [self relayout];
}

-(void)viewDidAppear:(BOOL)animated{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    
    NSString *string = [user valueForKey:@"arrayInput"];
    NSString *str = [NSString stringWithFormat:@"%@", string];
    if (![str isEqualToString:@"0"]) {
        _contentView.text = string;
        
        if (!(textNum)) {
            _textLable.attributedText = nil;
            textNum =YES;
        }
        else{
            textNum = NO;
            
            
        }
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (arrayPic.count <=8) {
        return arrayPic.count+1;
    }
    else if(arrayPic.count >9){
        return 9;
    }
    return arrayPic.count;
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    
    if (indexPath.row < arrayPic.count) {
        PicimageView=[[UIImageView alloc]init];
        PicimageView.image =arrayPic[indexPath.row];
        cell.backgroundView = PicimageView;
        ;
        //        [self layout];
        return cell;
    }else{
        cell.backgroundView= addPicButton;
        return cell;
    }
    return nil;
}

-(void)relayout{
    CGRect rect = _collectionView.frame;
    CGRect rectI = _phoneView.frame;
    CGRect rectII = _putButton.frame;
    if (arrayPic.count == 1 || arrayPic.count == 2  ) {
        rect.size.height = 120;
        rectI.origin.y = 360;
        rectII.origin.y = 480;
    }
    else if ( arrayPic.count == 3 ||arrayPic.count == 4 || arrayPic.count == 5){
        rect.size.height = 200;
        rectI.origin.y = 440;
        rectII.origin.y = 580;
        _bigScrollView.contentSize = CGSizeMake(375, 650);
    }
    else if (  arrayPic.count == 6||arrayPic.count == 7 || arrayPic.count == 8 || arrayPic.count == 9){
        rect.size.height = 290;
        rectI.origin.y = 530;
        rectII.origin.y = 680;
        _bigScrollView.contentSize = CGSizeMake(375, 750);
        
    }
    _collectionView.frame= rect;
    _phoneView.frame =rectI;
    _putButton.frame = rectII;
    [_collectionView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(80,80);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%li",(long)indexPath.row);
    
    if (indexPath.row == arrayPic.count) {
        [self addPic];
    }
    else{
        _chooseview = [UIAlertController alertControllerWithTitle:@"删除" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        [_chooseview addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [_chooseview addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [arrayPic removeObjectAtIndex:indexPath.row];
            [ _collectionView reloadData];
            [self relayout];
        }]];
        [self presentViewController:_chooseview animated:NO completion:nil];
    }
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
    return UIEdgeInsetsMake(20, 30, 0, 20);
}


//提示字
-(void)upText{
    NSString *str = @"详细描述几成新、购买时间，都有助于喜迎更多人关注哦(内容控制在90个字之内)";
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc]initWithString:str];
    [mutableAttributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(25, 13)];
    _contentView.delegate = self;
    _textLable = [[UILabel alloc]initWithFrame:CGRectMake(3, 2, _contentView.frame.size.width, 50)];
    _textLable.numberOfLines = 0;
    _textLable.enabled = NO;
    _textLable.attributedText = mutableAttributedString;
    _textLable.textColor = [UIColor lightGrayColor];
    
    [_contentView addSubview:_textLable];
}
-(void)textViewDidChange:(UITextView *)textView{
    if ([_contentView.text length] == 0) {
        [_textLable setHidden:NO];
    }else{
        [_textLable setHidden:YES];
    }
}
#pragma mark -------tableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 14;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = _kindList[indexPath.row];
    return cell;
}
//cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //向listLable传值
    _titleLable.text = _kindList[indexPath.row];
    //点击之后移除tableView
    [_listView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//打开列表
- (IBAction)titlebutton:(id)sender {
    NSLog(@"打开列表");
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height-64-44)];
    
    [backButton addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
    
    _listView = [[UITableView alloc]initWithFrame:CGRectMake(90, 50, 269, 450) style:UITableViewStylePlain];
    _listView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.5];
    _listView.delegate = self;
    _listView.dataSource = self;
    
    [self.view addSubview:backButton];
    [backButton addSubview:_listView];

}-(void)clickBack:(UIButton *)button{
    [_listView removeFromSuperview];
    button.hidden = YES;
}
//清除按钮
- (IBAction)clearbutton:(id)sender {
    _contentView.text = nil;
}
//快捷输入
- (IBAction)quickInputbutton:(id)sender {
    //    inputViewController *input = [[inputViewController alloc]init];
    //    [self presentViewController:input animated:YES completion:nil];
}


//发布
- (void)putbutton{
    if ([_contentView.text isEqualToString: @""] || [_phoneLable.text isEqualToString:@""])
    {
        UIAlertController *publishGo = [UIAlertController alertControllerWithTitle:@"内容不能为空，请重新输入！" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [publishGo addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:publishGo animated:NO completion:nil];
    }else{
        UIAlertController *publishGo = [UIAlertController alertControllerWithTitle:@"发布成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [publishGo addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:publishGo animated:NO completion:nil];
    }
}


-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
