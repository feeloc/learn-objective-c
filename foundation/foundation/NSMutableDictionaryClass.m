//
// Created by hujianmeng on 15/8/12.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import "NSMutableDictionaryClass.h"


@implementation NSMutableDictionaryClass
+ (void)demo {
    //初使化
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] init];

    [mutableDictionary setObject:@"aaa" forKey:@"1"];
    [mutableDictionary setObject:@"bbb" forKey:@"2"];
    [mutableDictionary setObject:@"ccc" forKey:@"3"];
    [mutableDictionary setObject:@"ddd" forKey:@"4"];

    NSLog(@"添加后的值是：%@", mutableDictionary);

    //指定指定KEY的键值对
    [mutableDictionary removeObjectForKey:@"2"];
    NSLog(@"删除key为2后的值是：%@", mutableDictionary);

    //删除一组
    [mutableDictionary removeObjectsForKeys:[NSArray arrayWithObjects:@"3", @"4", NULL]];
    NSLog(@"删除key为3，4后的值是：%@", mutableDictionary);

    //删除所有
    [mutableDictionary removeAllObjects];
    NSLog(@"删除所有后的值是：%@", mutableDictionary);
}
@end