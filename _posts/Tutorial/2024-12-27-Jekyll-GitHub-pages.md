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
## 全新安装
### 安装 Jekyll 等 <span id="jump"> </span>

```bash
# only use for fast experience
sudo apt-get install ruby-full build-essential zlib1g-dev
## add to bashrc the Gems
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc 
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc 
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc 
source ~/.bashrc

## install jekyll and bundler
gem install jekyll bundler
```

### Fork [Chrispy theme](https://github.com/cotes2020/jekyll-theme-chirpy)

1. Fork chrispy theme 重命名为 <username>.github.io

2. 拉到本地 `git clone git@github.com:<username>/<username>.github.io.git`

3. **执行初始化** 

   ```bash
   cd <username>.github.io
   bash tools/init.sh # 这一步非常重要
   bundle install
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

### 常见问题处理

Q: 仅出现 --- layout: home # Index page --- jekyll chrispy

A: 大概率是没有执行 `bash tools/init.sh`

## 复制已有远程仓到其他设备
### 配置环境
1. 安装 rbenv
```bash
sudo apt install rbenv
# add the following statements in .bashrc
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```
2. 用 rbenv 重新安装 ruby，建议版本号高于 3.2
```bash
# list all available envs can be installed 
rbenv install -l
rbenv install <ruby_version>
```

3. 安装 node，参考 [安装教程](https://nodejs.org/en/download)

    ```bash
    # recommend to use fnm
    # Download and install fnm:
    curl -o- https://fnm.vercel.app/install | bash

    # Download and install Node.js:
    fnm install 22

    # Verify the Node.js version:
    node -v # Should print "v22.14.0".

    # Verify npm version:
    npm -v # Should print "10.9.2".
    ```

   

4. 安装 Jekyll 等
```bash 
rbenv versions # should be something like 3.2.2

# if not
rbenv global <version_gt_3.2>
rbenv rehash
ruby -v # should be ruby 3.4.2

## install jekyll and bundler
gem install jekyll bundler

```

5. `git clone git@github.com:<username>/<username>.github.io.git`

6. `cd <the folder>; bundle install`

7. 测试结果: `tools/test.sh` 

## Tricks

### markdown 语法参考

[GitHub markdown 基本语法教程](https://docs.github.com/zh/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

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

- 参考 [链接](https://github.com/gjtorikian/html-proofer?tab=readme-ov-file#using-on-the-command-line)，寻找 htmlproofer command line 用法

- 因为修改了 `.github/workflows/pages-deploy.yml` 文件，故也要修改 `tools/test.sh` 用以保持一致
```bash
    # --no-enforce-https 为新加部分
    bundle exec htmlproofer "$SITE_DIR" \
      --no-enforce-https \
      --disable-external \
      --ignore-urls "/^http:\/\/127.0.0.1/,/^http:\/\/0.0.0.0/,/^http:\/\/localhost/"
```

### 实现指定 update 和自动 update 两种 update 时间方法

按照如下方式修改 `_layouts/post.html` 文件
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

### 实现自动 update 时间在非 _post 文件夹工作的方法

按照如下方式修改 `_plugins/posts-lastmod-hook.rb` 脚本
```ruby
Jekyll::Hooks.register [:documents,:posts], :post_init do |post|
  # Skip drafts and static files
  next unless post.respond_to?(:collection)
  # for the root of _post be triged twice.
  next if post.data['lastmod_checked']

  commit_num = `git rev-list --count HEAD "#{ post.path }"`

  if commit_num.to_i > 1
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ post.path }"`.strip
    unless lastmod_date.empty?
      post.data['lastmod_checked'] = true
      post.data['last_modified_at'] = lastmod_date
    end
  end
end
```

## 快速部署

```bash
git clone git@github.com:chgwan/chgwan.github.io.git
# 需要先安装Gems, ruby, node 等, 安装方法如下安装方法
cd chgwan.github.io
bundle install
```

[安装方法](#jump)

