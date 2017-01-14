//
//  ViewController.m
//  Animation
//
//  Created by Kenvin on 15/6/14.
//  Copyright © 2017年 上海乐住信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

/*
 CABasicAnimation使用总结 
 
 实例化
 
 使用方法animationWithKeyPath:对 CABasicAnimation进行实例化，并指定Layer的属性作为关键路径进行注册。
 
 设定动画的属性和说明
 
 属性	说明
 duration	动画的时长
 repeatCount	重复的次数。不停重复设置为 HUGE_VALF
 repeatDuration	设置动画的时间。在该时间内动画一直执行，不计次数。
 beginTime	指定动画开始的时间。从开始延迟几秒的话，设置为【CACurrentMediaTime() + 秒数】 的方式
 timingFunction	设置动画的速度变化
 autoreverses	动画结束时是否执行逆动画
 fromValue	所改变属性的起始值
 toValue	所改变属性的结束时的值
 byValue	所改变属性相同起始值的改变量
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*
     layer动画运行的过程是怎样的？其实在我们给一个视图添加layer动画时，真正移动并不是我们的视图本身，而是 presentation layer 的一个缓存。动画开始时 presentation layer开始移动，原始layer隐藏，动画结束时，presentation layer从屏幕上移除，原始layer显示。这就解释了为什么我们的视图在动画结束后又回到了原来的状态，因为它根本就没动过。
     */
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    transformAnima.fromValue = @(M_PI_2);
    transformAnima.toValue   = @(M_PI);
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transformAnima.autoreverses = YES;
    transformAnima.repeatCount = 0;
    transformAnima.beginTime = CACurrentMediaTime() + 2;
    transformAnima.removedOnCompletion = NO;
    transformAnima.fillMode = kCAFillModeForwards;
    
    [self.imageView.layer addAnimation:transformAnima forKey:@"A"];
    
    // Do any additional setup after loading the view, typically from a nib.
}


@end
