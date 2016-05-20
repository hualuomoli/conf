# 安装Memcache

安装目录 /opt/memcached-1.4.25

## 下载
`wget http://memcached.org/files/memcached-1.4.25.tar.gz`

## 安装依赖
`yum install libevent-devel ` <br>

## 安装
    $ tar -zxf memcached-1.4.25.tar.gz
    $ cd memcached-1.4.25
    $ ./configure --prefix=/opt/memcached-1.4.25
    $ make
    $ make install

# 设置开机启动 

`vi /etc/rc.d/init.d/memcached`

```
#!/bin/sh
#
# memcached:    MemCached Daemon
#
# chkconfig:    - 90 25 
# description:  MemCached Daemon
#
# Source function library.
. /etc/rc.d/init.d/functions
. /etc/sysconfig/network
 
start() 
{
    
# 参数说明:
#   -d 启动一个守护进程
#   -m 分配给Memcache使用的内存数量，单位是MB
#   -u 运行Memcache的用户
#   -l 监听的服务器IP地址
#   -p Memcache监听的端口，默认是11211
#   -c 最大运行的并发连接数，默认是1024
#   -P 保存Memcache的pid文件 

        echo -n $"Starting memcached: "
        daemon /opt/memcached-1.4.25/bin/memcached  -d -u daemon -m 400 -l 127.0.0.1 -p 11211 -c 256 -P /tmp/memcached.pid
        echo
}
 
stop() 
{
        echo -n $"Shutting down memcached: "
        killproc memcached 
        echo
}
 
[ -f /opt/memcached-1.4.25/bin/memcached ] || exit 0
 
# See how we were called.
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
chkconfig  --add memcached 
chkconfig  --level 235  memcached  on
chkconfig  --list | grep memcached
```