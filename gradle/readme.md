
# 配置

# 配置仓库地址
`GRADLE_USER_HOME=gradle仓库地址`

# 配置全局仓库
~/.gradle/init.gradle
```
allprojects {
    repositories {
        mavenLocal()
        maven {
            name : 'localhost'
            url "http://localhost:8081/nexus/content/groups/public/"
        }
        maven {
            name 'oschina'
            url "http://maven.oschina.net/content/groups/public/"
        }
        mavenCentral()
    }
}
```