# learn-objective-c
## 一、工具使用

1. xcode快捷键
```ruby
保存所有文件 command+option+s

项目中查找 command+shift+F
查找下一个 command+g
查找上一个 command+shift+g

浏览源文件 command+Double Click 
打开头文件 command+shift+d 
切换头/源文件 command+option+上箭头

文件首行 command+上箭头
文件末 command+下箭头
行首 command+左箭头
行末 command+右箭头
上一单词 option+左箭头
下一单词 option+右箭头
上一拆分单词 control+左箭头
下一拆分单词 control+右箭头

Tab ：接受代码提示
Esc ：显示代码提示菜单

以调试方式运行程序 command+y
继续（在调试中）command+option+p
编译运行 command+r

Xcode 代码格式化/自动排版 右击 ->Structure ->Re-Indent
```

## 二、基本语法

* 1. NSString
```objective-c

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

```

* 2. NSMutableString
```objective-c

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

```

* 3. NSArray
```objective-c

// 只能存放对象，可以存储不同类型的对象
NSArray *array = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", NULL];

//数组长度
NSLog(@"数组长度是：%ld", array.count);

//是否含有否个对象
BOOL isHas = [array containsObject:@"2"];
if (isHas) {
    NSLog(@"包含");
} else {
    NSLog(@"不包含");
}

//最后一个元素
NSLog(@"最后一个元素是：%@", [array lastObject]);

//第一个元素
NSLog(@"第一人元素是：%@", [array firstObject]);

//指定下标的元素
NSLog(@"第2个元素是：%@", [array objectAtIndex:1]);

//查找元素的下标
NSLog(@"元素3的下标是：%d", [array indexOfObject:@"3"]);

/*
 * 数组遍历
 *
 * 1、for循环
 * 2、for in 枚举
 * 3、枚举器，迭代器
 *
 */

//for 循环
for (int i = 0; i < array.count; i++) {
NSLog(@"第%d个元素是：%@", i + 1, [array objectAtIndex:i]);
}

//for in 枚举
//数组中元素类型的类型要一致
for (NSObject *v in array) {
    NSLog(@"%@", v);
}

//枚举器
NSEnumerator *enumerator = [array objectEnumerator];
id obj;
int index = 0;
while (obj = [enumerator nextObject]) {
    NSLog(@"枚举器，第%d个元素是：%@", ++index, obj);
}

//enumerator block
[array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    NSLog(@"枚举器，第%d个元素是：%@", ++idx, obj);
}];

```

* 4. NSMutableArray
```objective-c

//自定义类
People *p1 = [[People alloc] initWithName:@"张三"];
People *p2 = [[People alloc] initWithName:@"王五"];

//直接初使化
NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:p1, p1, NULL];
for (People *p in array) {
    NSLog(@"直接初使化：%@", p.personName);
}

//后续动态添加
NSMutableArray *array1 = [[NSMutableArray alloc] init];
[array1 addObject:p1];
[array1 addObject:p2];
//从数组添加元素
[array1 addObjectsFromArray:array];
for (People *p in array1) {
    NSLog(@"后续添加元素：%@", p.personName);
}

//删除最后一个元素
[array1 removeLastObject];
NSLog(@"删除最后一个元素后：%@", array1);

//删除指定下标的元素
[array1 removeObjectAtIndex:0];
NSLog(@"删除第一个元素后：%@", array1);

//交换指定下标的元素
[array1 exchangeObjectAtIndex:0 withObjectAtIndex:1];
NSLog(@"交换完后：%@", array1);

//删除所有元素
[array1 removeAllObjects];
NSLog(@"删除所有元素后：%@", array1);

````

* 5. NSDictionary
```objective-c

//初使化
NSDictionary *dictionary = [NSDictionary dictionaryWithObject:@"aaa" forKey:@"b"];
NSLog(@"%@", dictionary);

//多个
NSDictionary *dictionary1 = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"aaa", @"bbb", NULL] forKeys:[NSArray arrayWithObjects:@"1", @"2", NULL]];
NSLog(@"%@", dictionary1);

//简化写法
NSDictionary *dictionary2 = @{@"1" : @"aaa", @"2" : @"bbb"};
NSLog(@"%@", dictionary2);

//数组的简化写法
NSArray *array = @[@"1", @"2"];
NSLog(@"%@", array);

//长度
NSLog(@"%ld", dictionary2.count);

//用key查找元素
NSLog(@"key为2的元素是：%@", [dictionary2 valueForKey:@"2"]);

//用key取值
NSLog(@"key为1的元素是：%@", [dictionary2 objectForKey:@"1"]);

//所有值数组
NSArray *array1 = [dictionary2 allValues];
NSLog(@"所有值是:%@", array1);

//所有的key数组
NSArray *array2 = [dictionary2 allKeys];
NSLog(@"所有的key是:%@", array2);

//通过key数组去查找值
NSArray *array3 = [dictionary2 objectsForKeys:[NSArray arrayWithObjects:@"1", @"2", @"3", NULL] notFoundMarker:@"not found!"];
NSLog(@"找到的结果是：%@", array3);

/**
* 遍历
* 1、for in 枚举
* 2、枚举器
*/
//for in
for(NSString *key in dictionary2){
    NSLog(@"KEY:%@,VALUE:%@",key, [dictionary2 valueForKey:key]);
}
//枚举器
id key;
NSEnumerator *enumerator = [dictionary2 keyEnumerator];
while (key= [enumerator nextObject]){
    NSLog(@"KEY:%@,VALUE:%@",key, [dictionary2 valueForKey:key]);
}
//block
[dictionary2 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    NSLog(@"key:%@,value:%@",key,obj);
}];

```

* 6. NSMutableDictionary
```objective-c

//初使化
NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] init];

[mutableDictionary setObject:@"aaa" forKey:@"1"];
[mutableDictionary setObject:@"bbb" forKey:@"2"];
[mutableDictionary setObject:@"ccc" forKey:@"3"];
[mutableDictionary setObject:@"ddd" forKey:@"4"];

NSLog(@"添加后的值是：%@", mutableDictionary);

//指定指定KEY的键值对
[mutableDictionary removeObjectForKey:@"2"];
NSLog(@"删除key为2后的值是：%@", mutableDictionary);

//删除一组
[mutableDictionary removeObjectsForKeys:[NSArray arrayWithObjects:@"3", @"4", NULL]];
NSLog(@"删除key为3，4后的值是：%@", mutableDictionary);

//删除所有
[mutableDictionary removeAllObjects];
NSLog(@"删除所有后的值是：%@", mutableDictionary);

```

## [三、面向对象](https://github.com/feeloc/learn-objective-c/blob/master/OOP.md)
