---
title: VSCode Claude Extension on Remote Server
author: chgwan
categories: [Notes]
tags: [Note, VSCode, Claude]
render_with_liquid: false
---

## Goal

Use the Claude extension subscription from your local machine on a remote server by copying:

- `~/.claude/.credentials.json`
- `~/.claude.json`

to the same paths on the remote machine.

## Prerequisites

- Local machine already signed in with VSCode Claude extension
- SSH access to remote server
- `rsync` available on local machine

## One-Time Sync Commands

Run this on your **local machine**:

```bash
REMOTE="user@remote-host"

# 2) Copy credentials and config
rsync -avzP ~/.claude/.credentials.json "$REMOTE:~/.claude/.credentials.json"
rsync -avzP  ~/.claude.json "$REMOTE:~/.claude.json"

```

## Configure VS Code Proxy on Remote

Set VS Code remote-side settings with:

- `http.proxy`
- `remote.SSH.httpProxy`
- `remote.SSH.httpsProxy`
- `http.proxySupport: override`

Put this JSON in remote `~/.vscode-server/data/Machine/settings.json`:

```json
{
  "http.proxy": "http://127.0.0.1:<port>",
  "remote.SSH.httpProxy": "http://127.0.0.1:<port>",
  "remote.SSH.httpsProxy": "http://127.0.0.1:<port>",
  "http.proxySupport": "override"
}
```

Verify:

```bash
cat ~/.vscode-server/data/Machine/settings.json
```
