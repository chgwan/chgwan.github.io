---
title: Vibe coding skills
author: chgwan
categories: [Notes]
tags: [Notes]
render_with_liquid: false
# media_subpath: "/assets/codes/bat"
---

Tools and skills that help coding agents such as Claude Code write better code.

## Modern Web Guidance

- **Link:** <https://developer.chrome.com/docs/modern-web-guidance>
- **What:** A toolkit from the Chrome team. It gives coding agents current web platform best practices and browser compatibility data, so they write modern HTML, CSS and JS instead of outdated patterns.
- **Install:** Use the `modern-web-guidance` CLI, or add it as a plugin to an agent such as Claude Code.

## App clone

These tools study how an existing app works so you can build your own version of it.

> Only study software you are allowed to study, and do not ship copies of other people's apps.
{: .prompt-warning }

### REA

- **Link:** <https://github.com/morluto/rea>
- **What:** An MCP server and CLI (MIT license). It lets an agent study software, from how it behaves at runtime down to native binaries, and it returns the evidence for each finding.
- **Use:** Find out how a feature in an existing app works, then build something similar in your own project.

### Craft Anything

- **Link:** <https://github.com/storytold/craft-anything>
- **Site:** <https://craftanything.lol>
- **What:** A desktop app, CLI and MCP server written in Rust, made by the ArtCraft team. It studies a website, app, game or file, then has a coding agent (Claude Code is supported first) build a new version in the language or engine you pick, and checks the result against the original.
- **Status:** Early alpha, released 2026-11-01.

Install from source (needs Rust 1.97+):

```bash
git clone https://github.com/storytold/craft-anything && cd craft-anything
cargo run --release -p craft-anything             # desktop app
cargo install --path apps/craft-anything-cli      # CLI
craft-anything-cli doctor                         # check the install, agents and engines
```

You can also download prebuilt releases for macOS, Windows, Linux, FreeBSD and the web from <https://craftanything.lol/download>.

---

## 中文版

帮助 Claude Code 等编程智能体写出更好代码的工具和技能。

## Modern Web Guidance

- **链接：** <https://developer.chrome.com/docs/modern-web-guidance>
- **简介：** Chrome 团队推出的工具包，为编程智能体提供最新的 Web 平台最佳实践和浏览器兼容性数据，让它们写出现代的 HTML、CSS 和 JS，而不是过时的写法。
- **安装：** 使用 `modern-web-guidance` 命令行工具，或作为插件安装到 Claude Code 等智能体中。

## 应用克隆

这些工具用于研究现有应用的工作原理，以便构建你自己的版本。

> 只研究你有权研究的软件，不要发布他人应用的复制品。
{: .prompt-warning }

### REA

- **链接：** <https://github.com/morluto/rea>
- **简介：** 一个 MCP 服务器和命令行工具（MIT 许可证）。它让智能体研究软件，从运行时行为一直到原生二进制文件，并为每个结论给出证据。
- **用途：** 弄清现有应用中某个功能的实现方式，然后在自己的项目中构建类似功能。

### Craft Anything

- **链接：** <https://github.com/storytold/craft-anything>
- **官网：** <https://craftanything.lol>
- **简介：** 由 ArtCraft 团队用 Rust 编写的桌面应用、命令行工具和 MCP 服务器。它先研究一个网站、应用、游戏或文件，再让编程智能体（优先支持 Claude Code）用你选择的语言或引擎构建新版本，并将结果与原版对比检查。
- **状态：** 早期 alpha 版，2026-11-01 发布。

从源码安装（需要 Rust 1.97+）：

```bash
git clone https://github.com/storytold/craft-anything && cd craft-anything
cargo run --release -p craft-anything             # 桌面应用
cargo install --path apps/craft-anything-cli      # 命令行工具
craft-anything-cli doctor                         # 检查安装、智能体和引擎
```

也可以从 <https://craftanything.lol/download> 下载 macOS、Windows、Linux、FreeBSD 和 Web 版的预编译包。
