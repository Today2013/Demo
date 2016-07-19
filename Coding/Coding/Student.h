//
//  Student.h
//  Coding
//
//  Created by TomatoPeter on 16/7/18.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SS;
@interface Student : NSObject<NSCoding>
@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *ID;
@property(nonatomic, assign)NSInteger age;
@property(nonatomic, strong)SS *ss;
- (Student *)initWithName:(NSString *)newName
                      and:(NSString *)newID
                      age:(NSInteger)age
                       ss:(SS *)ss;
@end
