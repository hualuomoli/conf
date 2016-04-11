
# 配置默认编码集
修改`eclipse.ini`增加一行<br>
```
-Dfile.encoding=utf-8
```

# 配置插件
## OpenExplorer
[下载](https://github.com/samsonw/OpenExplorer/downloads) <br>
复制到 eclipse\plugins

## Subversion
`Help --> Eclipse Marketplace` 打开插件市场<br>
在搜索框输入`Subversion` 选择Subclipse1.10.13,点击`install` 安装完成后重启即可<br>

# 配置文字大小
 `Windows --> preference`打开属性配置页面<br>
 依次展开`General --> Appearance --> Colors and Fonts`<br>
 选择`Basic --> Text Font`，点击`Edit`修改字体为`Consolas 常规 16`<br>
 
# 配置JDK
`Windows --> preference`打开属性配置页面<br>
选择`java --> Installed JRES` <br>
选择`ADD`新增一个JDK<br>

# 配置Maven
`Windows --> preference`打开属性配置页面<br>
选择`Maven --> User settings` <br>
点击`Global Settings`下的`Browse` 选择maven的安装目录<br>

# 关闭有效性校验
`Windows --> preference`打开属性配置页面<br>
选择`Validation`  点击`Disable All`<br>


# 配置XML格式
`Windows --> preference`打开属性配置页面<br>
 依次展开`XML --> XML Files --> Editor`<br>
 选择`Formating --> Line width` 值为120


# 关闭项目有效性校验
选择打开的项目点击右键,选 `properties - Builders`，在右边只对`java Builder`选中,其它的不要选。
