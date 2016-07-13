//
//  ViewController.m
//  CurveDemo
//
//  Created by William Zhang on 16/7/12.
//  Copyright © 2016年 williamz. All rights reserved.
//

#import "ViewController.h"
#import "CurveView.h"

@interface ViewController ()

@property (nonatomic, strong) CurveView *curveView;
@property (nonatomic, assign) BOOL isLoading;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _curveView = [[CurveView alloc] initWithFrame:CGRectMake(0, 0, 30, 64)];
    _curveView.center = self.view.center;
    _curveView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_curveView];

}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    _curveView.progress = sender.value;
    if (_curveView.progress == 1 && !self.isLoading)
    {
        [self startLoading];
    }
    else if (self.isLoading)
    {
        [self stopLoading];
    }
}

- (void)startLoading
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue        = @(M_PI * 2);
    animation.duration       = 1.0f;
    animation.repeatCount    = HUGE_VALF;
    animation.autoreverses   = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_curveView.layer addAnimation:animation forKey:nil];
    _isLoading = YES;
}

- (void)stopLoading
{
    [_curveView.layer removeAllAnimations];
    _isLoading = NO;
}

@end
