# 

# 配置环境变量
`CORDOVA_ANDROID_GRADLE_DISTRIBUTION_URL=https://coding.net/u/hualuomoli/p/libs/git/raw/master/gradle/gradle-2.2.1-all.zip`

# 添加本地缓存代理
修改文件`~\AppData\Roaming\npm\node_modules\ionic\node_modules\ionic-app-lib\lib\utils.js`
```
Utils.fetchArchive方法<br>
    var ionic_proxy = process.env.IONIC_PROXY || process.env.ionic_proxy || '';
    archiveUrl = ionic_proxy + archiveUrl;
    console.log('proxy archiveUrl:'.green + archiveUrl);
```

# 代理服务器
`https://git.coding.net/hualuomoli/local-http-proxy.git`