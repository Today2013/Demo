//
//  ViewController.m
//  JSPatch
//
//  Created by TomatoPeter on 16/7/15.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)loadButtonClicked:(id)sender {
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    [btn setTitle:@"Push JPTableViewController" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:btn];
}
- (void)handleBtn:(id)sender{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//内存警告的处理
- (IBAction)memoryButtonClicked:(id)sender {
    
    
    
//    兼容iOS 5 与 iOS 6
//    好吧，重点来了，倘若希望程序兼容iOS 5 与 iOS 6怎么办呢？ 这里有一个小技巧，我们需要对didReceiveMemoryWarning 做一些手脚：
//#pragma mark -
//#pragma mark Memory management
//    
//    - (void)didReceiveMemoryWarning
//    {
//        [super didReceiveMemoryWarning];
//        
//        if ([self isViewLoaded] && self.view.window == nil) {
//            self.view = nil;
//        }
//        
//        dataArray = nil;
//    }
//    
//    判断一下view是否是window的一部分，如果不是，那么可以放心的将self.view 置为空，以换取更多可用内存。
//    
//    这样会是什么现象呢？假如，从view controller A 跳转到 view controller B ,然后模拟low-memory警告，此时，view controller A 将会执行self.view = nil ; 当我们从 B 退回 A 时， A 会重新调用一次 viewDidLoad ，此时数据全部重新创建，简单兼容无压力～～
}
@end
