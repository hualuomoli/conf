# Nginx

安装目录 /opt/nginx-1.13.9

## 下载
`wget http://nginx.org/download/nginx-1.13.9.tar.gz`

## 安装
```
# 安装依赖
yum -y install gcc gcc-c++ make libtool zlib zlib-devel openssl openssl-devel pcre pcre-devel
# 源码安装
tar -zxf nginx-1.13.9.tar.gz
cd nginx-1.13.9
./configure --prefix=/opt/nginx-1.13.9 --with-http_ssl_module
make
make install
# 删除源码
cd ..
rm -rf nginx-1.13.9
```

# 启动
```
/opt/nginx-1.13.9/sbin/nginx
```
