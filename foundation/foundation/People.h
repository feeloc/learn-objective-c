//
// Created by hujianmeng on 15/8/12.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface People : NSObject {
    /**
    * 成员变量
    */
    NSString *_name;
    int _age;
    int _gender;
}

- (void)setName:(NSString *)name;
- (NSString *)getName;

+ (NSString *)showName;
- (NSString *)showName;

@property(nonatomic, strong) NSString *personName;
@property(nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end