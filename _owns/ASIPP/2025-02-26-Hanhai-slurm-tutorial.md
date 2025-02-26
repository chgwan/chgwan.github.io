---
title: Hanhai slurm tutorial
author: chgwan
date: 2025-02-26
# tags: [tutorial, note]
media_subpath: "/assets/img/commons"
--- 
## 使用入门
参考瀚海22[使用手册](https://scc.ustc.edu.cn/389/list.htm?from=kdocs_link)

## Slurm 的使用
```bash
sbatch --job-name=ert-dist --gres=gpu:8 -n64 -N1 slurm_sub.sh --script=<script-path> --config=<config_path>
```

其中，slurm_sub.sh 为提交模板，可以自行查看或修改，本模板仅提供pytorch环境支持，其他问题请自行解决。

gpu:8 -n64 修改为 gpu:1 -n8  即为调试模式

## 一些有用命令
`sinfo` 查看所有队列状态

`scontrol show node` 查看节点信息

`sacctmgr show | grep qos ` 查看任务优先级，是否能很快被执行

