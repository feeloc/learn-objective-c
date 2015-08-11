//
// Created by hujianmeng on 15/8/11.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import "NSStringClass.h"


@implementation NSStringClass
+ (void)demos {
    // C、OC字符串相互转换
    char *s = "hello c";
    NSLog(@"C语言字符串：%s", s);

    NSString *str = @"hello objective c";
    NSLog(@"objective c 字符串：%@", str);

    // C转OC
    NSString *str1 = [NSString stringWithUTF8String:s];
    NSLog(@"C转OC：%@", str1);

    // OC转C
    NSLog(@"OC转C：%s", [str UTF8String]);

    // 创建字符串
    NSString *str2 = [[NSString alloc] init];
    str2 = @"需要自己管理内存的字符串";
    NSLog(@"不自动管理的字符串值是：", str2);

    // 格式化字符串
    int a = 1;
    int b = 2;
    NSString *str3 = [NSString stringWithFormat:@"a: %d,b: %d", a, b];
    NSLog(@"格式化结果是：%@", str3);

    // 字符串拼接
    NSString *str4 = [str2 stringByAppendingString:str3];
    NSLog(@"str2拼上str3的结果是：%@", str4);

    // 字符串大小写转换
    NSString *str5 = @"FeeLoc@leTv";
    NSLog(@"全部转成大写：%@", [str5 lowercaseString]);
    NSLog(@"全部转成大写：%@", [str5 uppercaseString]);

    // 前缀和后缀判断
    NSString *str6 = @"http://www.feeloc.cn";
    BOOL hasPreFix = [str6 hasPrefix:@"http://"];
    BOOL hasSuffix = [str6 hasSuffix:@"feeloc.cn"];

    if (hasPreFix) {
        NSLog(@"有相应前缀");
    } else {
        NSLog(@"没有相应前缀");
    }

    if (hasSuffix) {
        NSLog(@"有相应后缀");
    } else {
        NSLog(@"没有相应后缀");
    }

    // 字符串相等
    NSString *str7 = @"http://www.letv.com";
    NSString *str8 = @"http://www.feeloc.com";
    if ([str7 isEqualToString:str8]) {
        NSLog(@"字符串相等");
    } else {
        NSLog(@"字符串不相等");
    }

    // 用指定字符分割字符串
    NSString *str9 = @"A,B,C,D,E,F,G,H,I";
    NSArray *strArray = [str9 componentsSeparatedByString:@","];
    for (NSString *each in strArray) {
        NSLog(@"当前循环的值是：%@", each);
    }

    // 按照指定范围截取字符串
    NSRange range = NSMakeRange(2, 5);
    NSString *str10 = [str9 substringWithRange:range];
    NSLog(@"截取后的字符串是：%@", str10);

    // 从某一位截取后后面的字符串
    NSLog(@"截取后的字符串是：%@", [str9 substringFromIndex:2]);

    // 从开头截取到某一位
    NSLog(@"截取后的字符串是：%@", [str9 substringToIndex:2]);

    // 将字符串拆分
    for (int i = 0; i < [str9 length]; i++) {
        NSLog(@"第%d位字符是：%c", i + 1, [str9 characterAtIndex:i]);
    }

    // 查找字符串
    NSString *str11 = @"adfa adfa 2rfw asdf fgfadf";
    // 查找指定字符串
    NSRange rangeOfStr11 = [str11 rangeOfString:@"ad"];
    NSLog(@"ad的位置是：%ld,%ld", rangeOfStr11.location, rangeOfStr11.length);
    // 替换某个范围的字符串
    NSLog(@"替换后的是：%@", [str11 stringByReplacingCharactersInRange:NSMakeRange(0, 10) withString:@"feeloc"]);
    // 替换指定的字符串
    NSLog(@"替换后的是：%@", [str11 stringByReplacingOccurrencesOfString:@"ad" withString:@"胡"]);

    // 读取网络文件
    NSURL *httpURL = [NSURL URLWithString:@"http://www.baidu.com"];
    NSString *httpStr = [NSString stringWithContentsOfURL:httpURL encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"%@\n", httpStr);

    // 读取本地文件
    NSString *fileStr = [NSString stringWithContentsOfFile:@"/Users/hujianmeng/projects/oc/learn-objective-c/README.md" encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"%@\n", fileStr);

    // 写入文件
    NSString *fileWrite = @"写文件哦";
    [fileWrite writeToFile:@"/Users/hujianmeng/Desktop/你好.txt" atomically:YES encoding:NSUTF8StringEncoding error:NULL];
}
@end