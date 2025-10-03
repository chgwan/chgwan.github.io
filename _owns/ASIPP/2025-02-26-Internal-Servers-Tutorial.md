---
title: Internal Servers Tutorial
author: chgwan
tags: [Tutorial, Note]
media_subpath: "/assets/img/commons"
--- 
## USTC 瀚海
### 使用入门
参考瀚海 22 [使用手册](https://scc.ustc.edu.cn/389/list.htm?from=kdocs_link)

### Slurm 的使用提交
```bash
# the below submit
sbatch --job-name=ert-dist --gres=gpu:8 -n64 -N1 slurm_sub.sh --script=<script-path> --config=<config_path>
```

其中，slurm_sub.sh 为提交模板，可以自行查看或修改，本模板仅提供 pytorch 环境支持，其他问题请自行解决。

gpu:8 -n64 修改为 gpu:1 -n8  即为调试模式

### 一些有用命令
`sinfo` 查看所有队列状态

`scontrol show node` 查看节点信息

`sacctmgr show | grep qos` 查看任务优先级，是否能很快被执行

### 其他事项
- 瀚海的存储是收费的，所以建议及时清理不用的文件，特别是训练完毕之后无用的模型文件
- 不允许在登录节点运行大代码
- 不允许直接`ssh`到计算节点进行计算，必须通过slurm登录
  
## 海外特别服务器，计算资源非常充足

### 服务器简介
1. **NSCC：**sg超算中心服务器，由很多**A100**的计算节点，每个A100 40GB内存，可以通过不同脚本实现不同数量的A100调用，每个节点节点最多4个A100
2. **sgGPU**  NTU H200 和 A100 服务器，**4\*H200 + 4\*A100**，每个A100 80GB内存，H200 140GB内存

### 开通和登录
1. 生成 rsa key 对，给公钥发给 chgwan，开通完会提供相应的 ip 和 port
2. **NSCC 登录：**` ssh -i <your_private_key> -J chenguang.wan@<ip_addr>:port chenguan@aspire2antu.nscc.sg` 或者 `ssh -o "ProxyCommand ssh -i <your_private_key> -W %h:%p publicuser@<ip_addr> -p <port>" -i <your_private_key> chenguan@aspire2antu.nscc.sg` 前者不行的时候就试试后者。
3. **sgGPU 登录：**`ssh chenguang.wan@<ip_addr>:<port>`

### sgGPU使用方法
使用方法类似于135,108，**唯一的区别是**`userhome` 目录有 quota 限制，所以**除代码和配置文件外**的所有数据都需要存储于 `userhome/DATABASE` 文件夹而不能直接放在 home 的根目录。**可以用vscode**

### NSCC使用方法
1. 由于 NSCC 的设置无法使用基于 ray 的自动调优，所以修改至基于 optuna 的调优，具体使用方法见 `$HOME/Papers/WestD0/v2/run_model_dist.py` 中的 `tune` 操作。其他操作请同样参见该脚本。
2. 提交脚本例子位置 `$HOME/templates`, 其中 gpu 支持的时间为 `walltime` 为 02，24 和 120h，即 `02:00:00, 24:00:00, 120:00:00`，单节点最多支持 4 个 gpu，目前使用的是 A100 * 4， 内存为 40GB 和常用的 80GB 不同，使用的时候要考虑是否会超内存
3. 其他个性化的提交脚本操作见 torque 使用和 https://help.nscc.sg/
   
### NSCC注意事项
1. `userhome` 目录有 quota 限制，所以**除代码和配置文件外**的所有数据都需要存储于 `userhome/DATABASE` 文件夹而不能直接放在 home 的根目录。
2. 不建议使用 `userhome/DATABASE` 文件夹存储代码，因为这个文件夹属于数据文件夹，读取速度有限，所以代码应该存在 home 目录，该文件夹用以保存数据，可以创建一个个人数据文件夹给所有数据都放在该文件夹，然后通过符号链接的方式实现不同的项目数据均保存于该处。
3. 总结来说：代码放 `userhome/` 下自己的文件夹中，数据和模型等文件保存至 `userhome/DATABASE` 下自己的文件夹中
4. **不允许在登录节点运行大代码，单次运行代码要≤2个cpu核，最好只用1个核。如果运行时间小于5分钟，也可以短暂的使用64核运行。**该服务器**可以用vscode**，具体配置方案请自行搜索。
   



## ~~135 和 108 （已失效）~~

### 135

**135** 4 卡 3090，ip: 202.127.205.186，目前该服务器用于新手同学的练习

### 108

**108** 4 卡 P100，ip：202.127.205.135，目前该服务器用于数据库映射支持，大家能在别的服务器访问 `DATABASE` 的**硬件支持**，所以非常不建议在该服务器运行网络密集型脚本。

由于 108 是 Centos 7 系统，目前 vscode 已经不支持直接访问太老的服务器。现在新增加了一个 hack 方法，使得 108 可以连接 vscode。登录 108 服务器的 terminal，粘贴并执行下列命令，即可实现vscode直接连接，**只需要执行一次**。

```bash
cat << 'EOF' >> ~/.bashrc
export VSCODE_SERVER_CUSTOM_GLIBC_LINKER=/home/share/sysroot/lib/ld-linux-x86-64.so.2
export VSCODE_SERVER_CUSTOM_GLIBC_PATH=/home/share/sysroot/usr/lib:/home/share/sysroot/lib
export VSCODE_SERVER_PATCHELF_PATH=/home/share/sysroot/usr/bin/patchelf
EOF

source ~/.bashrc
```

### 特别命令

也就是说仅在这两个服务器有，别的服务器都没有的

`clear-gpu`：以管理员身份 clear 所有的 GPU 占用，135 和 108 都有，使用的时候要尊重其他用户，在其他人都不使用的时候才能用这个命令

`mount-108-db`: 挂载 108 数据库 /gpfs/mds_data 到 135 上，使用方法见运行命令提示


## 194，189，161访问随时可能中断

### 服务器简介

密码：grouptokai1=  账号：cgwan

**194**  八卡 3090，ip: 202.127.204.194 

**161** 单卡 A800，ip: 202.127.205.161 不支持数据挂载，待升级

**189**  双卡 A800，ip: 202.127.204.189

### 数据共享，共享账号

数据位置：`/data/ASIPP/cgwan/DATABASE`，或者通过调用环境变量 "DATABASE_PATH" 来实现多个服务器的代码统一。如果没有该文件夹，即需要自己传输数据，因为该服务器不支持数据挂载。

其他用法类似于 135 和 108，但是由于是共享账号，请大家使用的时候，不要一个人创建多个文件夹，
每个人都自己创建单独的文件夹，所有操作都在自己的文件夹内进行。除非必要一般不要修改 `.bashrc` 文件。

环境可以自己创建，也可以用共享环境 torch `conda env create -f torch.yml`

## 新神马DCU使用教程

**内部使用，不许分享**

- 官方链接：https://www.scnet.cn/help/docs/mainsite/ai/
<!-- 其他有用参考：https://www.cnblogs.com/zhihh/p/18489338/Chengdu_HPC_Usage_Record -->
<!-- 用户需要在 render 用户组才可以使用 dcu，所以需要先咨询管理员给用户加在 render 组 -->

- chgwan 不提供除跑通 benchmark 代码外的其他任何支持，包括不限于 vscode 登录，是否支持免密等。这种东西请自行搜索 !!
- 数据库位置： `/data/share/chenguang_wan/DataBase`, 只读权限
### 常用命令

`lscpu`, `rocm-smi`, `hy-smi` 

`ssh <username>@202.127.205.70 -p 6021`


### 具体 DCU 教程
1. 联系 chgwan 开通对应的DCU权限
2. 登录到新神马DCU 381/382
3. 创建并激活 **python 3.11** 环境，例 `conda create -n torch python==3.11`, 
4. 安装 numpy 且其需小于2.0，即1.X 版本，目前是推荐1.26.x，可自行决定版本。
5. `cp -r /data/share/chenguang_wan/torch_2.4.1_dcu/* ~`
6. `ssh shenmagpu381` 或者 `ssh shenmagpu382`
7. `module use .modulefiles`, ps：这个可以写到 `.bashrc` 中，这样可以不每次都打该命令
8. `module load mydtk/dtk-25.04`
9. `cd dcu_whl`, `pip install *.whl` ：切换到 `dcu_whl`  文件夹中安装所有的 `*.whl`
10. 测试torch是否能工作 `python torch_benchmark.py`

### DCU flashAttn 支持
**安装方法**
```bash
pip install triton
# install flashAttn
git clone git@github.com:Dao-AILab/flash-attention.git
cd flash-attention
FLASH_ATTENTION_TRITON_AMD_ENABLE="TRUE" python setup.py install
```
**python 代码块测试**
```python
# using
import os
os.environ['FLASH_ATTENTION_TRITON_AMD_ENABLE']='TRUE'
os.environ['FLASH_ATTENTION_TRITON_AMD_AUTOTUNE']='TRUE' # comment out, if the code can not work
from flash_attn import flash_attn_qkvpacked_func, flash_attn_func # no warnings and errors
```

### DCU 其他支持
- 2025-09-20：DCU 安装的是基于 AMD，ROCm的技术方案，ROCm 版本为 `6.3.25211`， 目前大多数框架均支持 ROCm, 其中以 OpenAI, triton 为基础蓝本，可以在此技术基础上调试
- AMD 模型加速: https://rocm.docs.amd.com/en/latest/how-to/rocm-for-ai/inference-optimization/model-acceleration-libraries.html
- DCU 其他安装环境支持： https://cancon.hpccube.com:65024/4/main
- 最后请大家**多多尝试**，如果非 DCU 版 PyTorch 官方 API 问题，一般均有对应的解决方案，不要一味等待，更不要武断的下结论。

### DCU 网络环境 hacking 方案，请不要分享，该方法仅为了方便使用，官方不支持

执行下列命令，出现ip则为有网络，其他服务请自行搜索如何设置代理服务器。
``` bash
# set internet access in dcu node. 
export http_proxy="socks5h://localhost:7070"
export https_proxy="socks5h://localhost:7070"
curl ifconfig.me
```

## 新神马小集群

- 登录ip：202.127.205.186, port 5074 
- 所有人home目录限制大小为 3T，所有文件都可以放在 home 下面。
- 目前数据盘 `/gpfs` 容易掉，待解决 


### TODOs
- [ ] 数据访问

## 一些建议：
- conda / mamba: Do not install anything into the `base` environment as this might break your installation