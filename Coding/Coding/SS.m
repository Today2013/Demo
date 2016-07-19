//
//  SS.m
//  Coding
//
//  Created by TomatoPeter on 16/7/18.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

#import "SS.h"

@implementation SS
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}
@end
