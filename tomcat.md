# 配置
maven解压目录 D:\apache-tomcat-7.0.65 <br>

修改文件 D:\apache-tomcat-7.0.65\conf\server.xml <br>

修改 Connector默认端口，默认编码集
```
	<!-- 修改默认端口和默认编码集 -->
    <Connector port="80" 
               URIEncoding="UTF-8"
			   protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" />
```
