---
title: AI tokamak tutorial
author: chgwan
date: 2024-12-27 00:34:00 +0800
tags: [Tutorial]
media_subpath: "/assets/img/commons"
---
## 奖励标准

- **软件著作权**：500 每篇
- **发明专利**：2000 每项；实用新型：500每项
- **论文**：影响因子 * 1000 + 其他奖励（视论文级别而定），NF总计为~8000
- 以上所说奖励第一单位，需为等离子体物理研究所，也就是说如果非等所为第一单位，奖励不一定能发放到手，供参考

## 教材和书本

- 磁约束等离子体实验物理
- 托卡马克第四版，清华大学出版社
- Dive into deep learning - author Mu Li
- 强化学习 - EasyRL https://datawhalechina.github.io/easy-rl
- https://www.deeplearningbook.org/  MIT  deep learning book

## 预备知识

- Linux 的基本操作
- 机器学习模型搭建的基本操作
- HDF5，matplotlib，numpy， torch，sql 的熟练运用
- 熟读[提问的智慧](https://github.com/ryanhanwu/How-To-Ask-Questions-The-Smart-Way/blob/main/README-zh_CN.md)，之后再提问，特别注意**不着编边际的问题**。

## 代码开发规范
见 [开发规范](../development-styles)

## 论文撰写和文献管理相关

### 软件和 LyX 模板等

- 文献管理 -- 使用 zotero，
- 论文撰写 -- 使用 Lyx 2.3.x 版本 + latex 最新版 + IOP 模板，如果以使用高版本的 Lyx 编写文档，可以用高版本自带的导出功能将文档导出成兼容 2.3.x 版本的形式，具体方法见下图

![lyx_convert](lyx_convert.png)
_lyx 版本转换_

- IOP 模板安装方法 https://www.cnblogs.com/freedom-wan/p/13429879.html
- Nuclear Fusion 相关 lyx 模板，请基于该模板进行撰写，该模板的格式更加优美，能让审稿人看的更爽，下载链接  https://www.kdocs.cn/l/ccj2tevnX0Tl
- 如果喜欢 latex overleaf, 建议使用 **中科科技云** overleaf 共享网站 https://sharelatex.cstcloud.cn/project
- 其他格式 一般按照 Nuclear Fusion 格式，特别注意文献引用和图表引用
- 最好保证自己的**英文论文能用 pdflatex 编译不出错**，这样才是各类英文期刊比较容易通过的格式

### 论文撰写

- 投稿之前一定要让我确认作者列表，这个十分重要！！！
- 如果合适的话，在论文投稿之前，最好写一个 **专利和软著**
- 论文投稿之前，需要在 pinboard 上 **公示**，[参考](../paper-sub-procedure)
- 基本流程：论文初稿 &rarr; 专利 &rarr; 软著&rarr; 投稿

### 可投期刊推荐

1. Nature Physics
2. Nature Energy
3. Nature Communications
4. Communications Physics
5. Cell Reports Physical Science
6. Nuclear Fusion
7. Nature Machine Intelligence
8. The Innovation (Cell Press)
9. Journal of Fusion Energy

### 二区期刊可投

1. Nuclear Materials and Energy
2. NUCLEAR ENGINEERING AND DESIGN
3. PPCF

### 可投水刊列表

1. IEEE Transactions on Nuclear Science
2. Fusion Engineering and Design
3. IEEE Transactions on Plasma Science

## 推荐审稿人列表

[不宜公开内容，列表见链接](https://kdocs.cn/l/cewDvJxZMyPX)

## 小组共享资料

[金山网盘协作](https://kdocs.cn/join/gxxq4mo)

### 论文中建议给下列论文，全都引用一遍

```bib
@article{Wan2021,
  title = {Experiment Data-Driven Modeling of Tokamak Discharge in {{EAST}}},
  author = {Wan, Chenguang and Yu, Zhi and Wang, Feng and Liu, Xiaojuan and Li, Jiangang},
  year = {2021},
  month = jun,
  journal = {Nuclear Fusion},
  volume = {61},
  number = {6},
  pages = {066015},
  issn = {0029-5515},
  doi = {10.1088/1741-4326/abf419}
}

@article{Wan2022,
  title = {{{EAST}} Discharge Prediction without Integrating Simulation Results},
  author = {Wan, Chenguang and Yu, Zhi and Pau, Alessandro and Liu, Xiaojuan and Li, Jiangang},
  year = {2022},
  month = dec,
  journal = {Nuclear Fusion},
  volume = {62},
  number = {12},
  pages = {126060},
  publisher = {IOP Publishing},
  issn = {17414326},
  doi = {10.1088/1741-4326/ac9c1a},
  copyright = {All rights reserved}
}

@article{Wan2023,
  title = {A Machine-Learning-Based Tool for Last Closed-Flux Surface Reconstruction on Tokamaks},
  author = {Wan, Chenguang and Yu, Zhi and Pau, Alessandro and Sauter, Olivier and Liu, Xiaojuan and Yuan, Qiping and Li, Jiangang},
  year = {2023},
  month = may,
  journal = {Nuclear Fusion},
  volume = {63},
  number = {5},
  pages = {056019},
  issn = {0029-5515},
  doi = {10.1088/1741-4326/acbfcc}
}

@article{Wan2024,
  title = {Predict the Last Closed-Flux Surface Evolution without Physical Simulation},
  author = {Wan, Chenguang and Bai, Shuhang and Yu, Zhi and Yuan, Qiping and Huang, Yao and Liu, Xiaojuan and Hu, Yemin and Li, Jiangang},
  year = {2024},
  month = feb,
  journal = {Nuclear Fusion},
  volume = {64},
  number = {2},
  pages = {026014},
  issn = {0029-5515},
  doi = {10.1088/1741-4326/ad171f}
}

```

**## 其他说明**

**PS**: 如果有部分链接，你无法打开说明你不是小组成员，这部分内容不共享
