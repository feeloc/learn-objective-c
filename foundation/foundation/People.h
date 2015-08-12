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

    //类内类外都可使用，可继承
@public
    int type;
    //类内可使用，类外不可使用，可被继承（默认类型）
@protected
    int type1;
    //私有，类内可使用，类外不可使用，不可被继承
@private
    int type2;
    //框架权限，在框架内相当于@protected，在框架外@private
@package
    int type3;
}

- (void)setName:(NSString *)name;

- (NSString *)getName;

+ (NSString *)showName;

- (NSString *)showName;

- (NSString *)argument:(NSString *)a :(NSString *)b;

@property(nonatomic, strong) NSString *personName;
@property(nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end