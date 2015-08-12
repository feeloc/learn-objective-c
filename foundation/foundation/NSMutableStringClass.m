//
// Created by hujianmeng on 15/8/11.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import "NSMutableStringClass.h"


@implementation NSMutableStringClass
+ (void) demo{
    // 声明可变字符串
    NSMutableString *str = [[NSMutableString alloc] initWithCapacity:10];
    [str setString:@"feeloc"];

    // 追加字符串
    [str appendString:@",hi"];
    NSLog(@"追加完的的是：%@", str);

    // 追加格式化字符串
    [str appendFormat:@"-%d-%d", 1, 2];
    NSLog(@"追加完格式化后：%@", str);

    // 替换字符串
    NSRange range = [str rangeOfString:@"feel"];
    [str replaceCharactersInRange:range withString:@"letv"];
    NSLog(@"%@", str);

    // 插入字符串
    [str insertString:@"hahah" atIndex:1];
    NSLog(@"%@", str);

    // 删除字符串，根据range
    [str deleteCharactersInRange:range];
    NSLog(@"%@", str);
}
@end