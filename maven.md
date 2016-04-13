# 配置
修改文件 conf\settings.xml

## localRepository
```
	<!-- 本地资源存放目录 -->
	<localRepository>D:/apache-maven-3.3.3/repository</localRepository>
```

## servers
```
	<!-- 发布版 -->
	<server>
      <id>local-repo</id>
      <username>admin</username>
      <password>admin123</password>
    </server>
	<!-- 快照版 -->
	<server>
      <id>local-repo-s</id>
      <username>admin</username>
      <password>admin123</password>
    </server>
```

## profiles
```
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
```

## activeProfiles
```
  <!-- 激活私服 -->
  <activeProfiles>
	<!-- profile的id -->
    <activeProfile>localhost</activeProfile>
  </activeProfiles>
```