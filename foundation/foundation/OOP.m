//
// Created by hujianmeng on 15/8/12.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import "OOP.h"
#import "People.h"

@implementation OOP
+ (void)demo {
    People *people = [[People alloc] initWithName:@"张三"];

    [people setName:@"haha"];

    NSLog(@"%@", [people getName]);
    NSLog(@"直接访问属性name：%@", people.name);

    /**
    * []调用方法
    *
    * 类方法，静态方法，加号 +
    * 对象方法，动态方法，减号 -
    *
    */

    NSLog(@"静态方法%@", [People showName]);
    NSLog(@"动态方法%@", [people showName]);
}
@end