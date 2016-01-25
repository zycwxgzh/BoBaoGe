//
//  CommodityViewController.m
//  播报哥
//
//  Created by DC017 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "CommodityViewController.h"
#import "HomeViewController.h"

@interface CommodityViewController (){

    NSArray *array ;
}

@end

@implementation CommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    array = @[@"商圈",@"洪合",@"濮院"];
    [self layout];
    
    self.navigationController.navigationBar.topItem.title = self.tabBarController.tabBar.items[1].title;
    
    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"商圈（颜色）"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:255/255.0 green:54/255.0 blue:0.0 alpha:1.0];

    


}

-(void)layout{

    _tableview.rowHeight = 50;
    _tableview.dataSource = self;
    _tableview.delegate = self;
    
}



//cell的个数
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return array.count;
}

//绘制cell

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"
                ];
    }
    cell.textLabel.text = array[indexPath.row];
    

        
    
    return cell;
    
}

//cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0 ){
        
        self.tabBarItem.title = @"商圈";
        self.navigationController.navigationBar.topItem.title  = @"商圈";
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:@"商圈" forKey:@"selectedArea"];
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        HomeViewController *home = [storyBoard instantiateViewControllerWithIdentifier:@"home"];
        [self.navigationController presentViewController:home animated:NO completion:nil];
        
        
        
    }else if (indexPath.row == 1){
        
        self.tabBarItem.title = @"洪合";
        self.navigationController.navigationBar.topItem.title  = @"洪合";
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:@"洪合" forKey:@"selectedArea"];
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        HomeViewController *home = [storyBoard instantiateViewControllerWithIdentifier:@"home"];
        [self.navigationController presentViewController:home animated:NO completion:nil];
        
    }else if (indexPath.row == 2){
        
        self.tabBarItem.title = @"濮院";
        self.navigationController.navigationBar.topItem.title  = @"濮院";
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:@"濮院" forKey:@"selectedArea"];
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        HomeViewController *home = [storyBoard instantiateViewControllerWithIdentifier:@"home"];
        [self.navigationController presentViewController:home animated:NO completion:nil];
        
        
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
