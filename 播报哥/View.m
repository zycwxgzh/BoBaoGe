//
//  View.m
//  播报哥
//
//  Created by DC-002 on 16/1/20.
//  Copyright © 2016年 叶朝香. All rights reserved.
//

#import "View.h"

@implementation View

-(void)drawRect:(CGRect)rect
{
    [self drawLine];
}

-(void)drawLine
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 30, 214);
    CGContextAddLineToPoint(ctx, 335, 214);
    CGContextClosePath(ctx);
    CGContextSetRGBStrokeColor(ctx,0,1,0,1);
    [[UIColor greenColor]set];
    CGContextFillPath(ctx);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
