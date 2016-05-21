# 开机启动

## 启动优先级

```
第一步:
/etc/rc.d/rc.sysinit             init执行的第一个脚本 这个脚本主要是初始化工作，如设置系统字体，启动swapping，设置主机名，装载声卡模块等等


第二步:
/etc/rc.d/rcx.d                #启动各个运行级别脚本
(这里就是存放在/etc/目录下那7个目录rc0.d,rc1.d,rc2.d…rc6.d，这7个目录对于7个级别,rc0.d表示关机级别,因为他前面数字是0，这几个级别分别是什么用途，在6.1已经说的很清楚，这里不再复述。)
这个就是你通过chkconfig这个命令来控制开机启动各个级别要执行的程序。其实他就是在这一步的动作


第三步:
/etc/rc.d/rc.local    #相应级别服务启动之后、这是最后一个执行的脚本（这里就可以放入你想启动的任何程序）


第四步:
/sbin/mingetty # 等待用户登录
```

## chkconfig

添加到系统服务中 (以memcached为例) <br>

1、创建服务 <br>
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

# 定义启动
start() 
{
        echo "Starting MemCached......"
        # daemon 守护线程
        daemon /opt/memcached-1.4.25/bin/memcached  -d -u daemon -m 400 -l 127.0.0.1 -p 11211 -c 256 -P /tmp/memcached.pid
        echo "MemCached Started "
}

# 定义停止
stop() 
{
        echo "Shutting MemCached...... "
        killproc memcached 
        echo "MemCached Shutted down "
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

2、添加服务
`chkconfig  --add memcached `

3、设置服务启动级别
`chkconfig  --level 235  memcached  on`

4、查看服务
`chkconfig  --list | grep memcached`


## rc.local

添加启动脚本 (以tomcat启动为例) <br>

1、编辑脚本 <br>
`vi /etc/rc.d/rc.local`

2、添加启动脚本
```
# 启动使用脚本绝对路径
# 配置依赖JDK
export JAVA_HOME=/opt/jdk1.7.0_67
# 输出启动日志到文件(便于查错)
/opt/tomcat-7.0.65/bin/startup.sh >> /opt/tomcat-7.0.65/logs/start.log 2>&1
绝对路径 [> 日志文件 2>&1]
```

