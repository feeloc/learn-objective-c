# 面向对象

## 类，实例化对象
```objective-c
/**
* alloc方法申请内存空间
* initWithName是自定义的初使化方法
*/
People *p1 = [[People alloc] initWithName:@"张三"];

//初使化方法
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _personName = name;
    }
    return self;
}

//使用new初使化对象
People *p3 = [[People new] initWithName:@"new 出来的"];

```

## 成员变量，属性
`属性外部使用，成员变量内部使用，属性是成员变量的外部接口`

```objective-c

{
    /**
    * 成员变量
    */
    NSString *_name;
    int _age;
    int _gender;
}

//属性
@property(nonatomic, strong) NSString *name;

//get set方法
- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)getName {
    return _name;
}

//类内直接使用成员变量，内外使用属性，使用_区分，不需要手动关联
@synthesize name = _name;

//新版本的SDK中直接声明属性，成员变量会自动添加
//新版本的SDK中直接在m中声明成员变量，不需要在h文件中声明了，因为不需要在类外使用

```

## 方法
```objective-c

+ (NSString *)showName {
    return @"类方法";
}

- (NSString *)showName {
    return @"对象方法";
}

/**
* []调用方法
*
* 类方法，静态方法，加号 +
* 对象方法，动态方法，减号 -
*
*/

NSLog(@"静态方法%@", [People showName]);
NSLog(@"动态方法%@", [people showName]);

//静态变量可被静态方法调用
static NSString *_name1 = @"aaaa";
+ (NSString *)showName {
    return [@"类方法" stringByAppendingString:_name1];
}



```
