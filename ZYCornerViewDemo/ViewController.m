//
//  ViewController.m
//  ZYCornerViewDemo
//
//  Created by Daniel on 2016/11/22.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "ViewController.h"
#import "ZYCornerView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ZYCornerView *corView1;
@property (weak, nonatomic) IBOutlet ZYCornerView *corView2;
@property (weak, nonatomic) IBOutlet ZYCornerView *corView3;
@property (weak, nonatomic) IBOutlet ZYCornerView *corView4;
@property (weak, nonatomic) IBOutlet ZYCornerView *corView5;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _corView1.titleLabel.text = @"优惠";
    _corView1.positionType = 0;
    
    _corView2.titleLabel.text = @"独孤求败";
    _corView2.positionType = 1;
    
    _corView3.titleLabel.text = @"Prisoner";
    _corView3.cornerColor = [UIColor orangeColor];
    _corView3.positionType = 2;
    
    _corView4.titleLabel.text = @"Love";
    _corView4.cornerColor = [UIColor orangeColor];
    _corView4.positionType = 3;
    
    _corView5.titleLabel.text = @"IMAX";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
