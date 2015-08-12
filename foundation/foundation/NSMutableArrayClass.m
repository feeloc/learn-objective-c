//
// Created by hujianmeng on 15/8/12.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import "NSMutableArrayClass.h"
#import "People.h"

@implementation NSMutableArrayClass
+ (void)demo {
    //自定义类
    /**
    * alloc方法申请内存空间
    * initWithName是自定义的初使化方法
    */
    People *p1 = [[People alloc] initWithName:@"张三"];
    People *p2 = [[People alloc] initWithName:@"王五"];

    //使用new初使化对象
    People *p3 = [[People new] initWithName:@"new 出来的"];

    //直接初使化
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:p1, p1, NULL];
    for (People *p in array) {
        NSLog(@"直接初使化：%@", p.personName);
    }

    //后续动态添加
    NSMutableArray *array1 = [[NSMutableArray alloc] init];
    [array1 addObject:p1];
    [array1 addObject:p2];
    //从数组添加元素
    [array1 addObjectsFromArray:array];
    for (People *p in array1) {
        NSLog(@"后续添加元素：%@", p.personName);
    }

    //删除最后一个元素
    [array1 removeLastObject];
    NSLog(@"删除最后一个元素后：%@", array1);

    //删除指定下标的元素
    [array1 removeObjectAtIndex:0];
    NSLog(@"删除第一个元素后：%@", array1);

    //交换指定下标的元素
    [array1 exchangeObjectAtIndex:0 withObjectAtIndex:1];
    NSLog(@"交换完后：%@", array1);

    //删除所有元素
    [array1 removeAllObjects];
    NSLog(@"删除所有元素后：%@", array1);

}
@end