# 安装Mongodb

安装目录 /opt/mongodb-3.2.6

## 下载
`wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.2.6.tgz`

## 安装
解压缩`Mongodb`到`/opt/mongodb-3.2.6` <br>
```
tar -xvf mongodb-linux-x86_64-3.2.6.tgz
mv mongodb-linux-x86_64-3.2.6 /opt/mongodb-3.2.6
```

## [配置](./profile.md)
1、`vi /etc/profile` <br>
2、在文件末尾添加
```
# mongodb
export MONGO_HOME=/opt/mongodb-3.2.6
export PATH=$PATH:$MONGO_HOME/bin
```
3、`source /etc/profile`

## 测试
`mongo --version` 显示如下内容表示配置成功
```
MongoDB shell version: 3.2.6
```

## 创建数据库目录
```
mkdir /mnt/mongodb
mkdir /mnt/mongodb/data
mkdir /mnt/mongodb/log
```

## 编写脚本
`vi /opt/mongodb-3.2.6/bin/start.sh` <br>

```
#!/bin/sh

# 使用命令的绝对路径
/opt/mongodb-3.2.6/bin/mongod -port 27017 --dbpath /mnt/mongodb/data --logpath /mnt/mongodb/log/mongodb.log
```

## 赋权
`chmod +x /opt/mongodb-3.2.6/bin/start.sh`

## 启动
`sh /opt/mongodb-3.2.6/bin/start.sh`

## 测试
`mongo localhost:27017`

```
db.foo.save({a:1});
db.foo.find();
exit
```

## 安装开机启动
`vi /etc/rc.d/rc.local` 增加启动命令<br>

```
# mongodb
/opt/mongodb-3.2.6/bin/start.sh
```
