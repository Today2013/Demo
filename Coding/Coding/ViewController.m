//
//  ViewController.m
//  Coding
//
//  Created by TomatoPeter on 16/7/18.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "SS.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SS *ss = [[SS alloc] init];
    ss.name = @"测试";
    
    
    Student *student1 = [[Student alloc] initWithName:@"小名" and:@"42419920306" age:18 ss:ss];
    
    Student *student2 = [[Student alloc] initWithName:@"小明" and:@"42419920307" age:19 ss:ss];
    
    //进行归档
    NSArray *stuArray = [NSArray arrayWithObjects:student1, student2, nil];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:stuArray];
    NSLog(@"%@", data);
    
    //反归档
    NSArray *stuArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"%@", stuArray2);
    for (Student *stu in stuArray2) {
        NSLog(@"ss.name = %@", stu.ss.name);
    }
    
    
    
    //结论 对于对象里面拥有另一个自定义的对象的时候  如果需要归档的话就必须要把所有的对象都要进行归档处理  否则将会崩溃
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
