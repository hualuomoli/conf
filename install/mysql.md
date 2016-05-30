# Mysql

安装目录 /opt/mysql-5.6.27

# 下载
`wget http://cdn.mysql.com/archives/mysql-5.6/mysql-5.6.27-linux-glibc2.5-x86_64.tar.gz`

[更多](http://downloads.mysql.com/archives/community/)

## 安装
```
tar -xvf mysql-5.6.27-linux-glibc2.5-x86_64.tar.gz
mv mysql-5.6.27-linux-glibc2.5-x86_64 /opt/mysql-5.6.27
```

## 配置环境变量
1、编辑 `vi /etc/profile` 在文件最后增加 <br>
```
# mysql
export MYSQL_HOME=/opt/mysql-5.6.27
export PATH=$PATH:$MYSQL_HOME/bin
```
2、生效 `source /etc/profile`

## 添加用户与组
```
groupadd mysql
useradd -r -g mysql mysql
```

## 添加数据目录
```
mkdir /mnt/mysql
mkdir /mnt/mysql/data
```

## 赋权
```
chown -R mysql:mysql /opt/mysql-5.6.27
chown -R mysql:mysql /mnt/mysql
```

## 安装数据库
```
su mysql
/opt/mysql-5.6.27/scripts/mysql_install_db --user=mysql --basedir=/opt/mysql-5.6.27 --datadir=/mnt/mysql/data
exit
```

## 配置数据库
```
cd /opt/mysql-5.6.27/support-files
cp mysql.server /etc/rc.d/init.d/mysql
cp my-default.cnf /etc/my.cnf
vi /etc/my.cnf
```
配置内容增加
```
basedir=/opt/mysql-5.6.27
datadir=/mnt/mysql/data
port=3306


max_allowed_packet = 20M

```

## 测试
```
service mysql start
mysql -uroot -p
```

提示如下信息，启动成功<br>
```
Warning: Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.6.27 MySQL Community Server (GPL)

Copyright (c) 2000, 2015, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 
```

## 修改密码
```
mysqladmin -u root password 'root' # 单引号不是必须
```

## 配置远程访问
```
mysql -uroot -proot
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
FLUSH PRIVILEGES; 
exit
service mysql restart
```

## 开机启动
```
chkconfig --add mysql
chkconfig mysql on
```


