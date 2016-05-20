# 配置

## 下载
`wget -c 文件地址 -O 文件名 -o 日志 ` (-c 支持断电续传)
    
## 环境变量配置

    1、所有用户永久生效
        修改文件/etc/profile <br>
        生效方式source /etc/profile  <br>

    2、登陆用户永久有效
        修改文件~/.bash_profile  <br>
        生效方式source ~/.bash_profile <br>

## 用户
[添加用户](http://www.111cn.net/sys/CentOS/54007.htm)  `useradd 用户名` <br>
修改密码 `password 用户名` <br>
删除用户 `userdel 用户名` <br>

## 赋权
`chmod -R 777 目录或文件` <br>
7 = 4(r) + 2(w) + 1(x)

## 修改文件所属用户组
`chown -R 用户名:组名 目录或者文件`

## 开机启动

### rc.local
`vi /etc/rc.d/rc.local`

```
# 启动脚本绝对路径 (脚本需要配置依赖环境变量)
绝对路径 > 日志文件 2>&1
```

`chmod +x 启动脚本`

### chkconfig
以memcached为例 <br>
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