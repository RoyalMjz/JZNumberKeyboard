```
     _ _____  _            _             _  __         _                      _ 
  _ | |_  / \| |_  _ _ __ | |__  ___ _ _| |/ /___ _  _| |__  ___  __ _ _ _ __| |
 | || |/ /| .` | || | '  \| '_ \/ -_) '_| ' </ -_) || | '_ \/ _ \/ _` | '_/ _` |
  \__//___|_|\_|\_,_|_|_|_|_.__/\___|_| |_|\_\___|\_, |_.__/\___/\__,_|_| \__,_|
                                                  |__/                          
```


# JZNumberKeyboard

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](myGithub)&nbsp;
[![platform](https://img.shields.io/badge/platform-ios-lightgray.svg?style=flat)][myGithub]&nbsp;


## Introduction


JZNumberKeyboard is a custom numeric keypad.

![](https://raw.githubusercontent.com/RoyalMjz/JZNumberKeyboard/master/Screenshots/Screenshots.png)

## Usage


0. 将JZNumberKeyboard文件夹导入到项目中

1. 在要用到的视图引入头文件`#import "JZNumberKeyboard.h"`

2. 在viewDidLoad中

```
//初始化数字键盘
JZNumberKeyboard *keyBoard = [[JZNumberKeyboard alloc] initWithTitleColor:nil backGroundImage:[UIImage imageNamed:@"keyboardImage"]];
//输入视图textfield&textView
[keyBoard setInputView:textField];
//添加到主视图中
[self.view addSubview:textField];

```


## LICENSE

JZNumberKeyBoard is licensed under the MIT Open Source license. For more information, please see the [LICENSE](https://raw.githubusercontent.com/RoyalMjz/JZNumberKeyboard/master/LICENSE) file in this repository.



[myGithub]: https://github.com/RoyalMjz/JZNumberKeyboard