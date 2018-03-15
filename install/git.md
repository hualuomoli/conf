# Git

安装目录 /opt/git-2.8.2

## 下载
`wget https://codeload.github.com/git/git/tar.gz/v2.8.2 -O git-2.8.2.tar.gz`

## 安装
```
# 安装依赖
yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel
# 源码安装
tar -zxf git-2.8.2.tar.gz
cd git-2.8.2
make configure
./configure --prefix=/opt/git-2.8.2
make
make install
# 删除源码
cd ..
rm -rf git-2.8.2
```

## 配置环境变量
1、编辑 `vi /etc/profile` 在文件最后增加 <br>
```
# git
export GIT_HOME=/opt/git-2.8.2
export PATH=$PATH:$GIT_HOME/bin
```
2、生效 `source /etc/profile`

## 测试
`git --version` 提示如下信息，安装成功

       git version 2.8.2




## 配置GIT全局变量
```
git config --global user.name "hualuomoli"
git config --global user.email "liubaoquan0831@163.com"
```
