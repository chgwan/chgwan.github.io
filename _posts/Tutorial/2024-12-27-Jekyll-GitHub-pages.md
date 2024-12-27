---
title: Jekyll 和 GitHub Pages 的使用教程
author: chgwan
# date: 2024-12-27 14:10:00 +0800
categories: [Tutorial]
tags: [Tutorial, Jekyll]
render_with_liquid: false
---

# Jekyll Chrispy 主题和 GitHub Pages 使用教程

本文主要参考以下文章

- [安装 Jekyll](https://jekyllrb.com/docs/installation/ubuntu/)
- [Chrispy theme](https://github.com/cotes2020/jekyll-theme-chirpy)
- [Chrispy theme getting start](https://chirpy.cotes.page/posts/getting-started/) 

## 安装 Jekyll 等 <span id="jump"></span>
```bash
sudo apt-get install ruby-full build-essential zlib1g-dev
## add to bashrc the Gems
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc 
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc 
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc 
source ~/.bashrc

## install jekyll and bundler
gem install jekyll bundler
```

## Fork [Chrispy theme](https://github.com/cotes2020/jekyll-theme-chirpy)

1. Fork chrispy theme 重命名为 <username>.github.io

2. 拉到本地 `git clone git@github.com:<username>/<username>.github.io.git`

3. **执行初始化** 

   ```bash
   cd <username>.github.io
   bash tools/init.sh # 这一步非常重要
   bundle
   ```

4. 打开 Jekyll server

   ```bash
   bundle exec jekyll s
   # 或者使用
   bash tools/run.sh # 添加了livereload功能
   # 或者使用
   bundle exec jekyll s --livereload
   # 不建议使用，因为render很奇怪
   jekyll s 
   ```

5. push 到 GitHub

   ```bash
   # push 之前先执行
   bash tools/test.sh  # 本地构建检查比Github action 要快，而且方便
   ```

## 常见问题处理

Q: 仅出现 --- layout: home # Index page --- jekyll chrispy

A: 大概率是没有执行 `bash tools/init.sh`

## Tricks

### 在 `_config.yml` 中添加新的 collections 

用以让 Jekyll 可以编译除 `_post` 之外的位置

```yaml
collections:
  tabs:
    output: true
    sort_by: order
  owns:
    output: true
    permalink: /posts/owns/:title/  # 这个地方是文件编译的位置
  
defaults:
  - scope:
      path: "" # An empty string here means all files in the project
      type: posts
    values:
      layout: post
      comments: true # Enable comments in posts.
      toc: true # Display TOC column in posts.
      # DO NOT modify the following parameter unless you are confident enough
      # to update the code of all other post links in this project.
      permalink: /posts/:title/
  - scope:
      path: "_owns"
      type: owns
    values:  
      layout: post
```

### 修改 `pages-deploy.yml` 用以忽略一些测试

- 修改 `.github/workflows/pages-deploy.yml` 文件

  ```yaml
   # 主要修改了 test部分 增加了 \-\-no-enforce-https \ 用以不启用https检查
        - name: Test site
          run: |
            bundle exec htmlproofer _site \
              \-\-no-enforce-https \ 
              \-\-disable-external \
              \-\-ignore-urls "/^http:\/\/127.0.0.1/,/^http:\/\/0.0.0.0/,/^http:\/\/localhost/"
              
  ```

- 参考[链接](https://github.com/gjtorikian/html-proofer?tab=readme-ov-file#using-on-the-command-line)，寻找 htmlproofer command line 用法

- 因为修改了 `.github/workflows/pages-deploy.yml` 文件，故也要修改 `tools/test.sh` 用以保持一致

  ```bash
    # --no-enforce-https 为新加部分
    bundle exec htmlproofer "$SITE_DIR" \
      --no-enforce-https \
      --disable-external \
      --ignore-urls "/^http:\/\/127.0.0.1/,/^http:\/\/0.0.0.0/,/^http:\/\/localhost/"
  ```

### 实现指定update和自动update两种update时间方法

按照如下方式修改`_layouts/post.html`文件

```html
      
      <!-- manual update date -->
      {% if page.updated and page.updated != page.date %}
        <span>
          {{ site.data.locales[lang].post.updated }}
          {% include datetime.html date=page.updated tooltip=true lang=lang %}
        </span>
      <!-- lastmod date -->
      {% elsif page.last_modified_at and page.last_modified_at != page.date %}
        <span>
          {{ site.data.locales[lang].post.updated }}
          {% include datetime.html date=page.last_modified_at tooltip=true lang=lang %}
        </span>
      {% endif %}
```

## 快速部署

```bash
git clone git@github.com:chgwan/chgwan.github.io.git
# 需要先安装Gems, ruby 等, 安装方法如下安装方法
cd chgwan.github.io
bundle install
```

[安装方法](#jump)

