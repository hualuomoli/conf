# Mongodb

安装目录 /opt/mongodb-3.2.6

## 下载
`wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.2.6.tgz`

## 安装
```
tar -xvf mongodb-linux-x86_64-3.2.6.tgz
mv mongodb-linux-x86_64-3.2.6 /opt/mongodb-3.2.6
```

## 配置环境变量
1、编辑 `vi /etc/profile` 在文件最后增加 <br>
```
# mongodb
export MONGO_HOME=/opt/mongodb-3.2.6
export PATH=$PATH:$MONGO_HOME/bin
```
2、生效 `source /etc/profile`

## 测试
1、启动 `mongod -port 27017 --dbpath /opt/mongodb-3.2.6` <br>
2、`mongo` 提示如下信息，启动成功 <br>
```
MongoDB shell version: 3.2.6
connecting to: test
Server has startup warnings: 
2016-05-20T13:51:28.408+0800 I CONTROL  [initandlisten] ** WARNING: You are running this process as the root user, which is not recommended.
2016-05-20T13:51:28.408+0800 I CONTROL  [initandlisten] 
2016-05-20T13:51:28.409+0800 I CONTROL  [initandlisten] 
2016-05-20T13:51:28.409+0800 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/enabled is 'always'.
2016-05-20T13:51:28.409+0800 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2016-05-20T13:51:28.409+0800 I CONTROL  [initandlisten] 
2016-05-20T13:51:28.409+0800 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/defrag is 'always'.
2016-05-20T13:51:28.409+0800 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2016-05-20T13:51:28.409+0800 I CONTROL  [initandlisten] 
> 
```
3、退出`exit`

## 参数描述
```
mongod
  -port 端口
  --dbpath 数据目录
  --logpath 日志文件
```


## 开机启动
`vi /etc/rc.d/init.d/mongodb`

```
#!/bin/sh
#
# mongodb:    Mongodb
#
# chkconfig:    - 90 25 
# description:  Mongodb
#
# Source function library.
. /etc/rc.d/init.d/functions
. /etc/sysconfig/network
 
# 定义启动
start() 
{
        echo -n $"Starting mongodb: "
        /opt/mongodb-3.2.6/bin/mongod -port 27017 --dbpath /opt/mongodb-3.2.6/data --logpath /opt/mongodb-3.2.6/log/mongodb.log
        echo
}

# 定义停止
stop() 
{
        echo -n $"Shutting down mongodb: "
        killproc mongodb 
        echo
}

# 如果文件不存在,退出
[ -f /opt/mongodb-3.2.6/bin/mongodb ] || exit 0
 
# 根据参数判断.
case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart|reload)
        stop
        start
        ;;
  *)
        echo $"Usage: $0 {start|stop|restart|reload|condrestart}"
        exit 1
esac
exit 0
```


```
chkconfig  --add mongodb
chkconfig  --level 235  mongodb  on
chkconfig  --list | grep mongodb
```

