//
//  main.m
//  foundation
//
//  Created by hujianmeng on 15/8/11.
//  Copyright (c) 2015年 hujianmeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // C、OC字符串相互转换
        char *s = "hello c";
        NSLog(@"C语言字符串：%s", s);
        
        NSString *str = @"hello objective c";
        NSLog(@"objective c 字符串：%@", str);
        
        // C转OC
        NSString *str1 = [NSString stringWithUTF8String:s];
        NSLog(@"C转OC：%@", str1);
        
        //OC转C
        NSLog(@"OC转C：%s", [str UTF8String]);
    }
    return 0;
}
