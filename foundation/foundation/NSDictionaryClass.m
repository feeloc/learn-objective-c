//
// Created by hujianmeng on 15/8/12.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import "NSDictionaryClass.h"


@implementation NSDictionaryClass
+ (void)demo {
    /**
    * 字典在内存中是不连续的
    * key value对应
    * kvc 键值编码
    */

    //初使化
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:@"aaa" forKey:@"b"];
    NSLog(@"%@", dictionary);

    //多个
    NSDictionary *dictionary1 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"aaa", @"bbb", NULL] forKeys:[NSArray arrayWithObjects:@"1", @"2", NULL]];
    NSLog(@"%@", dictionary1);

    //简化写法
    NSDictionary *dictionary2 = @{@"1" : @"aaa", @"2" : @"bbb"};
    NSLog(@"%@", dictionary2);

    //数组的简化写法
    NSArray *array = @[@"1", @"2"];
    NSLog(@"%@", array);

    //长度
    NSLog(@"%ld", dictionary2.count);

    //用key查找元素
    NSLog(@"key为2的元素是：%@", [dictionary2 valueForKey:@"2"]);

    //用key取值
    NSLog(@"key为1的元素是：%@", [dictionary2 objectForKey:@"1"]);

    //所有值数组
    NSArray *array1 = [dictionary2 allValues];
    NSLog(@"所有值是:%@", array1);

    //所有的key数组
    NSArray *array2 = [dictionary2 allKeys];
    NSLog(@"所有的key是:%@", array2);

    //通过key数组去查找值
    NSArray *array3 = [dictionary2 objectsForKeys:[NSArray arrayWithObjects:@"1", @"2", @"3", NULL] notFoundMarker:@"not found!"];
    NSLog(@"找到的结果是：%@", array3);

    /**
    * 遍历
    * 1、for in 枚举
    * 2、枚举器
    */
    //for in
    for(NSString *key in dictionary2){
        NSLog(@"KEY:%@,VALUE:%@",key, [dictionary2 valueForKey:key]);
    }
    //枚举器
    id key;
    NSEnumerator *enumerator = [dictionary2 keyEnumerator];
    while (key= [enumerator nextObject]){
        NSLog(@"KEY:%@,VALUE:%@",key, [dictionary2 valueForKey:key]);
    }
    //block
    [dictionary2 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"key:%@,value:%@",key,obj);
    }];

}
@end