
# 安装邮件服务器
`sudo apt-get install -y postfix`<br>
选择'Internet Site'

# 安装依赖
`sudo apt-get install -y openssh-server ca-certificates`<br>

# 下载安装
[选择对应系统的GitLab安装包](https://mirror.tuna.tsinghua.edu.cn/gitlab-ce)<br>
`wget https://mirror.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu/pool/trusty/main/g/gitlab-ce/gitlab-ce_8.6.3-ce.0_amd64.deb`<br>
`sudo dpkg -i gitlab-ce_8.6.3-ce.0_amd64.deb`

# 配置和使用GitLab
`sudo gitlab-ctl reconfigure`


# 修改端口

## nginx端口(默认80)
`vi  /var/opt/gitlab/nginx/conf/gitlab-http.conf`<br>

## 对内服务unicorn端口:(默认8080)
`vi /var/opt/gitlab/gitlab-rails/etc/unicorn.rb`<br>

## shell地址(默认`http://127.0.0.1:8080`)
`vi /var/opt/gitlab/gitlab-shell/config.yml`<br>

## 重启服务器

## 测试
浏览器打开`http://127.0.0.1:80`<br>
Username: root <br>
Password: 5iveL!fe<br>

# [DOC](http://wlx.westgis.ac.cn/1373/)