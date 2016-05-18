# 安装Git
centos的git版本太低,使用源码安装

## 下载
`wget https://codeload.github.com/git/git/tar.gz/v2.8.2 -O git-2.8.2.tar.gz`

## 安装依赖
`yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel` <br>

`sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev`


## 安装
    $ tar -zxf git-2.8.2.tar.gz
    $ cd git-2.8.2.tar.gz
    $ make configure
    $ ./configure
    $ make
    $ make install

## 测试
`git --version` 显示如下内容表示配置成功

       git version 2.8.2
