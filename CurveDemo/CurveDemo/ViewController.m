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
    _curveView.pogress = sender.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
