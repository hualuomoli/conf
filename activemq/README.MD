# 控制台
## conf/jetty-realm.properties 配置用户
    控制台登录用户 username: password [,rolename ...]
    admin: admin, admin
    user: user, user
    gusts: gusts, gusts
    system: system, admin,user,gusts

## conf/jetty.xml 配置控制台
只有admin和gusts角色的用户才可以登陆控制台
    <!-- console控制台权限 -->
    <bean id="securityConstraint" class="org.eclipse.jetty.util.security.Constraint">
        <property name="name" value="BASIC" />
        <!-- 可以登录控制台的用户 -->
        <property name="roles" value="admin,gusts" />
        <!-- set authenticate=false to disable login -->
        <!-- 设置为true，需要登录;设置false不用登录 -->
        <property name="authenticate" value="true" />
    </bean>
    <!-- ./console控制台权限 -->

# 用户
## conf/groups.properties 配置用户组
    用户组(用户使用逗号分割) 组名=用户1,用户2
    sender=sender
    receiver=receiver
    users=sender,receiver,demo,manager
    manager=manager

## conf/users.properties 配置用户
    用户 用户名=密码
    sender=sender
    receiver=receiver
    demo=demo
    manager=manager


#权限
## conf/login.config 设置使用的配置文件
    activemq-domain {
    org.apache.activemq.jaas.PropertiesLoginModule required
        org.apache.activemq.jaas.properties.user="users.properties"
        org.apache.activemq.jaas.properties.group="groups.properties";
    };

## conf/activemq.xml 设置具体的访问权限
    <!-- authorization权限认证 -->
        <plugins>
            <!-- login.config中配置与configuration相同名称的数据 -->
            <jaasAuthenticationPlugin configuration="activemq-domain" />
            <authorizationPlugin>
                <map>
                    <authorizationMap>
                        <authorizationEntries>
                            <!-->表示通配符,例如USERS.>表示以USERS.开头的主题,>表示所有主题,read表示读的权限,write表示写的权限，admin表示角色组-->
                            <!-- 可以配置用户，也可以配置组 -->
                            <!-- manager can read and write all queue -->
                            <authorizationEntry queue=">" read="manager" write="manager" admin="manager" />
                            <!-- users can read all topic -->
                            <authorizationEntry topic=">" read="users" write="manager" admin="users" />
                            <!-- custome -->
                            <authorizationEntry queue="JMS.>" read="receiver" write="sender" admin="sender,receiver" />
                            <authorizationEntry topic="JMS.>" read="users" write="sender" admin="users" />
                            <!-- end -->
                        </authorizationEntries>
                    </authorizationMap>
                </map>
            </authorizationPlugin>
        </plugins>
        <!-- ./authorization -->


# conf/activemq.xml 实例化到数据库
    <!-- 配置mysql数据库连接 -->
    <!-- 需要将mysql和alibaba的连接池的jar包复制到lib目录下 -->
    <bean id="mysql-ds" class="com.alibaba.druid.pool.DruidDataSource" init-method="init" destroy-method="close">
        <property name="driverClassName" value="com.mysql.jdbc.Driver" />
        <property name="url" value="jdbc:mysql://localhost:3306/activemq?useUnicode=true&amp;characterEncoding=utf-8" />
        <property name="username" value="activemq" />
        <property name="password" value="activemq" />
        <property name="poolPreparedStatements" value="true" />
    </bean>

     <!-- mysql -->
        <persistenceAdapter>
            <jdbcPersistenceAdapter dataSource="#mysql-ds" />
        </persistenceAdapter>