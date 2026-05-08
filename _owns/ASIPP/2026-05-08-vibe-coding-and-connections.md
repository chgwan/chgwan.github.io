---
title: Vibe Coding and Connections
author: chgwan
tags: [Tutorial, Note]
media_subpath: "/assets/img/commons"
--- 
# 简化版 Vibe coding 和新神马连接教程

## 所外登录到所内

### 网络配置
-  配置自己的 `~/.ssh/config`
    
    ```bash
    Host PublicJump1
        HostName 146.56.207.178
        Port 40000
        User publicuser
    Host PublicJump2
        HostName 127.0.0.1
        Port 60002
        User publicuser
        ProxyJump PublicJump1 
    # specific for oversea servers
    Host PublicJump3
        HostName 127.0.0.1
        Port 50000
        User publicuser
    # NewShenma Login
    Host NSMLogin
        User <nsm_account>
        HostName 202.127.205.70
        Port 6021
        ProxyJump PublicJump2
    # DCU debug node login
    Host DCU383
        User <nsm_account>
        HostName shenmagpu383
        ProxyJump TxToNSM
    ```

- 在你配置之后，可以通过 `ssh` 到相应的节点登录，同样也可以使用 `vscode`。

----
### 设置网络代理
- 保存下列设置到 `proxy.sh`， 然后 `source proxy.sh`，执行该步骤之后。
- 该代理脚本在DCU节点运行后，DCU节点就会通网。如果部分应用不通网，请手动设置该网络到代理端口。该代理为 http 协议代理。
- 为保证符合法律要求，本网络只可以访问中国的服务器，不要问为什么不能访问 GPT/Anthropic/Google 等问题，该问题请自行解决。

``` bash
## save as proxy.sh
PROXY_URL="http://127.0.0.1:7070"
export http_proxy="$PROXY_URL"
export HTTP_PROXY="$PROXY_URL"
export https_proxy="$PROXY_URL"
export HTTPS_PROXY="$PROXY_URL"
export all_proxy="$PROXY_URL"
export ALL_PROXY="$PROXY_URL"
export no_proxy="localhost,127.0.0.1,::1"
export NO_PROXY="localhost,127.0.0.1,::1"
echo "Proxy set to $PROXY_URL
```

---
## Claude Code 下载与安装
### official version， 需要你有一定的网络技巧

该方法，不提供任何支持，如果出现问题，请自行排查。

```bash 
curl -fsSL https://claude.ai/install.sh | bash
```
参考链接: https://code.claude.com/docs/en/overview

### Local version， 适合你快速开始，但是后期不更新
文件位置： `/data/share/chenguang_wan/Backups/Softwares/ClaudeCode`
安装方法：copy 到你的 home 目录，然后执行该文件。`bash claude-*.sh`

### Claude Code GLM 配置
- 修改 `~/.claude/settings.json`， 如果没有的话，请创建该文件。
- "your_zai_api_key" 请联系 chgwan，该 API 为本组采购。使用该API之前，请自己注册免费账号试用。测试完毕再使用
  - 不允许使用 OpenClaw/MaxHermes 等自动化 Agent。如果使用了，后果非常严重。请一定牢记。
  - **不允许分享，更不允许在网络公开。**

```
{
  "env": {
    "HTTP_PROXY": "http://127.0.0.1:7070",
    "HTTPS_PROXY": "http://127.0.0.1:7070",
    "NO_PROXY": "localhost,127.0.0.1,::1",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "glm-4.5-air", 
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "glm-5-turbo", 
	"ANTHROPIC_DEFAULT_OPUS_MODEL": "glm-5.1",
	"ANTHROPIC_AUTH_TOKEN": "your_zai_api_key", 
	"ANTHROPIC_BASE_URL": "https://api.z.ai/api/anthropic", 
	"API_TIMEOUT_MS": "3000000"
  }
}
```

- 配置完成后在 terminal 执行 `claude` 就可以运行。
- 更多的 GLM 相关教程，请参考 https://docs.z.ai/devpack/tool/claude

## Codex 

### 下载
- 下载方法类似于 Claude, 但是更加容易 具体可以参考 https://developers.openai.com/codex/cli。 将相对应的源，换成清华源就会快很多

### 使用
- 可以自己开通一个账号，目前价格也不是很贵 $20 / 月
- 另外可以用组内共享账号，注意不要经常换 IP 登录 codex 防止账号被封


---
## Codex, Claude, Gemini CLIs 

本部分只是为了提供展示。为了符合法律法规，本教程不提供任何 API 和运行方法。

### Codex
