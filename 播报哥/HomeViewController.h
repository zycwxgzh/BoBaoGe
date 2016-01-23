//
//  HomeViewController.h
//  播报哥
//
//  Created by DC017 on 16/1/18.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCell.h"
#import "DetailViewController.h"

@interface HomeViewController : UIViewController
@property(nonatomic,strong) HomeTableViewCell *homeCell;
@property(nonatomic,strong) DetailViewController *detailViewController;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *searchInformatiion;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageController;

- (IBAction)search:(id)sender;

- (IBAction)sortSearch:(id)sender;

@end
