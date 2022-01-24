# README

此代码库为private README中不对产品做过多介绍 主要是开发需要注意的事项

# GitHub管理

## Issues

`Discussions`和`Projects`中的条目一旦删除就是永久删除，但是`Issues`中的项目可以开启可以关闭，较为方便。

推荐使用`Issues`添加需要的功能，现有的bug等。使用`tag`对不同的issue作出区分。

# 代码开发

## Scheme

本仓库有两个`Scheme`，对应的`Bundle Identifier`不同。

RacoonAccountBook:
* `com.racoonAccountBook.alpha` 和<https://developer.apple.com/account/resources/identifiers/list>页面申请的`Identifiers`是一样的
* 应用名：浣熊财记
* 实际上架的App。在进行Archive的时候，注意切回这个Scheme

RacoonAccountBook Dev:
* `com.racoonAccountBook.dev` 这个随便写都可以的
* 应用名：浣熊财记 Dev
* 如果想在模拟器或者真机上安装多个Dev版应用，直接改一下这个也可以（但不推荐）
* 在代码中可以使用 `#if DEV` `#endif` 来对Dev版添加不同的代码
* 在Dev的环境下会插入测试数据

两个Scheme都开启了`OS_ACTIVITY_MODE=disable`来屏蔽在运行过程中系统给出的提示。如果确实要借助系统的Log debug的话，可以关闭这个参数。

## Build Number and Version

本仓库使用shell脚本`Script/set_build_number.sh`来自动生成`Build Number`和`Version`。

* `Build Number`：在Xcode构建项目时会将`Build Number`更新为主分支上的提交数。
* `Version`：在Xcode构建项目时会将`Version`更新为主分支上最新的一个tag。

注意，如果要更新版本，使用`git tag -a x.x.x -m "xxxx"`添加version之后在Xcode里面Build一下就可以了。

## Git commit

* 在每次开始修改之前应该先使用`git pull`或`git fetch`和`git merge`来获取最新的代码版本，之后再修改自己的部分。
* 尽量以尽可能小的更改作为一次`commit`，尽管这样可能会产生较多`commits`。但这样以后出现什么问题可以快速索引到某一次`commit`，有必要可以很方便的进行`git revert`
* 在提交之前使用[SwiftFormat](https://github.com/nicklockwood/SwiftFormat/releases)对更改过的所有`.swift`文件进行格式化。安装号后格式化位置在`Xcode -> Editor -> SwiftFormat -> Format File`。多次格式化可以先在`Xcode -> Preferences -> Key Bindings`中搜索`SwiftFormat`设置快捷键。
* 在每次提交之前确保项目是能够顺利构建的（使用⌘B进行构建不报错）。如果`commit`为不能成功`build`的版本，需要在`commit log`中注明
* 推荐编写提交信息`commit log`时使用[Conventional Commits](https://www.conventionalcommits.org/en)
* 提交代码时如果有push权限可以直接push；没有权限应该先private fork仓库，将自己的分支上传至自己的仓库后提pull request。

## 项目中使用的特殊记号

* `// TODO: ` 未添加的功能
* `// FIXME: ` 已知是bug，但是还未修复
* `// QUESTION: ` 对代码或者程序运行情况尚不清楚
* `// MARK: ` Xcode 代码分块 
* `// MARK: - ` Xcode代码分块（带分隔符）

# App Store Connect

## 更新日志

在每次上传新版本之后，需要在<https://github.com/Racoon-Book/About>更新`更新日志`。
