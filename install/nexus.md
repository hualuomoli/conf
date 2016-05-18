# 安装Nexus

安装目录 /opt/nexus-2.8.1-01

## 下载
`wget https://download.sonatype.com/nexus/oss/nexus-2.8.1-01-bundle.tar.gz`

更多[下载地址](https://support.sonatype.com/hc/en-us/articles/218238798)

## 安装
解压缩`Nexus`到`/opt/nexus-2.8.1-01` <br>

    tar -xvf nexus-2.8.1-01-bundle.tar.gz
    mv sonatype-work nexus-2.8.1-01
    mv nexus-2.8.1-01 /opt/nexus-2.8.1-01

## [配置环境变量](./profile.md)
1、`vi /etc/profile` <br>
2、在文件末尾添加
```
# nexus
export NEXUS_HOME=/opt/nexus-2.8.1-01
export PATH=$PATH:$NEXUS_HOME/bin
```
3、`source /etc/profile`


## 配置
`vi $NEXUS_HOME/bin/jsw/conf/wrapper.conf` 修改内容如下

    # java使用绝对路径
    # wrapper.java.command=java
    wrapper.java.command=/opt/jdk1.7.0_67/bin/java

`vi $NEXUS_HOME/conf/nexus.properties` 修改内容如下

    # 工作目录设置为当前目录下的nexus
    # nexus-work=${bundleBasedir}/../sonatype-work/nexus
    nexus-work=${bundleBasedir}/sonatype-work/nexus

## 编写脚本
`vi /opt/nexus-2.8.1-01/bin/start.sh` <br>

```
#!/bin/sh

# 如果使用root用户启动,增加配置
export RUN_AS_USER=root

# 使用命令的绝对路径
/opt/nexus-2.8.1-01/bin/nexus start
```

## 赋权
`chmod +x /opt/nexus-2.8.1-01/bin/start.sh`

## 启动
`sh /opt/nexus-2.8.1-01/bin/start.sh`

## 测试
登陆 http://ip:8081/nexus查看是否启动成功 <br>
![nexus](../images/nexus-install.png)

## 安装开机启动
`vi /etc/rc.d/rc.local` 增加启动命令<br>

```
# nexus
/opt/nexus-2.8.1-01/bin/start.sh
```

## 注意
nexus需要依赖jdk,所以需要先配置[jdk](./jdk.md)