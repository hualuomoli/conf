# 安装Mysql

安装目录 /opt/mysql-5.6.27

# 下载
`wget http://cdn.mysql.com/archives/mysql-5.6/mysql-5.6.27-linux-glibc2.5-x86_64.tar.gz`

[更多](http://downloads.mysql.com/archives/community/)

## 安装
解压缩`JDK`到`/opt/mysql-5.6.27` <br>
`tar -xvf mysql-5.6.27-linux-glibc2.5-x86_64.tar.gz` <br>
`mv mysql-5.6.27-linux-glibc2.5-x86_64 /opt/mysql-5.6.27`

## [配置](./profile.md)
1、`vi /etc/profile` <br>
2、在文件末尾添加
```
# mysql
export MYSQL_HOME=/opt/mysql-5.6.27
export PATH=$PATH:$MYSQL_HOME/bin
```
3、`source /etc/profile`


## 添加用户与组

    groupadd mysql
    useradd -r -g mysql mysql

## 赋权
1、mysql安装目录赋权`chown -R mysql:mysql $MYSQL_HOME` <br>
2、mysql数据目录创建及赋权(数据在/mnt/mysql目录下)

    mkdir /mnt/mysql
    mkdir /mnt/mysql/data
    chown -R mysql:mysql /mnt/mysql



## 安装数据库
    su mysql
    cd $MYSQL_HOME/scripts
    ./mysql_install_db --user=mysql --basedir=$MYSQL_HOME --datadir=/mnt/mysql/data
    exit

## 配置文件

    cd $MYSQL_HOME/support-files
    cp my-default.cnf /etc/my.cnf
    cp mysql.server /etc/init.d/mysql
    vi /etc/my.cnf
        配置内容如下
        basedir=/opt/mysql-5.6.27
        datadir=/mnt/mysql/data
        port=3306

## 添加自启动服务
    chkconfig --add mysql
    chkconfig mysql on

## 启动mysql
`service mysql start`

## 测试
`mysql -uroot -p`

## 修改密码
`mysqladmin -u root password 'root' ` 单引号不是必须

## 配置远程访问
    mysql -uroot -proot
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
    FLUSH PRIVILEGES; 
    exit

## 重启
`service mysql restart`

# 注
[参考](http://blog.csdn.net/zhanngle/article/details/41042631)

