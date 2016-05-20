# ActiveMQ

安装目录 /opt/activemq-5.13.3

## 下载
`wget http://mirrors.cnnic.cn/apache//activemq/5.13.3/apache-activemq-5.13.3-bin.tar.gz`

## 安装
```
tar -xvf apache-activemq-5.13.3-bin.tar.gz
mv apache-activemq-5.13.3 /opt/activemq-5.13.3
```

## 配置环境变量
1、编辑 `vi /etc/profile` 在文件最后增加 <br>
```
# activemq
export ACTIVEMQ_HOME=/opt/activemq-5.13.3
export PATH=$PATH:$ACTIVEMQ_HOME/bin
```
2、生效 `source /etc/profile`

## 测试
activemq 依赖[jdk](jdk.md),请确定已经安装 <br>
1、启动 `activemq start` <br>
2、登录控制台 <br>
浏览器访问 http://ip:8161 <br>
![activemq](../images/activemq-install.png)

## 开机启动
1、编辑 `vi /etc/rc.d/init.d/activemq`

```
#!/bin/sh
#
# activemq:    ActiveMQ
#
# chkconfig:    - 90 25 
# description:  ActiveMQ
#
# Source function library.
. /etc/rc.d/init.d/functions
. /etc/sysconfig/network
 
# 定义启动
start() 
{
        export JAVA_HOME=/opt/jdk1.7.0_67
        echo -n $"Starting activeMQ: "
        /opt/activemq-5.13.3/bin/activemq start
        echo
}

# 定义停止
stop() 
{
        echo -n $"Shutting down activeMQ: "
        killproc activemq 
        echo
}

# 如果文件不存在,退出
[ -f /opt/activemq-5.13.3/bin/activemq ] || exit 0
 
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

2、赋权 `chmod +x /etc/rc.d/init.d/activemq`

3、添加到系统启动
```
chkconfig  --add activemq
chkconfig  --level 235  activemq  on
chkconfig  --list | grep activemq
```

