//
//  Model.h
//  播报哥
//
//  Created by DC-002 on 16/1/25.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ContentView.h"

@interface Model : NSObject
@property(nonatomic,copy)NSString *sort;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *description1;
@property(nonatomic,copy)NSMutableArray *picture;

//@property(nonatomic,strong) ContentView *contentView;



- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)blogWithDict:(NSDictionary *)dict;
@end
