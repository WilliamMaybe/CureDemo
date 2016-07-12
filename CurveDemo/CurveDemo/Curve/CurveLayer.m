//
//  CurveLayer.m
//  CurveDemo
//
//  Created by William Zhang on 16/7/12.
//  Copyright © 2016年 williamz. All rights reserved.
//

#import "CurveLayer.h"
#import <UIKit/UIKit.h>

#define HALF_HEIGHT (self.frame.size.height / 2.0)

#define DEGREE M_PI / 3

#define MARGIN 5

#define LINE_LENGTH 30

#define SPACE 1

@implementation CurveLayer

- (void)drawInContext:(CGContextRef)ctx
{
    [super drawInContext:ctx];
    
    UIGraphicsPushContext(ctx);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath *arrowPath = [UIBezierPath bezierPath];
    
    UIBezierPath *linePath1 = [UIBezierPath bezierPath];
    linePath1.lineWidth = 2;
    linePath1.lineCapStyle = kCGLineCapRound;
    linePath1.lineJoinStyle = kCGLineJoinRound;
    
    CGFloat radius = MIN(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) / 2 - MARGIN;
    radius = 10;
    
    if (self.progress <= 0.5)
    {
        // 左边与箭头接触的点
        CGPoint point1 = CGPointMake(MARGIN, HALF_HEIGHT * self.progress * 2 + SPACE);
        [linePath1 moveToPoint:point1];
        [linePath1 addLineToPoint:CGPointMake(MARGIN, HALF_HEIGHT * self.progress * 2 - LINE_LENGTH  + SPACE)];
        
        [arrowPath moveToPoint:point1];
        [arrowPath addLineToPoint:CGPointMake(point1.x - 3 * sin(DEGREE), point1.y - 3 * cos(DEGREE))];
        [linePath1 appendPath:arrowPath];
    }
    
    else
    {
        // 左边最上面的点
        CGPoint point1 = CGPointMake(MARGIN, HALF_HEIGHT - LINE_LENGTH * (1 - self.progress) * 2 + SPACE);
        
        [linePath1 moveToPoint:point1];
        [linePath1 addLineToPoint:CGPointMake(MARGIN, HALF_HEIGHT - SPACE)];
        [linePath1 addArcWithCenter:CGPointMake(CGRectGetWidth(self.frame) / 2, HALF_HEIGHT + SPACE) radius:radius startAngle:M_PI endAngle:M_PI - M_PI * 0.9 * (self.progress - 0.5) * 2 clockwise:NO];
        
        CGPoint currentPoint = linePath1.currentPoint;
        [arrowPath moveToPoint:currentPoint];
        
        CGFloat offsetDegree = DEGREE + M_PI * 0.9 * (self.progress - 0.5) * 2;
        
        [arrowPath addLineToPoint:CGPointMake(currentPoint.x - 3 * sin(offsetDegree), currentPoint.y - 3 * cos(offsetDegree))];
        [linePath1 appendPath:arrowPath];
    }

    CGContextSaveGState(context);
    CGContextRestoreGState(context);
    
    [[UIColor blackColor] setStroke];
    [linePath1 stroke];
    
    UIGraphicsPopContext();

}

@end
