//
// Created by hujianmeng on 15/8/12.
// Copyright (c) 2015 hujianmeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface People : NSObject

@property(nonatomic, strong) NSString *personName;

- (instancetype)initWithName:(NSString *)name;

@end