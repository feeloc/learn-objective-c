//
// Created by hujianmeng on 15/8/12.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import "People.h"


@implementation People
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _personName = name;
    }
    return self;
}
@end