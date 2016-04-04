
# 配置Encoding
修改`%ECLIPSE_HOME%/eclipse.ini`增加一行<br>
```
--encoding
-Dfile.encoding=utf-8
```

# 配置插件
## Gradle
`Help --> Eclipse Marketplace` 打开插件市场<br>
在搜索框输入`gradle` 选择 Gradle(STS) Integration for Eclipse... ,点击`install` 安装完成后重启即可<br>

## Subversion
`Help --> Eclipse Marketplace` 打开插件市场<br>
在搜索框输入`Subversion` 选择Subclipse,点击`install` 安装完成后重启即可<br>

## JRebel
`Help --> Eclipse Marketplace` 打开插件市场<br>
在搜索框输入`JRebel` 选择 JRebel for Eclipse..,点击`install` 安装完成后重启即可<br>


# 配置JDK
`Windows --> preference`打开属性配置页面<br>
选择`java --> Installed JRES` <br>
选择`ADD`新增一个JDK<br>

# 配置Maven
`Windows --> preference`打开属性配置页面<br>
选择`Maven --> User settings` <br>
点击`Global Settings`下的`Browse` 选择maven的安装目录<br>

# 配置文字大小
 `Windows --> preference`打开属性配置页面<br>
 依次展开`General --> Appearance --> Colors and Fonts`<br>
 选择`Basic --> Text Font`，点击`Edit`修改字体为`Consolas 常规 16`<br>

# 配置JAVA格式
`Windows --> preference`打开属性配置页面<br>
 依次展开`Java --> Code Style --> Formatter`<br>
 选择`New`新增一个配置，名称为`hualuomoli`<br>
 选择`Line Wrapping`<br>
`--> General Settings --> Maximum line width` 值设置为160<br>
`--> Preview --> Set line width of preview window` 只设置120<br>
选择`Comments`<br>
`--> General settings` 关闭 `javadoc`<br>
`--> Line width --> Maximum line width for comments` 值为120 <br>

# 配置XML格式
`Windows --> preference`打开属性配置页面<br>
 依次展开`XML --> XML Files --> Editor`<br>
 选择`Formating --> Line width` 值为120


# 关闭有效性校验
`Windows --> preference`打开属性配置页面<br>
选择`Validation`  点击`Disable All`<br>

选择打开的项目点击右键,选 `properties - Builders`，在右边只对`java Builder`选中,其它的不要选。
