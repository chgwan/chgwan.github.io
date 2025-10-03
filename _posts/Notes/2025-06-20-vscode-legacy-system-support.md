---
title: vscode support in legacy system
author: chgwan
# date: 2024-12-27 14:10:00 +0800
categories: [Notes]
tags: [Note]
render_with_liquid: false
---

## Generate patch file

1. Run the following:

```bash
git clone https://github.com/ursetto/vscode-sysroot.git
cd vscode-sysroot

docker build -t my-vscode-sysroot .
docker create --name temp-sysroot-container my-vscode-sysroot
docker cp temp-sysroot-container:/src/vscode-sysroot-x86_64-linux-gnu.tgz ./vscode-sysroot-x86_64-linux-gnu.tgz
```

## Patch the remote server

1. upload the `vscode-sysroot-x86_64-linux-gnu.tgz` to the remote.

2. Run the following on the remote server

```bash
# Execute on the remote server
mkdir -p ~/.vscode-server/sysroot
# Assuming the archive has been uploaded to the user's home directory ~
tar zxvf ~/vscode-sysroot-x86_64-linux-gnu.tgz -C ~/.vscode-server/sysroot --strip-components=1
```

**Tip**: The `--strip-components=1` parameter in the `tar` command is to handle any extra top-level directories that may exist inside the archive. If you find that the file path has an extra layer after extraction (for example, `~/.vscode-server/sysroot/vscode-sysroot-x86_64-linux-gnu/usr/...`), then you need this parameter. If after extraction, the `usr`, `lib`, and other directories are directly under `~/.vscode-server/sysroot/`, you can omit it or set the value to `0`.

## Deploy `sysroot.sh` Script

Then, copy the `sysroot.sh` script from the root directory of the `vscode-sysroot` project in local machine to the `~/.vscode-server/` directory on the remote server, ensuring it is named `sysroot.sh`:

## Configure Shell Environment

To ensure that the VS Code Server automatically loads the `sysroot` environment we prepared when it starts, you need to add a line in the shell configuration file on the remote server (usually `~/.bashrc` or `~/.zshrc`, depending on the shell you are using) to source `sysroot.sh`:

```
# Execute on the remote server
echo 'source ~/.vscode-server/sysroot.sh' >> ~/.bashrc
# If you are using zsh, change it to:
# echo 'source ~/.vscode-server/sysroot.sh' >> ~/.zshrc
```

After modifying and saving, remember to reload the configuration file or simply log back into the server to make the settings take effect:

```
# Execute on the remote server
source ~/.bashrc
# Or source ~/.zshrc
```