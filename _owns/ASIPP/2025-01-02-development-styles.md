---
title: Development styles
author: chgwan
date: 2025-01-02
# tags: [tutorial, note]
media_subpath: "/assets/img/commons"
--- 
# 开发风格
**统一组内代码风格规范**。遵循该规范，方便协作和 code review.

## Python 项目规范
### 命名规范

| 类型       | 惯例                       | 备注                           |
| ---------- | -------------------------- | ------------------------------ |
| 包和模块   | lower_with_under           |                                |
| 类         | CapWords                   |                                |
| 文件夹名   | CapWords                   |                                |
| 文件名     | capWords /capWrods_<intro> | 一般用 capWords，_表示补充说明 |
| 常量       | CAPS_WITH_UNDER            |                                |
| 实例       | lower_with_under           |                                |
| 方法与功能 | lower_with_under ()        |                                |
| 变量       | lower_with_under           |                                |
| 私有变量   | _start                     |                                |

### 函数文档规范
主要参考 pyTorch 项目的相关规范，[链接](https://pytorch.org/docs/stable/_modules/torch/nn/modules/transformer.html#Transformer)

一个简单的例子如下：
```python
def get_h5_tokamak(
    h5_file: os.PathLike,
    nodes: List[LiteralString],
    dtype=np.float32,
) -> Tuple[np.ndarray, np.ndarray, np.ndarray]:
    """ A function for easy get h5 file from tokamak
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

## 其他语言项目规范
### TODOs