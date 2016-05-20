# Nodejs

安装目录 /opt/node-v6.2.0

## 下载
`wget https://nodejs.org/dist/v6.2.0/node-v6.2.0-linux-x64.tar.xz`

## 安装
```
tar -xvf node-v6.2.0-linux-x64.tar.xz
mv node-v6.2.0-linux-x64 /opt/node-v6.2.0
```

## 配置环境变量
1、编辑 `vi /etc/profile` 在文件最后增加 <br>
```
# nodejs
export NODEJS_HOME=/opt/node-v6.2.0
export PATH=$PATH:$NODEJS_HOME/bin
```
2、生效 `source /etc/profile`

## 测试
`node -v` 提示如下信息，安装成功

       v6.2.0
