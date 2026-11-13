---
title: "论文撰写和投稿"
author: chgwan
render_with_liquid: false
---

## 论文署名

**下面署名一个标点符号都不能错**

中文名：中国科学院合肥物质科学研究院等离子体物理研究所，合肥 230031，中国

英文名：Institute of Plasma Physics, Hefei Institutes of Physical Science, Chinese Academy of Sciences, Hefei 230031, China

中文名：中国科学技术大学，合肥 230026，中国

英文名：University of Science and Technology of China, Hefei 230026, China

**满足毕业条件后，建议将署名的第一单位改为合肥物质科学研究院**，这样的话，不仅可以拿到科研奖励，对于未来的职业发展也有帮助。

用到EAST数据，需要在作者名列表中**加上 EAST team**, 其中 EAST team 的 affiliation 是 Institute of Plasma Physics, Hefei Institutes of Physical Science, Chinese Academy of Sciences, Hefei 230031, China


## 软件和 LyX 模板

- 论文撰写 -- 使用 Lyx 或者使用 LaTex，基于 IOP 模板
- 文献管理 -- 使用 Zotero，配置方法见 [AI tokamak 入门指南](../AI-tokamak-tutorial/#文献管理)
- IOP 模板下载位置：https://www.kdocs.cn/l/cbc9uJBTrkSa，[IOP 模板安装方法](../../texlive-install-IOP-template/)
- Nuclear Fusion 相关 Lyx 模板，请**基于该模板进行撰写**，该模板的格式经过本人优化，看起来更加优美，能让审稿人看的更爽，模板见 [NFTemplate](https://github.com/chgwan/chgwan.github.io/tree/gh-pages/assets/codes/NFTemplate)，包括 [Nuclear_Fusion.lyx](/assets/codes/NFTemplate/Nuclear_Fusion.lyx)、[Nuclear_Fusion.tex](/assets/codes/NFTemplate/Nuclear_Fusion.tex) 和 [Library.bib](/assets/codes/NFTemplate/Library.bib)，请修改 Preamble 部分中的作者部分，需要改为 第一作者 et al 的形式。

## 论文排版技巧
- 所有的图片，除非没有 pdf 版本的图片，否则的话**全都使用 pdf 矢量图**。
- 如果喜欢 latex overleaf, 建议使用 **中国科技云** overleaf 共享网站 https://latex.cstcloud.cn/project。
- 其他格式 一般按照 Nuclear Fusion 格式，特别注意文献引用和图表引用
- 最好保证自己的**英文论文能用 pdflatex 编译不出错**，这样才是各类英文期刊比较容易通过的格式。
- 除非必要否则不要出现 Unicode，特别是 .bib 文件同样不允许出现 Unicode。如果使用的 Zotero，设置方法是 Settings ->  Better BibTex -> {BibLaTex, BibTex, Export BibTex }-> Export unicode as plain-text latex commands.

## 论文撰写

- 如果需要写专利的话，**专利提交和公开一定要在论文**之前。专利的申请日要在论文发表日之前。
- 投稿之前一定要让 chenguang.wan@ipp.ac.cn 确认作者列表，这个十分重要！！！
- 如果合适的话，在论文投稿之前，最好写一个 **专利和软著**
- 论文投稿之前，需要在 pinboard 上 **公示**，[公示方法参考](#等离子体所论文投稿流程)
- 基本流程：论文初稿 &rarr; 专利 &rarr; 软著&rarr; 投稿，专利的申请日要在论文发表日之前。
- 所有论文全都用我的账号投稿，这样我能最快的和编辑沟通。（惨痛经验可以详询 Minglong Wang）

### 论文撰写其他需要注意的细节

- 不要中英文标点混排，因为半角和全角符号的处理方式不一样，容易出现很奇怪的错误。比较容易出错的有：中文:"（）", 和英文 "(),", 即括号，逗号，句号，引号。
- `~ 是 \sim 而不是直接敲 ~`
- `.bib` 文件， Key 最好以 author-FirstName.capitalize+year, 姓首字母大写 + 年份，如果重复的话，即后面缀上 a,b,c 用以区别。即 `Wan2025c` 这种格式
- 最好每个参考文献都有 doi，没有 doi 的时候最好有 url，而且**只能出现一个链接**，doi 优先，没有 doi 再选择其他链接, 可以使用 [bibclean](/assets/codes/bib/bibclean) 脚本检查和清理：`python bibclean refs.bib -i`，运行后没有出现 warning 即可。

## 论文致谢
这个部分非常重要，关系到科研项目是否能顺利结项。

1. 如果用到EAST数据需要添加下列语句：
    > We thank the staff members at EAST in Hefei (https://cstr.cn/31130.02.EAST ), for providing technical support and assistance in data collection and analysis.
2. 其次对于所有在本论文中帮助过你的人，但是不在论文作者中，需要在致谢部分给出
3. 项目致谢，这部分需要让 chenguang.wan@ipp.ac.cn 确认

### 推荐审稿人列表

[不宜公开内容，列表见链接](https://kdocs.cn/l/cewDvJxZMyPX)


## 论文中建议给下列论文，全都引用一遍

[Recommended citations](/assets/codes/bib/recommended_citations.bib)


## 等离子体所论文投稿流程 (Deprecated)
1. [论文上传链接](http://202.127.204.44/pinboard/index.php) 给论文上传到Pinboard上
2. PPT给室秘书安排报告
3. 安排报告之后论文的approver才可以批准你的论文，进行接下来的流程。
4. [申请表两张](http://202.127.204.44/pinboard/index.php)
    1. 科技论文投稿申请表 提交至 310 罗老师
        * 工作组审核意见 投稿公示EDM负责人 
        * 专项办意见 专项办负责人 可以先去给罗老师看一下 她会告诉你应该找谁签字
        * 分管所领导意见 徐国盛  4#-227
    2. 保密审查表和文章首页一起提交至 2号楼 356 康老师
    3. 若未带纸质版文章首页可以 email 至 [康老师email](mailto:shkang@issp.ac.cn)
5. 完成上述工作就可以选择合适的期刊投稿.

目前论文投稿流程，请自行咨询师兄师姐或者室秘书。

### 2024-12-26 更新
论文报销只需要上传文件到[Pinboard](http://202.127.204.44/pinboard/index.php)，其他的均不是强制要求  

### 2025-04-15
专项办通知 - 请各位科研人员在发表EAST装置运行相关的论文时，务必在致谢部分标注上该设施的中（英）文名称及代码，感谢配合与支持！

We thank the staff members at EAST in Hefei (https://cstr.cn/31130.02.EAST ), for providing technical support and assistance in data collection and analysis.

## 可投期刊推荐

### 一区 TOP 类可投
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

### 二区期刊可投

1. Nuclear Materials and Energy
2. NUCLEAR ENGINEERING AND DESIGN
3. PPCF

### 纯 AI 领域
- NeurIPS, AI for Science Workshop
- ICLR，ICML，AAAI， AI for Science

### 可投水刊列表

1. IEEE Transactions on Nuclear Science
2. Fusion Engineering and Design
3. IEEE Transactions on Plasma Science