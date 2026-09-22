---
title: Vibe Coding and Connections
author: chgwan
tags: [Tutorial, Note]
media_subpath: "/assets/img/commons"
---

# 简化版 Vibe coding 和新神马连接教程

## 所外登录到所内

### 网络配置

- 配置自己的 `~/.ssh/config`

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
        ```

- 在你配置之后，可以通过 `ssh` 到相应的节点登录，同样也可以使用 `vscode`。

## 中转站账号

首先请联系管理员，获取你个人的 key。key 不要分享、提交到 Git 或在网络公开。

### 基本信息

| 项目 | 值 |
| --- | --- |
| anthropic endpoint | `https://146.56.207.178:58808` |
| OpenAI endpoint | `https://146.56.207.178:58808/v1` |
| key | `sk` 开头的字符串，由管理员发放 |

### 限额

1. 每人每月暂定为：$1000 / month，如果有需求，说明情况后可以联系管理员提高。
2. GLM 相关 api 为半价。
3. 非必要不要使用 `astra` 和 `fable-5`，这个很贵，可能很快就用完你自己的限额了。
4. 用量查看：访问 https://146.56.207.178:58809 ，在 api-key-view 粘贴个人 key 即可。

## 快速聊天：Cherry Studio

只聊天、不写代码的话，用 Cherry Studio 最快。

### 安装

- 下载安装：https://cherryai.com.cn/
- 官方教程：https://docs.cherryai.com.cn/pre-basic/providers/providers

### 添加中转站

1. 左下角点击「设置」，进入 **Model Provider**，在供应商列表底部点 **+ Add Provider**。
2. 在弹出的 **Add Custom Provider** 里，Provider Name 填任意名字（例如 `WAN`），API Key 填自己的 key。
3. **Endpoint settings** 里填 **Anthropic** 一栏：`https://146.56.207.178:58808`，下方会提示 Request path 为 `.../v1/messages`；如果用 **OpenAI** 一栏，则填 `https://146.56.207.178:58808/v1`。
4. 点 **Add** 保存，回到该供应商页面，点右上角 **Sync models** 同步模型列表。
5. 点击右上角 add all models

### 设置默认模型

在「默认模型 / Default Model」里选常用模型。**请不要选择 `Fable 5` 和 `astra` 作为默认模型**，这两个模型特别贵，用起来消耗非常大；其他的模型可以任意选择。

## AI coding tools 下载与安装

### Claude Code

#### official version， 需要你有一定的网络技巧

该方法，不提供任何支持，如果出现问题，请自行排查。

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

参考链接: https://code.claude.com/docs/en/overview

#### Local version， 适合你快速开始，但是后期不更新

文件位置： `/data/share/chenguang_wan/Backups/Softwares/ClaudeCode`
安装方法：copy 到你的 home 目录，然后执行该文件。`bash claude-*.sh`

### Codex

- 下载方法类似于 Claude, 但是更加容易 具体可以参考 https://developers.openai.com/codex/cli
- 注册免费的 ChatGPT 账号，不要问我为什么打不开链接，这个你需要魔法。

## 连接本组中转站

本部分展示 Codex 和 Claude Code 的客户端配置，地址和 key 见上面的「基本信息」。

### 可用模型

该表不更新，最新支持的模型列表请用自己的 key 查询：

```bash
curl -H "Authorization: Bearer your_api_key" https://146.56.207.178:58808/v1/models
```

截至 2026-09-22，`/v1/models` 返回的 model id 共 50 个，分组如下。**请照抄 id，包括大小写**（GLM 系列大小写不统一是服务端原样返回的）：

| 分组        | model id                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| claude      | `claude-opus-5`、`claude-opus-4-8`、`claude-opus-4-7`、`claude-opus-4-6`、`claude-opus-4-5-20251101`、`claude-opus-4-1-20250805`、`claude-opus-4-20250514`、`claude-opus`、`claude-sonnet-5`、`claude-sonnet-4-6`、`claude-sonnet-4-5-20250929`、`claude-sonnet-4-20250514`、`claude-3-7-sonnet-20250219`、`claude-haiku-4-5-20251001`、`claude-haiku`、`claude-3-5-haiku-20241022`、`claude-fable-5-1`、`claude-fable-5` |
| glm         | `GLM-4.5`、`GLM-4.5-Air`、`GLM-4.6`、`glm-4.7`、`GLM-5`、`GLM-5-Turbo`、`GLM-5.1`、`glm-5.2`、`glm-5.3`、`glm-5.3[1m]`、`glm-5.3-flash`、`glm-5.3-flash[1m]`                                                                                                                                                                                                                                                              |
| gemini      | `gemini-3-flash`、`gemini-3.1-pro-low`、`gemini-3.1-flash-lite`、`gemini-3.1-flash-image`、`gemini-3.5-flash-lite`、`gemini-3.6-flash-high`、`gemini-3.7-flash-high`、`gemini-3.8-flash-high`、`gemini-pro-agent`                                                                                                                                                                                                         |
| gpt / codex | `gpt-6-astra`、`gpt-5.6-sol`、`gpt-5.6-luna`、`gpt-5.6-terra`、`gpt-5.5`、`gpt-image-2.5`、`gpt-image-2.5-flare`、`gpt-image-2.5-sunburst`、`gpt-image-2`、`gpt-image-1.5`、`codex-auto-review`                                                                                                                                                                                                                           |

中转站不区分接口，上面任意 model id 都可以填到 `<codex_model>` 或 `<claude_model>`。

**推荐优先使用 glm 和 gpt 系列**，例如 `glm-5.3`、`gpt-5.6-sol`；claude 系列非必要不建议使用。另外 `gpt-6-astra` 和 `claude-fable-5`（含 `claude-fable-5-1`）也请注意不要高频使用。

### Codex 配置（OAuth 登录方式）

先在 Codex 中使用任意 ChatGPT 账号登录，可以是免费账号。修改 `~/.codex/config.toml`；没有该文件时请先创建 `~/.codex/` 目录和文件。顶层字段放在 `[model_providers.WAN]` 之前：

```toml
model_provider = "WAN"
model = "<codex_model>" # any support model
model_reasoning_effort = "xhigh"

[model_providers.WAN]
base_url = "https://146.56.207.178:58808/v1"
experimental_bearer_token = "your_api_key" # 替换为在本组中转站中为 Codex 创建的 API Key
name = "OpenAI"
wire_api = "responses"
requires_openai_auth = true
supports_websockets = true
```

保存后重新启动 `codex`。注意这里的 `base_url` **需要带 `/v1`**；推理强度应按所选模型的支持情况调整。

### Claude Code 配置

修改 `~/.claude/settings.json`，合并以下字段；没有该文件时请先创建 `~/.claude/` 目录和文件：

```json
{
  "env": {
    "CLAUDE_CODE_AUTO_COMPACT_WINDOW": "1000000",
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1",
    "API_TIMEOUT_MS": "3000000",
    "NO_PROXY": "localhost,127.0.0.1,::1",
    "ANTHROPIC_BASE_URL": "https://146.56.207.178:58808",
    "ANTHROPIC_AUTH_TOKEN": "your_api_key"
  },
  "model": "<claude_model>"
}
```

- `ANTHROPIC_BASE_URL` **不要添加 `/v1`**，客户端会补全 API 路径。
- 请一定要设置 `"CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"`，防止不小心封号了。
- 保存后退出已有会话，在新终端中运行 `claude`。
