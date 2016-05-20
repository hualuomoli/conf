# Memcache

安装目录 /opt/memcached-1.4.25

## 下载
`wget http://memcached.org/files/memcached-1.4.25.tar.gz`

## 安装
```
# 安装依赖
yum install -y libevent-devel
# 源码安装
tar -zxf memcached-1.4.25.tar.gz
cd memcached-1.4.25
./configure --prefix=/opt/memcached-1.4.25
make
make install
# 删除源码
cd ..
rm -rf memcached-1.4.25
```

## 配置环境变量
1、编辑 `vi /etc/profile` 在文件最后增加 <br>
```
# memcached
export MEMCACHED_HOME=/opt/memcached-1.4.25
export PATH=$PATH:$MEMCACHED_HOME/bin
```
2、生效 `source /etc/profile`

## 测试
1、启动 `memcached -u root` <br>
2、打开新窗口 `telnet localhost 11211` 提示如下信息，启动成功 <br>
```
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.

```
3、退出 `quit`


## 开机启动
1、编辑 `vi /etc/rc.d/init.d/memcached`

```
#!/bin/sh
#
# memcached:    Memcached Daemon
#
# chkconfig:    - 90 25 
# description:  Memcached Daemon
#
# Source function library.
. /etc/rc.d/init.d/functions
. /etc/sysconfig/network
 
# 定义启动
start() 
{
        echo -n $"Starting memcached: "
        daemon /opt/memcached-1.4.25/bin/memcached  -d -u daemon -m 400 -l 127.0.0.1 -p 11211 -c 256 -P /tmp/memcached.pid
        echo
}

# 定义停止
stop() 
{
        echo -n $"Shutting down memcached: "
        killproc memcached 
        echo
}

# 如果文件不存在,退出
[ -f /opt/memcached-1.4.25/bin/memcached ] || exit 0
 
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

2、赋权 `chmod +x /etc/rc.d/init.d/memcached`

3、添加到系统启动
```
chkconfig  --add memcached
chkconfig  --level 235  memcached  on
chkconfig  --list | grep memcached
```



