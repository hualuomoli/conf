# 系统服务

## chkconfig
```
chkconfig
    --add
    --del
    --list
    --level<等级代号> 　指定读系统服务要在哪一个执行等级中开启或关毕。
      等级0表示：表示关机
      等级1表示：单用户模式
      等级2表示：无网络连接的多用户命令行模式
      等级3表示：有网络连接的多用户命令行模式
      等级4表示：不可用
      等级5表示：带图形界面的多用户模式
      等级6表示：重新启动
    系统服务
```


## 配置
每个被chkconfig管理的服务需要在对应的init.d下的脚本加上两行或者更多行的注释。<br>
第一行告诉chkconfig缺省启动的运行级以及启动和停止的优先级。<br>如果某服务缺省不在任何运行级启动，那么使用 - 代替运行级。<br>
第二行对服务进行描述，可以用\ 跨行注释。<br>
例如，random.init包含三行：
# chkconfig: 2345 20 80
# description: Saves and restores system entropy pool for \
# higher quality random number generation.