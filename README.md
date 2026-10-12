# async_json 图书数据集异步解析

用 Dart 异步读取课程统一数据集的本地副本，解析为模型并汇总输出，同时验证文件缺失与字段缺失两条异常路径的命令行练习项目。

## 技术栈与环境

- Dart SDK 3.13.3（stable）

- 纯 Dart 命令行项目，无 Flutter 依赖

- 第三方依赖：`path`（跨平台路径拼接）

- 测试框架：`test` 包

- 运行环境：Windows + PowerShell

## 项目结构

```
async_json/
├── bin/
│   └── async_json.dart      # 程序入口 main()：异步读取 JSON、Map 类目统计、借阅量 Top3、异常兜底
├── lib/
│   └── async_json.dart      # Book 模型类与 Book.fromJson 工厂构造函数
├── test/
│   └── async_json_test.dart # Book.fromJson 字段解析单元测试
└── data/
    └── books.json           # 课程统一数据集本地副本（36 条图书记录）
```

## AI使用说明

本项目在开发过程中使用了 AI 辅助工具（Trae IDE 内置模型）

## AI协助范围

- 提供方案设计思路（工厂构造函数解析 JSON 的模式、Map 计数统计与降序排序取 Top3 的写法）
- 生成代码参考片段（main 主流程、test 用例模板）
- 讲解知识点（async/await、级联运算符、try-catch 捕获顺序）

## 本人完成的工作

- 全部代码手动录入到 IDE
- 项目结构搭建（dart create async_json、dart pub add path、复制数据集到 data/ 目录）
- 运行 `dart run`、`dart test`、`dart analyze` 验证代码正确性
- 完成步骤三异常路径实验（临时改名数据文件验证友好报错；删除 borrowCount 字段观察 null 类型错误，并在 fromJson 中加入缺失字段默认 0 的处理）
- 调试和修复问题
- 上传代码仓库 github

## 验证方式

- `dart run` 主程序输出正确：总数 36、六个类目各 6 本、借阅量 Top3 为万历十五年(91)、茶马古道(87)、渲染管线十二讲(87)
- `dart test` 1 个用例通过：`All tests passed!`
- `dart analyze` 零警告零错误
- 异常路径实验：books.json 临时改名后输出"数据文件缺失，请检查 data/books.json"而非崩溃堆栈；删除 borrowCount 字段触发 null 类型错误，加入 `?? 0` 默认处理后程序恢复正常运行
