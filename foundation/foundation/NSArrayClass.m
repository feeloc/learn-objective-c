//
// Created by hujianmeng on 15/8/12.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import "NSArrayClass.h"


@implementation NSArrayClass
+ (void)demo {
    // 只能存放对象，可以存储不同类型的对象
    NSArray *array = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", NULL];

    //数组长度
    NSLog(@"数组长度是：%ld", array.count);

    //是否含有否个对象
    BOOL isHas = [array containsObject:@"2"];
    if (isHas) {
        NSLog(@"包含");
    } else {
        NSLog(@"不包含");
    }

    //最后一个元素
    NSLog(@"最后一个元素是：%@", [array lastObject]);

    //第一个元素
    NSLog(@"第一人元素是：%@", [array firstObject]);

    //指定下标的元素
    NSLog(@"第2个元素是：%@", [array objectAtIndex:1]);

    //查找元素的下标
    NSLog(@"元素3的下标是：%ld", [array indexOfObject:@"3"]);

    /*
     * 数组遍历
     *
     * 1、for循环
     * 2、for in 枚举
     * 3、枚举器，迭代器
     *
     */

    //for 循环
    for (int i = 0; i < array.count; i++) {
        NSLog(@"第%d个元素是：%@", i + 1, [array objectAtIndex:i]);
    }

    //for in 枚举
    //数组中元素类型的类型要一致
    for (NSObject *v in array) {
        NSLog(@"%@", v);
    }

    //枚举器
    NSEnumerator *enumerator = [array objectEnumerator];
    id obj;
    int index = 0;
    while (obj = [enumerator nextObject]) {
        NSLog(@"枚举器，第%d个元素是：%@", ++index, obj);
    }

    //enumerator block
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"枚举器，第%d个元素是：%@", ++idx, obj);
    }];
}
@end