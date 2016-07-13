//
//  CurveView.m
//  CurveDemo
//
//  Created by William Zhang on 16/7/12.
//  Copyright © 2016年 williamz. All rights reserved.
//

#import "CurveView.h"
#import "CurveLayer.h"

@interface CurveView ()

@property (nonatomic, strong) CurveLayer *curveLayer;
@property (nonatomic, strong) CurveLayer *curveLayer2;

@end

@implementation CurveView

- (CGFloat)progress { return self.curveLayer.progress; }

- (void)setProgress:(CGFloat)progress
{
    self.curveLayer.progress  = progress;
    self.curveLayer2.progress = progress;
    
    [self.curveLayer setNeedsDisplay];
    [self.curveLayer2 setNeedsDisplay];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.curveLayer = [CurveLayer layer];
    self.curveLayer.frame = self.bounds;
    self.curveLayer.contentsScale = [UIScreen mainScreen].scale;
    self.curveLayer.progress = 0;
    [self.curveLayer setNeedsDisplay];
    
    [self.layer addSublayer:self.curveLayer];
    
    self.curveLayer2 = [CurveLayer layer];
    self.curveLayer2.frame = self.bounds;
    self.curveLayer2.contentsScale = [UIScreen mainScreen].scale;
    self.curveLayer2.progress = 0;
    [self.curveLayer2 setNeedsDisplay];
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    transform = CATransform3DRotate(transform, M_PI, 1, 0, 0);
    
    self.curveLayer2.transform = transform;
    
    [self.layer addSublayer:self.curveLayer2];
}

@end
