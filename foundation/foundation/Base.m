//
// Created by hujianmeng on 15/8/12.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import "Base.h"


@implementation Base
+ (void)demo {
    int i1;
    int i2 = 1;

    float f1;
    float f2 = 1.1;

    double d1;
    double d2 = 2.22;

    char c1 = 'a';
    NSLog(@"%c", c1);

    char *c2 = "aaaa";
    NSLog(@"%s", c2);
}
@end