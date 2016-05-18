# 安装Mongodb

安装目录 /opt/activemq-5.13.3

## 下载
`wget http://mirrors.cnnic.cn/apache//activemq/5.13.3/apache-activemq-5.13.3-bin.tar.gz`

## 安装
解压缩`ActiveMQ`到`/opt/activemq-5.13.3` <br>
```
tar -xvf apache-activemq-5.13.3-bin.tar.gz
mv apache-activemq-5.13.3 /opt/activemq-5.13.3
```

## [配置](./profile.md)
1、`vi /etc/profile` <br>
2、在文件末尾添加
```
# activemq
export ACTIVEMQ_HOME=/opt/activemq-5.13.3
export PATH=$PATH:$ACTIVEMQ_HOME/bin
```
3、`source /etc/profile`

## 赋权
`chmod -R 777 $ACTIVEMQ_HOME`

## 测试
`activemq --version` 显示如下内容表示配置成功
```
INFO: Loading '/opt/activemq-5.13.3/bin/env'
INFO: Using java '/opt/jdk1.7.0_67/bin/java'
Java Runtime: Oracle Corporation 1.7.0_67 /opt/jdk1.7.0_67/jre
  Heap sizes: current=63488k  free=62473k  max=932352k
    JVM args: -Xms64M -Xmx1G -Djava.util.logging.config.file=logging.properties -Djava.security.auth.login.config=/opt/activemq-5.13.3/conf/login.config -Dactivemq.classpath=/opt/activemq-5.13.3/conf:/opt/activemq-5.13.3/../lib/: -Dactivemq.home=/opt/activemq-5.13.3 -Dactivemq.base=/opt/activemq-5.13.3 -Dactivemq.conf=/opt/activemq-5.13.3/conf -Dactivemq.data=/opt/activemq-5.13.3/data
Extensions classpath:
  [/opt/activemq-5.13.3/lib,/opt/activemq-5.13.3/lib/camel,/opt/activemq-5.13.3/lib/optional,/opt/activemq-5.13.3/lib/web,/opt/activemq-5.13.3/lib/extra]
ACTIVEMQ_HOME: /opt/activemq-5.13.3
ACTIVEMQ_BASE: /opt/activemq-5.13.3
ACTIVEMQ_CONF: /opt/activemq-5.13.3/conf
ACTIVEMQ_DATA: /opt/activemq-5.13.3/data

ActiveMQ 5.13.3
For help or more information please see: http://activemq.apache.org

```

## 创建数据目录
```
mkdir /mnt/activemq
mkdir /mnt/activemq/bin
mkdir /mnt/activemq/log
cp -R /opt/activemq-5.13.3/conf /mnt/activemq/conf
cp -R /opt/activemq-5.13.3/data /mnt/activemq/data
```

## 编写脚本
`vi /mnt/activemq/bin/start.sh` <br>

```
#!/bin/sh

export ACTIVEMQ_BASE=/mnt/activemq

# 使用命令的绝对路径
/opt/activemq-5.13.3/bin/activemq start
```

## 赋权
`chmod +x /mnt/activemq/bin/start.sh`

## 启动
`sh /mnt/activemq/bin/start.sh`

## 测试
登陆 http://ip:8161 查看是否启动成功 <br>
![activemq](../images/activemq-install.png)

## 安装开机启动
`vi /etc/rc.d/rc.local` 增加启动命令<br>

```
# activemq
/mnt/activemq/bin/start.sh
```
