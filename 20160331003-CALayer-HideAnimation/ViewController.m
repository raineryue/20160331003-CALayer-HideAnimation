//
//  ViewController.m
//  20160331003-CALayer-HideAnimation
//
//  Created by Rainer on 16/3/31.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

#define angle2radion(angle) (angle) / 180 * 2

/**
 *  这里做一些Layer层的隐式动画的测试
 *  隐式动画只能发生在非根层，也就是必须是手动创建的layer才能有隐式动画
 */
@interface ViewController ()

@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建一个CALayer对象
    self.layer = [[CALayer alloc] init];

    // 2.设置对象属性
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    // 设置原点
    self.layer.position = CGPointMake(160, 300);
    // 设置锚点（将锚点从layer的中心位置设置到原点）
//    self.layer.anchorPoint = CGPointZero;
    self.layer.bounds = CGRectMake(0, 0, 50, 50);
    
    // 3.将对象添加到控制器视图的layer层上
    [self.view.layer addSublayer:self.layer];
}

/**
 *  这里改变一些属性 这些属性带有隐藏动画
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.layer.transform = CATransform3DMakeTranslation(50, 50, 0);
    
    self.layer.transform = CATransform3DMakeRotation(angle2radion(arc4random_uniform(360) + 1), 0, 0, 1);
    
    self.layer.position = CGPointMake(arc4random_uniform(200) + 20, arc4random_uniform(400) + 50);
    
    self.layer.cornerRadius = arc4random_uniform(50);
    
    self.layer.backgroundColor = [self randomColor].CGColor;
    
    self.layer.borderColor = [self randomColor].CGColor;
    self.layer.borderWidth = arc4random_uniform(10);
}

- (UIColor *)randomColor {
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
