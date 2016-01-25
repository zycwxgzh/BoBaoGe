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
#import "LoadViewController.h"
#import "SortSearchViewController.h"
#import "PostViewController.h"

@interface HomeViewController : UIViewController
@property(nonatomic,strong) HomeTableViewCell *homeCell;
@property(nonatomic,strong) DetailViewController *detailViewController;
@property(nonatomic,strong) LoadViewController *loadViewController;
@property(nonatomic,strong) SortSearchViewController *sortSearchViewController;
@property(nonatomic,strong) PostViewController *postViewController;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *searchInformatiion;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollerView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageController;


- (IBAction)addMessage:(id)sender;

- (IBAction)sortSearch:(id)sender;


@property(nonatomic, strong)NSString *selectedArea;


@end
