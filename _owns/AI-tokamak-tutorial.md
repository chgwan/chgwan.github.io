---
title: AI tokamak tutorial
author: chgwan
date: 2024-12-27 00:34:00 +0800
# updated: 2025-05-15
tags: [Tutorial]
media_subpath: "/assets/img/commons"
---

## 研究方向

AI + 托卡马克，包括数据、控制和物理模拟加速等多个方面。[详情参见](https://scholar.google.com/citations?user=ncURiLEAAAAJ&hl=en)。
<!-- ## 奖励标准

- **软件著作权**：500 每篇
- **发明专利**：2000 每项；实用新型：500每项
- **论文**：影响因子 * 1000 + 其他奖励（视论文级别而定），NF总计为 ~4000
- 以上所说奖励标准，是满足**等离子体物理研究所为第一单位**的情况下
- 非等所为第一单位，奖励需要酌情而定，官方没有奖励。 -->

<!-- ### 奖励标准 2025-07-30 更新版

从组内同学处获悉，等所科研奖励停止发放。故我们只能按照组内标准给大家发少量的奖励了。下列奖励需满足**万晨光为通讯作者或第一作者**。

标准如下（**非等所为第一单位则折半奖励**）：

- 等所原有标准除以 4，新标准为: NF 为 1000 元，Nature 子刊为 10000 元，正刊估计是一事一议了，估计在 50w 以上。其他论文按照影响因子和分区进行奖励。
- 其他工作，主要包括采购，报账等。年终统一发放，酌情而定。 -->

<!-- 
|                                              | 成果名称       | 奖励 | 备注 |
| -------------------------------------------- | -------------- | ---- |
| 软件著作权                                   | 100            |      |
| 发明专利                                     | 400            |      |
| 实用新型                                     | 100            |      |
| Nuclear Fusion                               | 1000           |      |
| Nature 子刊                                  | 50000          |      |
| 其他论文                                     | 影响因子 * 200 |      |
| 其他工作：主要包括采购，报账等。年终统一发放 | 酌情而定       |      |      |  | --> |
## 教材和书本
**下列课程不分先后顺序：**

- 磁约束等离子体实验物理，科学出版社，王龙
- 托卡马克第四版，清华大学出版社，王文浩译
- Dive into deep learning - author Mu Li
- B站视频，跟着李沐学AI - author Mu Li https://space.bilibili.com/1567748478
- 强化学习 - EasyRL https://datawhalechina.github.io/easy-rl
- https://www.deeplearningbook.org/  MIT  deep learning book
- 吴恩达机器学习课程，https://space.bilibili.com/3493134768016008
- 时间序列分析, https://www.math.pku.edu.cn/teachers/lidf/course/atsa/atsanotes/html/_atsanotes/index.html 

## 预备知识

### 基础知识
- 使用 Google，Chat-GPT 等，具备顺畅访问 Google 和 Chat-GPT 的能力
- Linux 和 GIT 的基本操作，其中不掌握任何Linux基础知识的，可以先用 WSL2 熟悉。特别是其中 **ssh 公钥和私玥**的使用方法
  - 特别是 `LIBRARY_PATH, LD_LIBRARY_PATH, PATH, INCLUDE, MANPATH`，这5个环境变量的使用方法
  - 所谓WSL，即 Windows Subsystem for Linux 官方安装教程：https://learn.microsoft.com/en-us/windows/wsl/install
- 机器学习模型搭建的基本操作，最低要求熟练跑通Torch官方 [DistributedDataParallel](https://docs.pytorch.org/tutorials/intermediate/ddp_tutorial.html) 中的 "nccl" 和 "gloo" 即 GPU 和 CPU 的训练后端。
- HDF5，matplotlib，numpy， torch，sql 的熟练运用
- 熟读[提问的智慧](https://github.com/ryanhanwu/How-To-Ask-Questions-The-Smart-Way/blob/main/README-zh_CN.md)，之后再提问，特别注意**不着编边际的问题**。
- 简单而言，先中文搜索，然后英文搜索，deepseek chat-GPT，claude 等全部都搜一遍。如果还是无法解决再在群里提问，或者找师兄师姐们，**最后再去问老师**。

### 账号开通列表 <span id="open_accounts"> </span>
- [ ] 等离子体物理研究所邮箱
- [ ] 咨询刘晓娟老师，开通新神马和老神马账号，特别是要开通新神马 DCU 权限
- [ ] EAST 账号 - 王枫老师管理 
- [ ] 加入小组 [WPS 共享资料库](https://kdocs.cn/join/gl3pii5?f=101) 
- [ ] 生成 ed25519 算法的 ssh 公钥， 上传到`共享资料库/Storage/ssh/组内公钥.docx`
  > 生成方法 `ssh-keygen -t ed25519 -C "<yourname>"` 

### 代码和配置类问题解决方案
1. 百度，Google，GPT全都搞一遍，特别是要注意给问题翻译成英文去搜一搜
2. 测试多种网络环境，不同账号是否有问题
3. 提供可能的问题来源，比如log等。比如最小复现方法。
4. 总结来说：先自己尝试解决，解决不了，就给问题化简到别人能最小复现的版本，然后再提问。提问的话，先尝试找师兄师姐等同学，然后再找老师。

### 常用链接
**链接打不开**
   1. 缺乏相关账号，请回到[开通账号](#open_accounts)
   2. 没有在内网，请使用 vpn, 或者 WebVPN

**常用链接**
- http://202.127.204.41:8080/udaclient/ 一个 web 版的图形化 EAST 参数访问用户端
- http://202.127.205.54/wiki/index.php/Fundamental_parameters_(signal_name) EAST 常用物理参数列表
- https://vpn.hfcas.ac.cn/ 合肥物质科学研究院 WebVPN
- Fusion Wiki https://wiki.fusion.ciemat.es/wiki/Main_Page，是一些基本的tokamak 概念定义
- Fusion 术语表 https://euro-fusion.org/services/eurofusion-glossary/，基本的托卡马克术语列表


## 代码开发
- 工具链：Conda + Pytorch ( >= 2.4 推荐 latest stable version ) + Python >= 3.9 (推荐3.12)。PS：目前 Conda 对于组织已经不是免费的了，后续会逐步迁移至Mamba，[Mamba的安装](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html)
- 数据库目前是基于 HDF5 的内部数据库
- 代码风格见 [开发规范](../development-styles)。
- 内部 private_modules 包，有很多常用的数据操作方法，请不要分享。具体使用方法可以咨询王明龙

## EAST的数据使用和相关的数据库位置

1. **请不要用 python 脚本读取MDS+数据库**。虽然我们内部的有相对应的数据读取方法，但是这个会影响到 EAST 正常实验的进行。如果需要使用，请一定要征得 chenguang.wan 的同意
<!-- 2. 数据库位置 `/gpfs/mds_data/DataBase`，这个是基于 HDF5 的数据库，支持多进程的读写。如果你想要的数据没有，请联系 chenguang.wan 或 minglong.wang -->
2. 数据库所有的数据请不要进行除读数据外的任何操作。**误删**会影响**所有人的工作**

### 数据库使用方法
1. 新神马服务器数据 `/data/share/chenguang_wan/DataBase`
2. 具体使用教程可以询问：王明龙和卢敬敬

## 论文撰写和文献管理相关

### 论文署名

**下面署名一个标点符号都不能错**

中文名：中国科学院合肥物质科学研究院等离子体物理研究所，合肥 230031，中国

英文名：Institute of Plasma Physics, Hefei Institutes of Physical Science, Chinese Academy of Sciences, Hefei 230031, China

中文名：中国科学技术大学，合肥 230026，中国

英文名：University of Science and Technology of China, Hefei 230026, China

**满足毕业条件后，建议将署名的第一单位改为合肥物质科学研究院**，这样的话，不仅可以拿到科研奖励，对于未来的职业发展也有帮助。

用到EAST数据，需要在作者名列表中**加上 EAST team**, 其中 EAST team 的 affiliation 是 Institute of Plasma Physics, Hefei Institutes of Physical Science, Chinese Academy of Sciences, Hefei 230031, China


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
- 所有的图片，除非没有 pdf 版本的图片，否则的话**全都使用 pdf 矢量图**。
- 如果喜欢 latex overleaf, 建议使用 **中科科技云** overleaf 共享网站 https://sharelatex.cstcloud.cn/project, 这个无法追踪修改不建议
- 其他格式 一般按照 Nuclear Fusion 格式，特别注意文献引用和图表引用
- 最好保证自己的**英文论文能用 pdflatex 编译不出错**，这样才是各类英文期刊比较容易通过的格式

### 论文撰写

- 投稿之前一定要让"Chenguang Wan@chenguang.wan@ipp.ac.cn"确认作者列表，这个十分重要！！！
- 如果合适的话，在论文投稿之前，最好写一个 **专利和软著**
- 论文投稿之前，需要在 pinboard 上 **公示**，[公示方法参考](../paper-sub-procedure)
- 基本流程：论文初稿 &rarr; 专利 &rarr; 软著&rarr; 投稿，专利的申请日要在论文发表日之前。
- 所有论文全都用我的账号投稿，这样我能最快的和编辑沟通。（惨痛经验可以详询Minglong Wang）

#### 论文撰写其他需要注意的细节

- 不要中英文标点混排，因为半角和全角符号的处理方式不一样，容易出现很奇怪的错误。比较容易出错的有：中文:"（）", 和英文 "(),", 即括号，逗号，句号，引号。
- `~ 是 \sim 而不是直接敲 ~`
- `.bib` 文件， Key 最好以 author-FirstName.capitalize+year, 姓首字母大写 + 年份，如果重复的话，即后面缀上 a,b,c 用以区别。即 `Wan2025c` 这种格式
- 最好每个参考文献都有 doi，没有 doi 的时候最好有 url，而且**只能出现一个链接**，doi 优先，没有 doi 再选择其他链接。

### 论文致谢
这个部分非常重要，关系到科研项目是否能顺利结项。

1. 如果用到EAST数据需要添加下列语句：
    > We thank the staff members at EAST in Hefei (https://cstr.cn/31130.02.EAST ), for providing technical support and assistance in data collection and analysis.
2. 其次对于所有在本论文中帮助过你的人，但是不在论文作者中，需要在致谢部分给出
3. 项目致谢，这部分需要让 chenguang.wan@ipp.ac.cn 确认

### 可投期刊推荐

#### 一区 TOP 类可投
1. Nature Machine Intelligence: 这个比较简单，目测是很容易拿下的子刊
2. Nature Physics
3. Nature Energy
4. Nature Communications
5. Communications Physics：该期刊一般是 Nature Communication 投不中的选择
6. Cell Reports Physical Science
7. Nuclear Fusion，其中有 Nuclear Fusion Letter，Letter 属于 NF 中比较重要的文章。
8. Nature Machine Intelligence
9. The Innovation (Cell Press)
10. Journal of Fusion Energy
11. Science Advance：和 NC 类似

#### 二区期刊可投

1. Nuclear Materials and Energy
2. NUCLEAR ENGINEERING AND DESIGN
3. PPCF

#### 纯 AI 领域
- NeurIPS, AI for Science Workshop
- ICLR，ICML，AAAI， AI for Science

#### 可投水刊列表

1. IEEE Transactions on Nuclear Science
2. Fusion Engineering and Design
3. IEEE Transactions on Plasma Science

#### 推荐审稿人列表

[不宜公开内容，列表见链接](https://kdocs.cn/l/cewDvJxZMyPX)


### 论文中建议给下列论文，全都引用一遍

[Recommended citations](/assets/codes/bib/recommended_citations.bib)

## 其他说明

- 如果有部分链接无法打开，如果你不是小组成员，这部分内容不共享。如果你是小组成员，请联系 chgwan 加入到小组内部共享列表, 加入之前麻烦给 wps 用户名改成**真实姓名**，用以方便追踪。
- RSS订阅列表，方便及时追踪最新通知
  - [合肥物质科学研究院科研规划处](https://politepol.com/fd/iYjG8cdjXr5m.xml)
  - [等离子体所通知](https://politepol.com/fd/iTZb41hW1tqT.xml)
  - [合肥物质科学研究院研究生处](https://politepol.com/fd/MfAI440x47sF.xml)
- 所有组内同学，**必须按照一周一次的频率**发送周总结报告，具体方式参见组群。