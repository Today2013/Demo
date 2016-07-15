//
//  ViewController.m
//  GradientLayer
//
//  Created by TomatoPeter on 16/7/13.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CAGradientLayer可以方便的处理颜色渐变。
    CAGradientLayer *layer = [CAGradientLayer layer];
//    渐变颜色的数组
    layer.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor grayColor].CGColor, (id)[UIColor blueColor].CGColor];
//    渐变颜色的区间分布，locations的数组长度和color一致，这个值一般不用管它，默认是nil，会平均分布。  自我理解：（此处的意思是把左上角的点看作（0，0），右下角的点看作（1，1））
    layer.locations = @[@0.2, @0.5, @0.8];
    layer.frame = self.view.bounds;
//    映射locations中第一个位置，用单位向量表示，比如（0，0）表示从左上角开始变化。默认值是(0.5,0.0)。
    layer.startPoint = CGPointMake(0.5, 0.5);
//    映射locations中最后一个位置，用单位向量表示，比如（1，1）表示到右下角变化结束。默认值是(0.5,1.0)。
    layer.endPoint = CGPointMake(1, 1);
    //表示像素均匀变化  只有这么一个值
    layer.type = kCAGradientLayerAxial;
    [self.view.layer addSublayer:layer];
    
    //将开始点和结束点连接在一起，上面的颜色的变化是根据其变化的  而开始之前的颜色都是colors中的第一个颜色值
    
}
- (IBAction)loadButtonclicked:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
