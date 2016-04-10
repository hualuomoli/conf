# ���û�������

maven��ѹĿ¼ D:\apache-maven-3.3.3

MVN_HOME = D:\apache-maven-3.3.3 <br>
PATH  ׷��  D:\apache-maven-3.3.3\bin <br>

# ��������
`mvn -v` <br>
`echo %MVN_HOME%` <br>
`echo %PATH%`  <br>

# ����
�޸��ļ� D:\apache-maven-3.3.3\conf\settings.xml

## localRepository
<!-- ������Դ���Ŀ¼ -->
<localRepository>D:/apache-maven-3.3.3/repository</localRepository>

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
          <layout>default</layout>
          <snapshotPolicy>always</snapshotPolicy>
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