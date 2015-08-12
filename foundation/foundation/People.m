//
// Created by hujianmeng on 15/8/12.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import "People.h"


@implementation People

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
        _personName = name;
    }
    return self;
}

static NSString *_name1 = @"aaaa";

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)getName {
    return _name;
}

- (NSString *)argument:(NSString *)a :(NSString *)b {
    return [a stringByAppendingString:b];
};

+ (NSString *)showName {
    return [@"类方法" stringByAppendingString:_name1];
}

- (NSString *)showName {
    return @"对象方法";
}

@end