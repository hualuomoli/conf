# 配置
修改文件 conf\server.xml <br>

修改 Connector默认端口，默认编码集
```
	<!-- 修改默认端口和默认编码集 -->
    <Connector port="80" 
               URIEncoding="UTF-8"
			   protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" />
```

修改非root用户启动tomcat，直接使用地址访问
```
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8443
```
