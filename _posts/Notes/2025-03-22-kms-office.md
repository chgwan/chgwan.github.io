---
title: Office 和 Windows 破解
author: chgwan
# date: 2024-12-27 14:10:00 +0800
categories: [Tutorial]
tags: [Tutorial]
render_with_liquid: false
# media_subpath: "/assets/codes/bat"
---

# 最简单 Windows 和 Office 批量授权方法

## 激活方法 <span id="jump"> </span>

1. 下载[bat文件](/assets/codes/bat/activate.bat)
2. 以管理员身份运行，然后按照提示即可激活
3. 本方法可以破解Office系列所有软件，包括不限于project，visio等，但是需要安装的为批量授权版
   
## 安装方法

### 🧰 Step 1: Download the Office Deployment Tool

Go to the official Microsoft download page:

[https://www.microsoft.com/en-us/download/details.aspx?id=49117](https://www.microsoft.com/en-us/download/details.aspx?id=49117)

Download the file: `officedeploymenttool_*.exe`

---

### 📦 Step 2: Extract the Tool

Run the downloaded `.exe` file and extract it to a folder, for example:

```
D:\OfficeODT\
```

After extraction, you'll get:

* `setup.exe`
* Several sample configuration `.xml` files

---

## 📝 Step 3: Create the Configuration File

Create a file named `config.xml` in the same folder with the following content:

```xml
<Configuration>
  <Add OfficeClientEdition="64" Channel="Current">
    <!-- Here is really important, please chose the correct verison  -->
    <Product ID="VisioPro2021Volume"> 
      <Language ID="en-us" />
    </Product>
  </Add>
</Configuration>
```

> 💡 To change the language, replace `"en-us"` with another code (e.g., `"zh-cn"` for Chinese).

---

## 💾 Step 4: Download and Install Visio

Open **Command Prompt (CMD)** as **Administrator** and navigate to the folder containing `setup.exe`, then run:

```cmd
setup.exe /download config.xml
setup.exe /configure config.xml
```

* The first command downloads the necessary installation files.
* The second command installs Visio as specified in your `config.xml`.

---

## 🔑 Step 5: Activate Visio

If you're part of an organization or school, they may provide an activation tool. Alternatively, you can use [activation_method](#jump)
