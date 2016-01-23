//
//  CommodityViewController.m
//  播报哥
//
//  Created by DC017 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "CommodityViewController.h"

@interface CommodityViewController (){

    NSArray *array ;
}

@end

@implementation CommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    array = @[@"商圈",@"洪合",@"濮院"];
    [self layout];

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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
