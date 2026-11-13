---
title: AI tokamak tutorial
author: chgwan
date: 2024-12-27 00:34:00 +0800
# updated: 2025-05-15
tags: [Tutorial]
media_subpath: "/assets/img/commons"
---

## 研究方向

AI + 托卡马克，包括数据、控制和物理模拟加速等多个方面。[参考链接](https://scholar.google.com/citations?user=ncURiLEAAAAJ&hl=en)。

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
| 其他工作：主要包括采购，报账等。年终统一发放 | 酌情而定       |      | -->  

## 教材和书本

**下列课程不分先后顺序，也可以当工具书查阅**

- 磁约束等离子体实验物理，科学出版社，王龙
- 托卡马克第四版，清华大学出版社，王文浩译
- EAST 装置操作手册 - author EAST Team
- Dive into deep learning - author Mu Li
- B站视频，跟着李沐学AI - author Mu Li https://space.bilibili.com/1567748478
- 强化学习 - EasyRL https://datawhalechina.github.io/easy-rl
- https://www.deeplearningbook.org/  - MIT  deep learning book
- 吴恩达机器学习课程，https://space.bilibili.com/3493134768016008

### 其他理论知识
- [时间序列分析](https://www.math.pku.edu.cn/teachers/lidf/course/atsa/atsanotes/html/_atsanotes/index.html) (较为理论，可能部分看不懂)
- 基本机器学习算法可视化和公式讲解，即 [scikit-learn 文档](https://scikit-learn.org/stable/)

## 预备知识

### 基础知识
- 使用 Google，Chat-GPT, Claude 等，具备顺畅访问 Google, Chat-GPT, 和 Claude 的能力，除了对话之外，特别注意 coding 方面的能力。
- Linux 和 GIT 的基本操作，其中不掌握任何Linux基础知识的，可以先用 WSL2 熟悉。特别是其中 **ssh 公钥和私玥**的使用方法
  - 所谓WSL，即 Windows Subsystem for Linux 官方安装教程：https://learn.microsoft.com/en-us/windows/wsl/install
  - Linux 需要了解 `LIBRARY_PATH, LD_LIBRARY_PATH, PATH, INCLUDE, MANPATH`，这5个环境变量的使用方法
  - [An interactive Git visualization tool to learn concept](https://learngitbranching.js.org/)
- 机器学习模型搭建的基本操作，
  - 最低要求熟练跑通 Torch 官方 [DistributedDataParallel](https://docs.pytorch.org/tutorials/intermediate/ddp_tutorial.html) 中的 "nccl" 和 "gloo" 即 GPU 和 CPU 的训练后端。
  - Python + numpy + pandas + h5py + PyTorch + matplotlib + jupyter + VScode 的熟练运用
- 熟读[提问的智慧](https://github.com/ryanhanwu/How-To-Ask-Questions-The-Smart-Way/blob/main/README-zh_CN.md)，之后再提问，特别注意**不着编边际的问题**。
- 简单而言，先中文搜索，然后英文搜索，deepseek chat-GPT，claude 等全部都搜一遍。如果还是无法解决再在群里提问，或者找师兄师姐们，**最后再去问老师**。
- 如果花了 5 天以上的时间搞不定，那就还是去问问人。


### 账号开通列表 <span id="open_accounts"> </span>
- [ ] 等离子体物理研究所邮箱 - 询问自己室的秘书
- [ ] 开通新神马和老神马账号，特别是要开通新神马 DCU 权限 - 刘晓娟老师负责
- [ ] EAST 账号 [Link](http://eastapp.ipp.ac.cn/eam/index.php) - 王枫老师管理 
- [ ] 加入小组 [WPS 共享资料库](https://kdocs.cn/join/gl3pii5?f=101) - **更改 WPS 用户名至真实姓名之后再申请加入**
- [ ] 生成 ed25519 算法的 ssh 公钥， 上传到`共享资料库/Storage/ssh/组内公钥.docx`
  > 生成方法 `ssh-keygen -t ed25519 -C "<yourname>"` 
- [ ] 组内 AI 中转站账号，参考 [Vibe Coding and Connection](../vibe-codings/)

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
- [EAST logbook](http://202.127.205.15:1080/)
- [EAST 常用物理参数列表](http://202.127.205.54/wiki/index.php/Fundamental_parameters_(signal_name))
- [EAST 账号密码重置](http://eastapp.ipp.ac.cn/eam/ForgetPassword.php)
- [合肥物质科学研究院 WebVPN](https://vpn.hfcas.ac.cn/)
- [Fusion Wiki 基本的tokamak 概念定义](https://wiki.fusion.ciemat.es/wiki/Main_Page)
- [Fusion 术语表](https://euro-fusion.org/services/eurofusion-glossary/)
- [简单的公用服务器教程](https://www.zhihu.com/question/506241986/answer/3457669268)
- [Tokamak Components](https://3d.energyencyclopedia.com/tokamak_reactor)
- [Tokamak Simulator](https://www.fusionsimulator.io/run/iter?preset=hmode)

## 代码开发
- 工具链：Conda + Pytorch ( >= 2.4 推荐 latest stable version ) + Python >= 3.9 (推荐3.12)。PS：目前 Conda 对于组织已经不是免费的了，后续会逐步迁移至x [miniforge](https://github.com/conda-forge/miniforge), miniforge 用法和 conda 一样，只是是完全基于开源社区的。
- 数据库目前是基于 HDF5 的内部数据库
- 代码风格见 [开发规范](../development-styles)。
- 内部 private_modules 包，有很多常用的数据操作方法，请不要分享。具体使用方法可以咨询王明龙

### MDSplus 数据库读取的简略方法 - Python
- 安装 https://github.com/MDSplus/mdsthin
- 参考 GitHub 中的相关教程。其中用 with statement 是推荐方法，因为自动关闭 Connections 可以节省 MDSplus 数据库的 TCP 连接资源。
  
```python
import mdsthin
def mdsthin_get(shot, tree_name, node_name, server_name='mds.ipp.ac.cn'):
    node_name = rf'\{node_name}'
    with mdsthin.Connection(server_name) as c:
        c.openTree(tree_name, shot)
        node_data = c.get(node_name).data()
        node_time = c.get(f'dim_of({node_name})').data()
        # c.disconnect() will be called automatically
    return node_data, node_time
shot = 100000
tree_name = 'east'
node_name = 'ipm'
server_name = 'mds.ipp.ac.cn'
mdsthin_get(shot, tree_name, node_name, server_name)
```

## EAST的数据使用

1. **请不要用 python 脚本读取MDS+数据库**。虽然我们内部的有相对应的数据读取方法，但是这个会影响到 EAST 正常实验的进行。如果需要使用，请一定要征得 chenguang.wan 的同意
<!-- 2. 数据库位置 `/gpfs/mds_data/DataBase`，这个是基于 HDF5 的数据库，支持多进程的读写。如果你想要的数据没有，请联系 chenguang.wan 或 minglong.wang -->
2. 数据库所有的数据请不要进行除读数据外的任何操作。**误删**会影响**所有人的工作**

### 数据库使用方法
1. 新神马服务器数据 `/data/share/chenguang_wan/DataBase`，该数据库支持高 IO 的数据访问，可以使用 Python 高 IO 的读取
2. 具体使用教程可以询问：王明龙和卢敬敬

## 论文撰写

论文署名、模板、排版、文献规范、致谢、可投期刊和所内投稿流程，详见 [论文撰写和投稿](../paper-writing/)。

## 文献管理

- 文献管理 -- 使用 Zotero
  - 使用Better BibTex 插件导出`.bib`文件，其中需要添加自定义配置以实现规范的Citation Keys, 设置 Edit -> Settings -> Better BibTex -> Citation keys和Active citation key formula 均设置为: `auth(0,1,author,false).capitalize+year`
  - 可使用Better Notes 插件实现基于markdown的笔记功能
  - Zotero 可以配置 WebDav / Sync Disk 以实现跨端同步文件和笔记的功能
  - WebDav 配置可以参考[中国科技云webdav支持](https://kb.cstcloud.cn/team/1904464900890169344/kb/1923253559269396480/read/798915966095333423)
- Local AI 模型接入读文献：[beaver-zotero-local](https://github.com/chgwan/beaver-zotero-local)
  - Zotero 的 AI 文献助手插件，接入自己的大模型服务，不需要注册账号，数据不经过任何其他服务器。

## 管理要求
- 所有组内同学，**必须按照一周一次的频率**在周三发送周总结报告至 chenguang.wan@ipp.ac.cn。
- **保持邮件畅通**，在手机上安装相应的邮件程序。包括论文、会议等学术活动的通知大多使用邮件。PS: 中科院邮件客户端[设置教程](https://help.cstnet.cn/changjianwenti/youjianshoufa/kehuduan.htm)

## 其他说明

- 有部分链接无法访问可能是以下原因：
  - WPS 私有链接，如果你是小组成员，请联系 chgwan 加入到小组内部共享列表, **加入之前请给 wps 用户名改成真实姓名**。
  - WPS 私有链接，如果你不是小组成员，这部分内容比较私密不共享。
  - 可能需要魔法上网
  
- RSS订阅列表，方便及时追踪最新通知
  - [合肥物质科学研究院科研规划处](https://politepol.com/fd/iYjG8cdjXr5m.xml)
  - [等离子体所通知](https://politepol.com/fd/iTZb41hW1tqT.xml)
  - [合肥物质科学研究院研究生处](https://politepol.com/fd/MfAI440x47sF.xml)

## 中国科技云
链接：https://www.cstcloud.cn/

开通等所邮件之后，就有科技云的访问权限了。科技云可用来 Latex 协作，免费的 webdav 支持，免费的开源镜像服务。有兴趣可以了解一下使用方法。

- [科技云知识广场](https://kb.cstcloud.cn/square)