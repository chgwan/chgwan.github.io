---
title: Internal Servers Tutorial
author: chgwan
date: 2025-02-26
tags: [Tutorial, Note]
media_subpath: "/assets/img/commons"
--- 
## USTC 瀚海
### 使用入门
参考瀚海22 [使用手册](https://scc.ustc.edu.cn/389/list.htm?from=kdocs_link)

### Slurm 的使用提交
```bash
# the below submit
sbatch --job-name=ert-dist --gres=gpu:8 -n64 -N1 slurm_sub.sh --script=<script-path> --config=<config_path>
```

其中，slurm_sub.sh 为提交模板，可以自行查看或修改，本模板仅提供pytorch环境支持，其他问题请自行解决。

gpu:8 -n64 修改为 gpu:1 -n8  即为调试模式

### 一些有用命令
`sinfo` 查看所有队列状态

`scontrol show node` 查看节点信息

`sacctmgr show | grep qos ` 查看任务优先级，是否能很快被执行

### 其他事项
- 瀚海的存储是收费的，所以建议及时清理不用的文件，特别是训练完毕之后无用的模型文件

## 135 和 108

### 特别命令

也就是说仅在这两个服务器有，别的服务器都没有的

`clear-gpu`：以管理员身份clear所有的GPU占用, 135 和 108 都有，使用的时候要尊重其他用户，在其他人都不使用的时候才能用这个命令

`mount-108-db`: 挂载108数据库/gpfs/mds_data到135上，使用方法见运行命令提示


## 194，189，161

### 服务器简介

密码：grouptokai1=  账号：cgwan

**194**  八卡3090，ip: 202.127.204.194 

**A800** 单卡A800，ip: 202.127.205.161

**189**  双卡A800，ip: 202.127.204.189

### 数据共享，共享账号

数据位置：`/data/ASIPP/cgwan/DATABASE`，或者通过调用环境变量"DATABASE_PATH"来实现多个服务器的代码统一。

其他用法类似于135和108，但是由于是共享账号，请大家使用的时候，不要一个人创建多个文件夹，
每个人都自己创建一个文件夹，所有操作都在自己的文件夹内进行。除非必要一般不要修改`.bashrc`文件。

环境可以自己创建，也可以用共享环境torch `conda env create -f torch.yml`

