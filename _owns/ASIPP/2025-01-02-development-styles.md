---
title: Development styles
author: chgwan
tags: [Tutorial, Note]
media_subpath: "/assets/img/commons"
--- 
# 开发风格
**统一组内代码风格规范**。遵循该规范，方便协作和 code review.

## Git 提交规范
基本的规范化网站参考：https://www.conventionalcommits.org/en/v1.0.0/#summary

可以使用 chgwan 编写的 hooks 来进行规范化提交用法参考：https://github.com/chgwan/conventional_commits/tree/main

## Python 项目规范
## 开发风格
### 命名规范，直接参考pytorch, GitHub repo
<!-- This empty line below can not be deleted. -->

| 类型       | 惯例                          | 备注                           |
| ---------- | ----------------------------- | ------------------------------ |
| 包和模块   | lower_with_under              |                                |
| 类         | CapWords                      |                                |
| 文件夹名   | CapWords / lower_with_under   | 一般使用复数                   |
| 文件名     | cap_words / cap_wrods_<intro> | 一般用cap_words，_表示补充说明 |
| 常量       | CAPS_WITH_UNDER               |                                |
| 实例       | lower_with_under              |                                |
| 方法与功能 | lower_with_under()            |                                |
| 变量       | lower_with_under              |                                |
| 私有变量   | _start                        | 以下划线开头                   |

### 补充说明：
- 文件夹规范和 GitHub 常用规范不一致，1. Windows 桌面系统时，使用 CapWrods 2. 其他情况使用 lower_with_under.
- 现有文件夹除非必要，否则的话不更新

### 函数文档规范
主要参考 pyTorch 项目的相关规范，[Transformer例子链接](https://github.com/pytorch/pytorch/blob/v2.6.0/torch/nn/modules/transformer.py#L57)

一个简单的例子如下：
```python
def get_h5_tokamak(
    h5_file: os.PathLike,
    nodes: List[LiteralString],
    dtype=np.float32,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    r""" A function for easy get h5 file from tokamak
    bla bla bla

    Args:
        h5_file: h5 file name
        nodes: keyname in `h5_file`
        dtype: data type
        
    Returns: data, node_flags, timeAxis
        * data (np.ndarray): layout of [L, len(nodes)]
        * node_flags (np.ndarray): layout of [len(nodes)]
        * timeAxis (np.ndarray): layout of [L]
    """
    pass
```
#### PS：
特别注意 `Args:` 和 `Returns:` 之后是没有空格，如果添加空格，会影响代码分析框架的运行，其中一个表现就是用编辑器，检索函数时，看不到函数文档。

## 其他语言项目规范
### TODOs
