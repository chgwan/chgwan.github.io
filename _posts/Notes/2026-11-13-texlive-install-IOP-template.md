---
title: Install the IOP journal template in TeX Live
author: chgwan
categories: [Notes, Tex]
tags: [Note, Tex]
render_with_liquid: false
---

This note shows how to add a new journal template to TeX Live, using the IOP Publishing template as the example. It covers both Linux and Windows.

## Download the template

The IOP template page is <https://publishingsupport.iopscience.iop.org/questions/latex-template/>. The current package (2025) is `ioplatextemplate.zip`:

```bash
wget https://publishingsupport.iopscience.iop.org/wp-content/uploads/2025/07/ioplatextemplate.zip
unzip ioplatextemplate.zip -d iop
```

It contains `iopjournal.cls`, `iopjournal-template.tex`, `iopjournal-guidelines.pdf` and two example PDFs. The class is now `iopjournal.cls`; the old 2020 package (`ioplatexguidelines.zip`) used `iopart.cls`.

TeX Live searches a per-user tree, `TEXMFHOME`, before the system tree. Installing there (Option 1) needs no admin rights and no `texhash`, and survives TeX Live upgrades, since it does not live under the year-versioned install directory. Use the system-wide install (Option 2) only when every user on the machine needs the template.

## Linux

### Option 1: Install in your home folder (recommended)

`TEXMFHOME` defaults to `~/texmf` (no leading dot). Check yours with:

```bash
kpsewhich -var-value TEXMFHOME
# /home/<user>/texmf
```

Copy the template into it:

```bash
mkdir -p ~/texmf/tex/latex/iop
cp iop/iopjournal.cls ~/texmf/tex/latex/iop/
```

### Option 2: Install system-wide

1. Find your TeX Live installation:

    ```bash
    which latex
    # e.g. /usr/local/texlive/2025/bin/x86_64-linux/latex
    ```

2. Copy the class into `texmf-local`, which TeX Live keeps across upgrades (copying into `<year>/texmf-dist/tex/latex` also works, but is lost when you upgrade):

    ```bash
    sudo mkdir -p /usr/local/texlive/texmf-local/tex/latex/iop
    sudo cp iop/iopjournal.cls /usr/local/texlive/texmf-local/tex/latex/iop/
    ```

3. Rebuild the TeX file database:

    ```bash
    sudo texhash
    ```

    If `texhash` fails with `permission denied` and you cannot use `sudo`, give your user ownership of the TeX Live directory with `sudo chown -R $USER /usr/local/texlive`.

## Windows

Run these commands in PowerShell. They assume TeX Live is installed in the default `C:\texlive\2025`; replace `2025` with your TeX Live year.

### Download and unzip

```powershell
curl.exe -LO https://publishingsupport.iopscience.iop.org/wp-content/uploads/2025/07/ioplatextemplate.zip
Expand-Archive ioplatextemplate.zip -DestinationPath iop
```

### Option 1: Install in your home folder (recommended)

`TEXMFHOME` defaults to `C:\Users\<user>\texmf`. Check yours with:

```powershell
kpsewhich -var-value TEXMFHOME
# C:/Users/<user>/texmf
```

Copy the template into it:

```powershell
New-Item -ItemType Directory -Force "$env:USERPROFILE\texmf\tex\latex\iop"
Copy-Item iop\iopjournal.cls "$env:USERPROFILE\texmf\tex\latex\iop\"
```

### Option 2: Install system-wide

Open PowerShell as administrator, then copy the class into `C:\texlive\texmf-local` and rebuild the file database:

```powershell
New-Item -ItemType Directory -Force C:\texlive\texmf-local\tex\latex\iop
Copy-Item iop\iopjournal.cls C:\texlive\texmf-local\tex\latex\iop\
C:\texlive\2025\bin\windows\texhash.exe
```

If you use an editor such as TeXstudio or VS Code with LaTeX Workshop, restart it after installing so it picks up the new class.

## Verify

On either system, run:

```bash
kpsewhich iopjournal.cls
```

It should print the path where you put the class. Then compile `iopjournal-template.tex` to confirm the template works.

---

## 中文版

本文以 IOP Publishing 的模板为例，介绍如何在 TeX Live 中安装新的期刊模板，包括 Linux 和 Windows 两种系统。

## 下载模板

IOP 模板页面是 <https://publishingsupport.iopscience.iop.org/questions/latex-template/>。当前（2025 年）的模板包是 `ioplatextemplate.zip`：

```bash
wget https://publishingsupport.iopscience.iop.org/wp-content/uploads/2025/07/ioplatextemplate.zip
unzip ioplatextemplate.zip -d iop
```

压缩包里有 `iopjournal.cls`、`iopjournal-template.tex`、`iopjournal-guidelines.pdf` 和两个示例 PDF。现在的类文件是 `iopjournal.cls`；旧的 2020 年模板包（`ioplatexguidelines.zip`）用的是 `iopart.cls`。

TeX Live 会先搜索用户目录树 `TEXMFHOME`，再搜索系统目录树。装在用户目录（方式一）不需要管理员权限，也不需要运行 `texhash`；而且它不在按年份命名的安装目录下，升级 TeX Live 后依然有效。只有当本机所有用户都要用这个模板时，才用系统级安装（方式二）。

## Linux

### 方式一：安装到用户目录（推荐）

`TEXMFHOME` 默认是 `~/texmf`（前面没有点）。用下面的命令查看：

```bash
kpsewhich -var-value TEXMFHOME
# /home/<user>/texmf
```

把模板复制进去：

```bash
mkdir -p ~/texmf/tex/latex/iop
cp iop/iopjournal.cls ~/texmf/tex/latex/iop/
```

### 方式二：系统级安装

1. 找到 TeX Live 的安装位置：

    ```bash
    which latex
    # 例如 /usr/local/texlive/2025/bin/x86_64-linux/latex
    ```

2. 把类文件复制到 `texmf-local`，升级 TeX Live 时它会保留（复制到 `<year>/texmf-dist/tex/latex` 也可以，但升级后会丢失）：

    ```bash
    sudo mkdir -p /usr/local/texlive/texmf-local/tex/latex/iop
    sudo cp iop/iopjournal.cls /usr/local/texlive/texmf-local/tex/latex/iop/
    ```

3. 重建 TeX 文件数据库：

    ```bash
    sudo texhash
    ```

    如果 `texhash` 报 `permission denied`，又不能用 `sudo`，可以把 TeX Live 目录的所有者改成当前用户：`sudo chown -R $USER /usr/local/texlive`。

## Windows

以下命令在 PowerShell 中运行，假设 TeX Live 装在默认位置 `C:\texlive\2025`；请把 `2025` 换成你的 TeX Live 年份。

### 下载并解压

```powershell
curl.exe -LO https://publishingsupport.iopscience.iop.org/wp-content/uploads/2025/07/ioplatextemplate.zip
Expand-Archive ioplatextemplate.zip -DestinationPath iop
```

### 方式一：安装到用户目录（推荐）

`TEXMFHOME` 默认是 `C:\Users\<user>\texmf`。用下面的命令查看：

```powershell
kpsewhich -var-value TEXMFHOME
# C:/Users/<user>/texmf
```

把模板复制进去：

```powershell
New-Item -ItemType Directory -Force "$env:USERPROFILE\texmf\tex\latex\iop"
Copy-Item iop\iopjournal.cls "$env:USERPROFILE\texmf\tex\latex\iop\"
```

### 方式二：系统级安装

以管理员身份打开 PowerShell，把类文件复制到 `C:\texlive\texmf-local`，然后重建文件数据库：

```powershell
New-Item -ItemType Directory -Force C:\texlive\texmf-local\tex\latex\iop
Copy-Item iop\iopjournal.cls C:\texlive\texmf-local\tex\latex\iop\
C:\texlive\2025\bin\windows\texhash.exe
```

如果用 TeXstudio 或 VS Code（LaTeX Workshop）等编辑器，安装后请重启编辑器，让它识别新的类文件。

## 验证

两种系统都运行：

```bash
kpsewhich iopjournal.cls
```

它应该输出类文件所在的路径。然后编译 `iopjournal-template.tex`，确认模板能正常使用。
