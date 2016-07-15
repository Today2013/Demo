//
//  ViewController.m
//  CATransaction
//
//  Created by TomatoPeter on 16/7/13.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //图层的每个改变都是事务的一部分，
// CATransaction是核心动画类    它负责成批的把多个图层数的修改作为一个原子更新到渲染树。Animations on the root layer of a view are disabled by default ”
//     所以，不能直接对root layer进行操作，所以如果想要出效果，必须寻其他途径，比如可以加一层layer或者选其他的api用喽~
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [CATransaction begin];
        //
        [CATransaction setValue:[NSNumber numberWithFloat:10.0] forKey:kCATransactionAnimationDuration];
        layer.position = CGPointMake(100, 100);
        CATransform3D scale = CATransform3DMakeScale(2.1f, 2.1f, 2.0f);
        CATransform3D rotate = CATransform3DMakeRotation(1.57f, 0.0f, 0.0f, 1.0f);
        CATransform3D combine = CATransform3DConcat(rotate, scale);
        
        [layer setTransform:combine];
        [CATransaction commit];
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
