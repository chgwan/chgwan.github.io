---
title: AI tokamak tutorial
author: chgwan
date: 2024-12-27 00:34:00 +0800
updated: 2024-04-15 
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

## EAST的数据使用和相关的数据库位置

1. **请不要用 python 脚本读取MDS+数据库**。虽然我们内部的有相对应的数据读取方法，但是这个会影响到 EAST 正常实验的进行。如果需要使用，请一定要征得 chenguang.wan 的同意
2. 数据库位置 `/gpfs/mds_data/DataBase`，如果你想要的数据没有。请联系 chenguang.wan 或 minglong.wang
3. 数据库所有的数据请不要进行除读数据外的任何操作。误删会影响所有人的工作

## 论文撰写和文献管理相关

### 论文署名

**论文署名还能署错，那就是真不动脑子，下面署名一个标点符号都不能错**

中文名：中国科学院合肥物质科学研究院等离子体物理研究所，合肥 230031，中国

英文名：Institute of Plasma Physics, Hefei Institutes of Physical Science, Chinese Academy of Sciences, Hefei 230031, China

### 软件和 LyX 模板等

- 文献管理 -- 使用 Zotero
  - 使用Better BibTex 插件导出`.bib`文件，其中需要添加自定义配置以实现规范的Citation Keys, 设置 Edit -> Settings -> Better BibTex -> Citation keys和Active citation key formula 均设置为: `auth(0,1,author,false).capitalize+year`
  - 可使用Better Notes 插件实现基于markdown的笔记功能
  - Zotero 可以配置 WebDav / Sync Disk 以实现跨端同步文件和笔记的功能
- 论文撰写 -- 使用 Lyx 2.3.x 版本 + latex 最新版 + IOP 模板，如果以使用高版本的 Lyx 编写文档，可以用高版本自带的导出功能将文档导出成兼容 2.3.x 版本的形式，具体方法见下图

![lyx_convert](lyx_convert.png)
_lyx 版本转换_

- IOP 模板安装方法 https://www.cnblogs.com/freedom-wan/p/13429879.html
- Nuclear Fusion 相关 lyx 模板，请基于该模板进行撰写，该模板的格式更加优美，能让审稿人看的更爽，下载链接  https://www.kdocs.cn/l/ccj2tevnX0Tl
- 如果喜欢 latex overleaf, 建议使用 **中科科技云** overleaf 共享网站 https://sharelatex.cstcloud.cn/project
- 其他格式 一般按照 Nuclear Fusion 格式，特别注意文献引用和图表引用
- 最好保证自己的**英文论文能用 pdflatex 编译不出错**，这样才是各类英文期刊比较容易通过的格式

### 论文撰写

- 投稿之前一定要让"Chenguang Wan@chenguang.wan@ipp.ac.cn"确认作者列表，这个十分重要！！！
- 如果合适的话，在论文投稿之前，最好写一个 **专利和软著**
- 论文投稿之前，需要在 pinboard 上 **公示**，[参考](../paper-sub-procedure)
- 基本流程：论文初稿 &rarr; 专利 &rarr; 软著&rarr; 投稿
- 所有论文全都用我的账号投稿，这样我能最快的和编辑沟通。

### 论文致谢
这个部分非常重要，关系到科研项目是否能顺利结项。

1. 如果用到EAST数据需要添加下列语句：

    > We thank the staff members at EAST in Hefei (https://cstr.cn/31130.02.EAST ), for providing technical support and assistance in data collection and analysis.

2. 其次对于所有在本论文中帮助过你的人，但是不在论文作者中，需要在致谢部分给出

3. 项目致谢，这部分需要让 chenguang.wan@ipp.ac.cn 确认

### 可投期刊推荐

1. Nature Machine Intelligence: 这个比较简单，目测是很容易拿下的子刊
2. Nature Physics
3. Nature Energy
4. Nature Communications
5. Communications Physics
6. Cell Reports Physical Science
7. Nuclear Fusion
8. Nature Machine Intelligence
9. The Innovation (Cell Press)
10. Journal of Fusion Energy

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
  title = {Experiment Data-Driven Modeling of Tokamak Discharge in EAST},
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
  title = {EAST Discharge Prediction without Integrating Simulation Results},
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

@article{Wan2025,
  title = {A High-Fidelity Surrogate Model for the Ion Temperature Gradient ({{ITG}}) Instability Using a Small Expensive Simulation Dataset},
  author = {Wan, Chenguang and Cho, YoungWoo and Qu, Zhisong and Camenen, Yann and Varennes, Robin and Lim, Kyungtak and Li, Kunpeng and Li, Jiangang and Li, Yanlong and Garbet, Xavier},
  year = {2025},
  month = apr,
  journal = {Nuclear Fusion},
  number = {65},
  pages = {054001},
  issn = {0029-5515, 1741-4326},
  doi = {10.1088/1741-4326/adc7c9},
  urldate = {2025-04-02},
  copyright = {All rights reserved}
}

```

## **其他说明**

**PS**: 如果有部分链接，你无法打开说明你不是小组成员，这部分内容不共享
