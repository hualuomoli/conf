# Maven

安装目录 /opt/maven-3.3.3

## 下载
`wget https://archive.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz`

## 安装
```
tar -xvf apache-maven-3.3.3-bin.tar.gz
mv  apache-maven-3.3.3 /opt/maven-3.3.3
```

## 配置环境变量
1、编辑 `vi /etc/profile` 在文件最后增加 <br>
```
# maven
export MAVEN_HOME=/opt/maven-3.3.3
export PATH=$PATH:$MAVEN_HOME/bin
```
2、生效 `source /etc/profile`

## 测试
maven 依赖[jdk](jdk.md),请确定已经安装 <br>
`mvn -v` 提示如下信息，安装成功

     Apache Maven 3.3.3 (7994120775791599e205a5524ec3e0dfe41d4a06; 2015-04-22T19:57:37+08:00)
    Maven home: /opt/apache-maven-3.3.3
    Java version: 1.7.0_67, vendor: Oracle Corporation
    Java home: /opt/jdk1.7.0_67/jre
    Default locale: en_US, platform encoding: UTF-8
    OS name: "linux", version: "2.6.32-573.26.1.el6.x86_64", arch: "amd64", family: "unix"
