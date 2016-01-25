//
//  PostViewController.m
//  播报哥
//
//  Created by DC017 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>
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
    UIButton *_addPicButton;
    
    float nowHeight;
    float number;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:3 green:3 blue:4 alpha:0.9];
    number = 128;
    _bigScrollView.contentSize = CGSizeMake(375, 900);
    //list的内容
    _kindList = @[@"找货",@"招横机",@"招套口",@"招平车",@"招绣花",@"承接横机加工",@"承接套口加工",@"招工",@"找工作",@"求租",@"出租",@"转让店铺",@"转让其他",@"其他需求"];
    
//    _scrollView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    
    _quickInputButton.layer.cornerRadius = 10;
    _quickInputButton.layer.borderWidth = 0.3;
    _quickInputButton.layer.borderColor = [UIColor grayColor].CGColor;
    _clearButton.layer.cornerRadius = 10;
    _clearButton.layer.borderColor = [UIColor grayColor].CGColor;
    _clearButton.layer.borderWidth = 0.3;
    
    _putButton.layer.borderWidth = 0.1;
    _putButton.layer.cornerRadius = 10;
    _putButton.layer.borderColor = [UIColor whiteColor].CGColor;
    _putButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:54/255.0 blue:0.0 alpha:1.0];
    //提示字
    [self upText];
    
    [self addPic];
}
-(void)addPic{
    _picturenView = [[UIView alloc]initWithFrame:CGRectMake(5, 228, 365, number)];
    _picturenView.backgroundColor = [UIColor whiteColor];
    _addPicButton = [[UIButton alloc]initWithFrame:CGRectMake(8, 20, 81, 88)];
    _addPicButton.layer.borderWidth = 0.6;
    _addPicButton.layer.borderColor = [UIColor grayColor].CGColor;
    [_addPicButton setImage:[UIImage imageNamed:@"iconfont-wodedingdan"] forState:UIControlStateNormal];
    [_addPicButton addTarget:self action:@selector(addPicturebutton) forControlEvents:UIControlEventTouchUpInside];
    UILabel *addPicLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 68, _addPicButton.frame.size.width, 20)];
    addPicLable.text = @"添加图片";
    addPicLable.textAlignment = NSTextAlignmentCenter;
    
    
    [_addPicButton addSubview:addPicLable];
    [_picturenView addSubview:_addPicButton];
    [_sumScrollView addSubview:_picturenView];
}
-(void)changePic{
    nowHeight = _picturenView.frame.size.height;
    if (nowHeight > number) {
        _picturenView.frame = CGRectMake(_picturenView.frame.origin.x, _picturenView.frame.origin.y, nowHeight, _picturenView.frame.size.height);
    }
}
//提示字
-(void)upText{
    _contentView.delegate = self;
    _textLable = [[UILabel alloc]initWithFrame:CGRectMake(3, 2, _contentView.frame.size.width, 50)];
    _textLable.numberOfLines = 0;
    _textLable.enabled = NO;
    _textLable.text = @"详细描述几成新、购买时间，都有助于喜迎更多任关注哦！";
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
    _listView = [[UITableView alloc]initWithFrame:CGRectMake(97, 126, 269, 450) style:UITableViewStylePlain];
    _listView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.5];
    _listView.delegate = self;
    _listView.dataSource = self;
    [self.view addSubview:_listView];
}
//清除按钮
- (IBAction)clearbutton:(id)sender {
    _contentView.text = nil;
}
//快捷输入
- (IBAction)quickInputbutton:(id)sender {
}
//添加图片
- (void)addPicturebutton{
    _chooseview = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [_chooseview addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:nil]];
    [_chooseview addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:nil]];
    [_chooseview addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:_chooseview animated:NO completion:nil];
}
//发布
- (IBAction)putbutton:(id)sender {
    if ([_contentView.text isEqualToString: @""])
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
@end
