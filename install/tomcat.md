# 安装Tomcat

安装目录 /opt/tomcat-7.0.65

## 下载
`wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.65/bin/apache-tomcat-7.0.65.tar.gz`

更多[下载地址](http://archive.apache.org/dist/tomcat/tomcat-7/)

## 安装
解压缩`Tomcat`到`/opt/tomcat-7.0.65` <br>
`tar -xvf apache-tomcat-7.0.65.tar.gz` <br>
`mv apache-tomcat-7.0.65 /opt/tomcat-7.0.65`

## [配置](./profile.md)
1、`vi /etc/profile` <br>
2、在文件末尾添加
```
# tomcat
export CATALINA_HOME=/opt/tomcat-7.0.65
```
3、`source /etc/profile`

## 赋权
`chmod -R 777 $CATALINA_HOME`

## 部署

1、创建用户 `useradd hualuomoli -d /mnt/hualuomoli` <br>
2、修改密码 `passwd hualuomoli` <br>
3、新用户登录 `su hualuomoli`<br>
4、创建目录<br>
```
mkdir ~/server # 服务
mkdir ~/project # 代码
```
5、创建项目 `cp -R $CATALINA_HOME/webapps ~/project/webapps`<br>
6、创建服务<br>
```
cp -R $CATALINA_HOME/conf ~/server/conf
mkdir ~/server/logs
mkdir ~/server/temp
mkdir ~/server/bin
```
7、修改配置文件 <br>
```
rm -f ~/server/conf/server.xml
vi ~/server/conf/server.xml
```

```
<?xml version='1.0' encoding='utf-8'?>
<!-- 服务器管理端口,默认8005 -->
<Server port="10005" shutdown="SHUTDOWN">
  <Listener className="org.apache.catalina.startup.VersionLoggerListener" />
  <Listener className="org.apache.catalina.core.AprLifecycleListener" SSLEngine="on" />
  <Listener className="org.apache.catalina.core.JasperListener" />
  <Listener className="org.apache.catalina.core.JreMemoryLeakPreventionListener" />
  <Listener className="org.apache.catalina.mbeans.GlobalResourcesLifecycleListener" />
  <Listener className="org.apache.catalina.core.ThreadLocalLeakPreventionListener" />
  <GlobalNamingResources>
    <Resource name="UserDatabase" auth="Container"
              type="org.apache.catalina.UserDatabase"
              description="User database that can be updated and saved"
              factory="org.apache.catalina.users.MemoryUserDatabaseFactory"
              pathname="conf/tomcat-users.xml" />
  </GlobalNamingResources>

  <Service name="Catalina">

   <!-- 应用端口,默认8080,增加编码集 -->
    <Connector port="10080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" 
         URIEncoding="UTF-8" />
  <!-- 不使用AJP -->
    <!-- Define an AJP 1.3 Connector on port 8009 -->
    <!-- <Connector port="8009" protocol="AJP/1.3" redirectPort="8443" /> -->

    <Engine name="Catalina" defaultHost="localhost">

      <Realm className="org.apache.catalina.realm.LockOutRealm">
     
        <Realm className="org.apache.catalina.realm.UserDatabaseRealm"
               resourceName="UserDatabase"/>
      </Realm>
    
    <!-- 主机信息,name主机名,appBase代码路径(使用绝对路径) -->
      <Host name="localhost"  appBase="/mnt/hualuomoli/project/webapps"
            unpackWARs="true" autoDeploy="true">


        <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs"
               prefix="localhost_access_log." suffix=".txt"
               pattern="%h %l %u %t &quot;%r&quot; %s %b" />

      </Host>
    </Engine>
  </Service>
</Server>
```

8、编写脚本

启动脚本 `vi ~/server/bin/start.sh`

```
#!/bin/sh

curr_path=$(cd "$(dirname "$0")"; pwd)
echo $curr_path

export CATALINA_BASE=$curr_path/..


$CATALINA_HOME/bin/startup.sh
```

停止脚本 `vi ~/server/bin/stop.sh`

```
#!/bin/sh

curr_path=$(cd "$(dirname "$0")"; pwd)
echo $curr_path

ps -ef|grep tomcat|grep java|grep $curr_path|grep -v grep|awk '{print $2}'|xargs kill -9
```
 
## 测试
浏览器访问http:ip:port,出现如下提示表示启动成功
![tomcat](../images/tomcat-install.png)

## 注意
tomcat需要依赖jdk,所以需要先配置[jdk](./jdk.md)