# 安装Maven

安装目录 /opt/maven-3.3.3

## 下载
`wget https://archive.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz`

## 安装
解压缩`Maven`到`/opt/maven-3.3.3` <br>
`tar -xvf apache-maven-3.3.3-bin.tar.gz` <br>
`mv  apache-maven-3.3.3 /opt/maven-3.3.3`

## [配置](./profile.md)
1、`vi /etc/profile` <br>
2、在文件末尾添加
```
# maven
export MAVEN_HOME=/opt/maven-3.3.3
export PATH=$PATH:$MAVEN_HOME/bin
```
3、`source /etc/profile`

## 测试
`mvn -v` 显示如下内容表示配置成功

     Apache Maven 3.3.3 (7994120775791599e205a5524ec3e0dfe41d4a06; 2015-04-22T19:57:37+08:00)
    Maven home: /opt/apache-maven-3.3.3
    Java version: 1.7.0_67, vendor: Oracle Corporation
    Java home: /opt/jdk1.7.0_67/jre
    Default locale: en_US, platform encoding: UTF-8
    OS name: "linux", version: "2.6.32-573.26.1.el6.x86_64", arch: "amd64", family: "unix"

## 赋权
其他用户需要使用maven来下载jar包,需要设置权限 <br>
`chmod -R 777 $MAVEN_HOME`

## 配置资源
vi $MAVEN_HOME/conf/settings.xml
```
<?xml version="1.0" encoding="UTF-8"?>

<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">

  <!-- 设置本地资源保存路径路径 -->
  <localRepository>$MAVEN_HOME/repository</localRepository>

  <profiles>
    <!-- 本地资源，需要在activeProfiles中激活 -->
    <profile>
    <!-- 资源id,activeProfiles中使用 -->
      <id>localhost</id>

      <!-- 资源 -->
      <repositories>
        <repository>
          <id>local-repository</id>
          <name>Repository for localhost builds</name>
          <url>http://localhost:8081/nexus/content/groups/public/</url>
          <releases>
            <enabled>true</enabled>
            <updatePolicy>never</updatePolicy>
          </releases>
          <snapshots>
            <enabled>true</enabled>
            <updatePolicy>always</updatePolicy>
          </snapshots>
        </repository>
      </repositories>
      <!-- 资源插件 -->
      <pluginRepositories>
        <pluginRepository>
          <id>local-repository</id>
          <name>Repository for localhost builds</name>
          <url>http://localhost:8081/nexus/content/groups/public/</url>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </pluginRepository>
      </pluginRepositories>
    </profile>

  </profiles>

  <!-- 激活 -->
  <activeProfiles>
    <!-- profile的id -->
    <activeProfile>localhost</activeProfile>
  </activeProfiles>
  
</settings>
```

## 注意
maven需要依赖jdk,需要先配置[jdk](./jdk.md) <br>
maven从本地下载jar包,需要先配置[Nexus](./nexus.md)
