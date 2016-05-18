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

## 编写脚本
`vi /opt/memcached-1.4.25/bin/start.sh` <br>

```
#!/bin/sh

# 使用命令的绝对路径
# 参数说明:
#   -d 启动一个守护进程
#   -m 分配给Memcache使用的内存数量，单位是MB
#   -u 运行Memcache的用户
#   -l 监听的服务器IP地址
#   -p Memcache监听的端口，默认是11211
#   -c 最大运行的并发连接数，默认是1024
#   -P 保存Memcache的pid文件 

/opt/memcached-1.4.25/bin/memcached  -d -m 10 -u root -l 127.0.0.1 -p 11211 -c 256 -P /tmp/memcached.pid
```

## 赋权
`chmod +x /opt/memcached-1.4.25/bin/start.sh`

## 启动
`sh /opt/memcached-1.4.25/bin/start.sh`

## 测试
`telnet localhost 11211`

## 安装开机启动
`vi /etc/rc.d/rc.local` 增加启动命令<br>

```
# memcached
/opt/memcached-1.4.25/bin/start.sh
```


