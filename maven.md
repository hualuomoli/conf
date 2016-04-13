# ����
�޸��ļ� conf\settings.xml

## localRepository
```
	<!-- ������Դ���Ŀ¼ -->
	<localRepository>D:/apache-maven-3.3.3/repository</localRepository>
```

## servers
```
	<!-- ������ -->
	<server>
      <id>local-repo</id>
      <username>admin</username>
      <password>admin123</password>
    </server>
	<!-- ���հ� -->
	<server>
      <id>local-repo-s</id>
      <username>admin</username>
      <password>admin123</password>
    </server>
```

## profiles
```
	<!-- ������Դ����Ҫ��activeProfiles�м��� -->
	<profile>
	<!-- ��Դid,activeProfiles��ʹ�� -->
      <id>localhost</id>

	  <!-- ��Դ -->
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
	  <!-- ��Դ��� -->
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
  <!-- ����˽�� -->
  <activeProfiles>
	<!-- profile��id -->
    <activeProfile>localhost</activeProfile>
  </activeProfiles>
```