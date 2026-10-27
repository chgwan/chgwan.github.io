---
title: Vibe Coding and Connections
author: chgwan
tags: [Tutorial, Note]
media_subpath: "/assets/img/commons"
---

# 简化版 Vibe coding 的中转站使用手册

## 中转站账号

首先请联系管理员，获取你个人的 key。key 不要分享、提交到 Git 或在网络上公开。

### 基本信息

| 项目               | 值                                |
| ------------------ | --------------------------------- |
| Anthropic endpoint | `https://146.56.207.178:58808`    |
| OpenAI endpoint    | `https://146.56.207.178:58808/v1` |
| key                | `sk` 开头的字符串，由管理员发放   |

### 限额

1. 每人每周暂定 $250，如有需要，说明情况后可联系管理员提高。
2. GLM 相关 API 按半价计费，**推荐优先使用智谱的 API**：一方面支持国产，另一方面很多任务用不上很复杂的模型。
3. 非必要不要使用 `gpt-6-astra` 和 `claude-fable-5`，这两个模型很贵，可能很快就会用完你的限额。
4. 用量查看：访问 <https://146.56.207.178:58809>，在 api-key-view 中粘贴个人 key 即可。

### 可用模型

该表不会持续更新，最新支持的模型列表请用自己的 key 查询：

```bash
curl -H "Authorization: Bearer your_api_key" https://146.56.207.178:58808/v1/models
```

截至 2026-09-22，`/v1/models` 返回的 model id 共 50 个，分组如下。**请照抄 id，包括大小写**（GLM 系列大小写不统一，是服务端原样返回的）：

| 分组        | model id                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| claude      | `claude-opus-5`、`claude-opus-4-8`、`claude-opus-4-7`、`claude-opus-4-6`、`claude-opus-4-5-20251101`、`claude-opus-4-1-20250805`、`claude-opus-4-20250514`、`claude-opus`、`claude-sonnet-5`、`claude-sonnet-4-6`、`claude-sonnet-4-5-20250929`、`claude-sonnet-4-20250514`、`claude-3-7-sonnet-20250219`、`claude-haiku-4-5-20251001`、`claude-haiku`、`claude-3-5-haiku-20241022`、`claude-fable-5-1`、`claude-fable-5` |
| glm         | `GLM-4.5`、`GLM-4.5-Air`、`GLM-4.6`、`glm-4.7`、`GLM-5`、`GLM-5-Turbo`、`GLM-5.1`、`glm-5.2`、`glm-5.3`、`glm-5.3[1m]`、`glm-5.3-flash`、`glm-5.3-flash[1m]`                                                                                                                                                                                                                                                              |
| gemini      | `gemini-3-flash`、`gemini-3.1-pro-low`、`gemini-3.1-flash-lite`、`gemini-3.1-flash-image`、`gemini-3.5-flash-lite`、`gemini-3.6-flash-high`、`gemini-3.7-flash-high`、`gemini-3.8-flash-high`、`gemini-pro-agent`                                                                                                                                                                                                         |
| gpt / codex | `gpt-6-astra`、`gpt-5.6-sol`、`gpt-5.6-luna`、`gpt-5.6-terra`、`gpt-5.5`、`gpt-image-2.5`、`gpt-image-2.5-flare`、`gpt-image-2.5-sunburst`、`gpt-image-2`、`gpt-image-1.5`、`codex-auto-review`                                                                                                                                                                                                                           |

中转站不区分接口，上面任意 model id 都可以填到下文各工具的模型设置里（如 `<codex_model>`、`<claude_model>`）。

**推荐优先使用 glm 和 gpt 系列**，例如 `glm-5.3`、`gpt-5.6-sol`；claude 系列非必要不建议使用。另外 `gpt-6-astra` 和 `claude-fable-5`（含 `claude-fable-5-1`）也请注意不要高频使用。

### 支持的工具

- 本站支持所有 Z.AI 支持的工具，请参考 [Z.AI supported tools](https://docs.z.ai/devpack/tool/others#step-1-supported-tools)。
- 同样支持所有 CLIProxyAPI 支持的工具，请参考 [CLIProxyAPI supported tools](https://help.router-for.me/agent-client/claude-code.html)。

## 工具推荐

按使用场景分为 CLI、VS Code 插件、通用配置管理、桌面端和手机端五类，地址和 key 见上面的「基本信息」。

| 分类         | 推荐工具                      | 适用场景                                                         |
| ------------ | ----------------------------- | ---------------------------------------------------------------- |
| CLI          | Claude Code、Codex            | 在终端 / 服务器上写代码、跑任务，**vibe coding 首选**            |
| VS Code 插件 | Claude Code、Codex            | 在编辑器里写代码，可配合 Remote-SSH 使用                         |
| 通用配置管理 | CC Switch                     | 图形界面统一管理 Claude Code、Codex 等工具的中转站配置，一键切换 |
| 桌面端       | Cherry Studio                 | 日常聊天、查资料                                                 |
| 手机端       | Cherry Studio、Chatbox、Agora | 随手提问、查看回答                                               |

### CLI

#### Claude Code

##### 安装

- **官方版本**：需要你有一定的网络技巧。该方法不提供任何支持，出现问题请自行排查。

  ```bash
  curl -fsSL https://claude.ai/install.sh | bash
  ```

  参考链接：<https://code.claude.com/docs/en/overview>

- **NSM 本地版本**：适合快速上手，但后期不会更新。
  - 文件位置：`/data/share/chenguang_wan/Backups/Softwares/ClaudeCode`
  - 安装方法：复制到你的 home 目录，然后执行 `bash claude-*.sh`

##### 配置

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

- `ANTHROPIC_BASE_URL` **不要添加 `/v1`**，客户端会自动补全 API 路径。
- 请一定要设置 `"CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"`，防止意外封号。
- 保存后退出已有会话，在新终端中运行 `claude`。

#### Codex

##### 安装

- 安装方法与 Claude Code 类似，但更简单，具体参考 <https://developers.openai.com/codex/cli>。
- 注册一个免费的 ChatGPT 账号。打不开链接的话，需要自行解决网络问题。

##### 配置

先在 Codex 中使用任意 ChatGPT 账号登录，免费账号即可。然后修改 `~/.codex/config.toml`；没有该文件时请先创建 `~/.codex/` 目录和文件。顶层字段要放在 `[model_providers.WAN]` 之前：

```toml
model_provider = "WAN"
model = "<codex_model>" # any support model
model_reasoning_effort = "xhigh"

[model_providers.WAN]
base_url = "https://146.56.207.178:58808/v1"
experimental_bearer_token = "your_api_key" # 替换为在本组中转站中为 Codex 创建的 API Key
name = "WAN"
wire_api = "responses"
requires_openai_auth = true
supports_websockets = true
```

保存后重新启动 `codex`。注意这里的 `base_url` **需要带 `/v1`**；推理强度应按所选模型的支持情况调整。

### VS Code 插件

在 VS Code 扩展市场搜索安装 **Claude Code** 或 **Codex** 插件。插件与 CLI 共用同一份配置（`~/.claude/settings.json` / `~/.codex/config.toml`），按上面 CLI 部分配置好即可，无需重复设置。通过 Remote-SSH 连到所内服务器时，插件读取的是服务器上的配置。

### 通用配置管理：CC Switch

不想手动改 `settings.json` / `config.toml` 的话，可以用 CC Switch。它是开源的桌面应用，在图形界面里统一管理 Claude Code、Claude Desktop、Codex、Gemini CLI、OpenCode 等工具的 provider，一键切换，并且只改 endpoint、key 和 model，不动 MCP、hooks 等其他设置。

CC Switch 只修改**本机**的配置文件。在服务器上使用 CLI 时，仍需按上面 CLI 部分手动配置。

#### 安装

- 项目主页：<https://github.com/farion1231/cc-switch>
- Windows：在 [Releases](https://github.com/farion1231/cc-switch/releases) 下载 `.msi` 安装包或便携版 `.zip`。
- macOS：`brew install --cask cc-switch`，或在 Releases 下载 `.dmg`。
- Linux：在 Releases 下载 `.deb`、`.rpm` 或 `.AppImage`（需要 Ubuntu 22.04+ / Debian 12+ 等较新的发行版）。

#### 添加中转站

1. 在左侧栏选择要配置的工具（如 Claude Code 或 Codex），点右上角 **+** 添加 provider，选择自定义配置。
2. 填写连接信息，API Key 填自己的 key，model 填「可用模型」中的 model id：
   - Claude Code：endpoint 填 `https://146.56.207.178:58808`，**不要加 `/v1`**。
   - Codex：endpoint 填 `https://146.56.207.178:58808/v1`。
3. 编辑器会预览切换后的配置文件。对照上面 CLI 部分检查一遍，Claude Code 请确认 `env` 中有 `"CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"`。
4. 选中该 provider 点 **Enable** 生效。Claude Code 立即生效；Codex 需要重启终端或 `codex`；Claude Desktop 需要完全退出后重新打开。

provider 卡片上的连通性检测只检查地址能否访问，不检查 key 和 model id 是否正确。

### 桌面端

#### Cherry Studio

只聊天、不写代码的话，用 Cherry Studio 最快，支持 Windows、macOS 和 Linux。

##### 安装

- 下载安装：<https://cherryai.com.cn/>
- 官方教程：<https://docs.cherryai.com.cn/pre-basic/providers/providers>

##### 添加中转站

1. 左下角点击「设置」，进入 **Model Provider**，在供应商列表底部点 **+ Add Provider**。
2. 在弹出的 **Add Custom Provider** 里，Provider Name 填任意名字（例如 `WAN`），API Key 填自己的 key。
3. **Endpoint settings** 里填 **Anthropic** 一栏：`https://146.56.207.178:58808`，下方会提示 Request path 为 `.../v1/messages`；如果用 **OpenAI** 一栏，则填 `https://146.56.207.178:58808/v1`。
4. 点 **Add** 保存，回到该供应商页面，点右上角 **Sync models** 同步模型列表。
5. 点右上角 **Add all models** 添加全部模型。

##### 设置默认模型

在「默认模型 / Default Model」里选常用模型。**请不要选择 `Fable 5` 和 `astra` 作为默认模型**，这两个模型特别贵，消耗非常大；其他模型可以任意选择。

#### Codex / Claude 原生 App

两者均支持第三方 provider：Codex 的配置方法与上面 CLI 的 Codex 部分类似；Claude 可以参考[这篇教程](https://docs.qcode.cc/en/docs/ide/claude-desktop)。其他具体用法请自行搜索。

### 手机端

#### Cherry Studio

Cherry Studio 也有手机版，支持 iOS 和 Android，添加中转站的方法与桌面端类似。

- Google Play：<https://play.google.com/store/apps/details?id=com.cherryai.cherrystudio_app>
- App Store：<https://apps.apple.com/us/app/cherry-studio-ai-workstation/id6809783714>

#### Chatbox

Chatbox 支持 iOS 和 Android，可以添加自定义 API，适合在手机上随手提问，但体验一般。

1. 下载安装：<https://chatboxai.app/>，iOS 在 App Store 搜索 Chatbox，Android 从官网下载。
2. 进入「设置」→「模型提供方」，添加自定义提供方，API 模式选 **OpenAI API 兼容**。
3. API Host 填 `https://146.56.207.178:58808`，API Path 保持 `/v1/chat/completions`，API Key 填自己的 key。
4. 获取模型列表，或手动填入上面「可用模型」中的 model id，保存后即可使用。

#### Agora

Agora 是开源的 Android 客户端（仅 Android），自带密钥接入多家模型，自定义端点支持 OpenAI 兼容和 Anthropic 协议。

1. 下载安装（任选其一）：
   - Google Play：<https://play.google.com/store/apps/details?id=com.newoether.agora>
   - F-Droid：<https://f-droid.org/packages/com.newoether.agora/>
   - GitHub Releases：<https://github.com/newo-ether/Agora/releases>
2. 从对话侧栏打开「Settings」→「Providers」，添加自定义端点：
   - 选 **Anthropic** 协议时，Base URL 填 `https://146.56.207.178:58808`。
   - 选 **OpenAI 兼容** 协议时，Base URL 填 `https://146.56.207.178:58808/v1`。
   - API Key 填自己的 key。
3. 在「Models」里同步并启用需要的模型，**不要启用 `Fable 5` 和 `astra`**。
4. 在聊天界面底栏选择模型，即可开始对话。
