//
//  ExpextTable.m
//  PreToto
//
//  Created by Ken Oura on 2013/11/06.
//  Copyright (c) 2013年 Ken Oura. All rights reserved.
//

#import "ExpextTable.h"

@implementation ExpextTable

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();  // コンテキストを取得

    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0); // 色

    CGContextSetLineWidth(context, 2.0); // 太さ
    CGContextMoveToPoint(context, 20, 100);  // 始点
    CGContextAddLineToPoint(context, 20, 520); // 終点
    CGContextMoveToPoint(context, 80, 100);  // 始点
    CGContextAddLineToPoint(context, 80, 520); // 終点
    CGContextMoveToPoint(context, 230, 100);  // 始点
    CGContextAddLineToPoint(context, 230, 520); // 終点
    CGContextMoveToPoint(context, 300, 130);  // 始点
    CGContextAddLineToPoint(context, 300, 520); // 終点
    CGContextMoveToPoint(context, 20, 100);  // 始点
    CGContextAddLineToPoint(context, 230, 100); // 終点
    CGContextMoveToPoint(context, 20, 130);  // 始点
    CGContextAddLineToPoint(context, 300, 130); // 終点
    CGContextMoveToPoint(context, 20, 520);  // 始点
    CGContextAddLineToPoint(context, 300, 520); // 終点

    CGContextStrokePath(context);  // 描画

    CGContextSetLineWidth(context, 1.0); // 太さ
    CGContextMoveToPoint(context, 110, 130);  // 始点
    CGContextAddLineToPoint(context, 110, 520); // 終点
    CGContextMoveToPoint(context, 170, 130);  // 始点
    CGContextAddLineToPoint(context, 170, 520); // 終点
    CGContextMoveToPoint(context, 20, 220);  // 始点
    CGContextAddLineToPoint(context, 300, 220); // 終点
    CGContextMoveToPoint(context, 20, 310);  // 始点
    CGContextAddLineToPoint(context, 300, 310); // 終点
    CGContextMoveToPoint(context, 20, 400);  // 始点
    CGContextAddLineToPoint(context, 300, 400); // 終点

    CGContextStrokePath(context);  // 描画
}

@end
