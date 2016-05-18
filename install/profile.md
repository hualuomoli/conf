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
1、修改 /etc/rc.d/rc.local
`vi /etc/rc.d/rc.local`
```
# 启动脚本绝对路径
```

2、启动脚本增加执行权限
`chmod +x 启动脚本`