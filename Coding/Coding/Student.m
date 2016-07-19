//
//  Student.m
//  Coding
//
//  Created by TomatoPeter on 16/7/18.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

#import "Student.h"
#import "SS.h"
@implementation Student
//初始化学生类
- (Student *)initWithName:(NSString *)newName
                      and:(NSString *)newID
                      age:(NSInteger)age
                       ss:(SS *)ss
{
    if (self = [super init]) {
        self.name = newName;
        self.ID = newID;
        self.age = age;
        self.ss = ss;
    }
    return self;
}
//学生类内部的两个属性变量分别转码
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.ID forKey:@"ID"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeObject:self.ss forKey:@"ss"];
}
//分别把两个属性变量根据关键字进行逆转码，最后返回一个Student类的对象
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.ID = [aDecoder decodeObjectForKey:@"ID"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.ss = [aDecoder decodeObjectForKey:@"ss"];
    }
    return self;
}
@end
