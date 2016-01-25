//
//  Model.m
//  播报哥
//
//  Created by DC-002 on 16/1/25.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "Model.h"

@implementation Model
- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)blogWithDict:(NSDictionary *)dict{
    
    return  [[self alloc]initWithDict:dict];
}
@end
