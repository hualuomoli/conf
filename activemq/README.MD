# 控制台
## conf/jetty-realm.properties 配置用户
控制台登录用户 username: password [,rolename ...]
admin: admin, admin
user: user, user
gusts: gusts, gusts
system: system, admin,user,gusts

## conf/jetty.xml 配置控制台
只有admin和gust角色的用户才可以登陆控制台
<bean id="securityConstraint" class="org.eclipse.jetty.util.security.Constraint">
        <property name="name" value="BASIC" />
        <!-- 可以登录控制台的用户,使用逗号分隔 -->
        <property name="roles" value="admin,gusts" />
        <!-- set authenticate=false to disable login -->
        <!-- 设置为true，需要登录;设置false不用登录 -->
        <property name="authenticate" value="true" />
    </bean>


# 用户
## conf/groups.properties 配置用户组
用户组(用户使用逗号分割) 组名=用户1,用户2
sender=sender
receive=receive
gust=gust,demo

## conf/users.properties 配置用户
用户 用户名=密码
sender=sender
receive=receive
gust=gust
demo=demo
