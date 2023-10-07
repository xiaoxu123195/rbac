## RBAC组件的使用文档

###### 1.将rbac组件拷贝到项目

###### 2.将rbac/migrations目录中的数据库迁移记录删除

###### 3.业务系统中的表结构设计

业务表结构中的用户表需要和rbac中的用户有继承关系，如：

```python
rbac/models.py
class UserInfo(models.Model):
# 用户表
    name=models.CharField(verbose._name='用户名'，max_length=32)
    password=models.CharField(verbose_name='密a码'，max_length=64)
    email=models.CharField(verbose_name='邮箱'，max_lengtha=32】
    roles=models.ManyToManyField(verbose_name='拥有的所有角色'，to=Role,blank=True)
                           
    def_str_(self):
    	return self.name

    class Meta:
        # django以后再做数据库迁移时，不再为UserInfo:类创建相关的表以及表结构了。
        # 此类可以当做"父类"，被其他Model类继承。
        abstract True
业务/models.py
class UserInfo(RbacUserInfo):
    phone=models.CharField(verbose_name='联系方式'，max_length=32)
    level_choices =
        (1,'T1'),
        (2,T2),
        (3,T3'),
    level models.IntegerField(verbose_name=',choices=level_choices)
    depart=models.ForeignKey(verbose_name='部门'，to='Department')
```

###### 4.业务系统中的用户表的路径写到配置文件

RBAC_USER_MODLE_CLASS = “app01.models.UserIfo”

用于在rbac分配权限时，读取业务表中的用户信息

###### 5.业务逻辑开发

将所有的路由都设置一个name，如：

```python
path('role/list/', role.role_list, name='role_list'),
    path('role/add/', role.role_add, name='role_add'),
    path('role/edit/<int:pk>/', role.role_edit, name='role_edit'),
    path('role/del/<int:pk>/', role.role_del, name='role_del'),
```

用于**反向生成url**以及**粒度控制到按钮级别**的权限控制

###### 6.权限信息的录取

在项目主路由里面添加rbac的路由分发，acction：必须设置**namespace**

```python
urlpatterns = [
	...
    path('rbac/', include('rbac.urls', namespace='rbac')),
    ...
]
```

rbac提供的地址进行操作

```python
http://127.0.0.1:8000/rbac/menu/list/
http://127.0.0.1:8000/rbac/role/list/
http://127.0.0.1:8000/rbac/distribute/permissions/
```

相关配置：自动发向url时，排除的url

```python
AUTO_DISCOVER_EXCLUDE = [
    '/admin/.*',
    '/login/',
    '/logout/',
    '/index/',
]
```

###### 7.编写用户登录的逻辑 [进行权限初始化]

```python
from django.shortcuts import render,redirect
from app01 import models
from rbac.service.init_permission import init_permission

def login(request):
    if request.method =='GET':
    	return render(request,'login.html')
    user request.POST.get('username')
    pwd request.POST.get('password')
    user_object models.UserInfo.objects.filter(name=user,password=pwd).first()
    if not user_object:
    	return render(request.,'login.html',f'error':'用户名或密码错误'})
    #用户权限信息的初始化
    init_permission(user_object,request)
    return redirect('/index/')
```

相关配置：权限和菜单的session key

在settings.py里面加上

```python
PERMISSION_SESSION_KEY = 'yue_permission_url_list_key'
MENU_SESSION_KEY = 'yue_permission_menu_key'
```

###### 8.编写一个首页逻辑

```python
def index(request):
    return render(request, 'index.html')
```

相关配置：需要登陆但无需权限的url

在settings.py里面加上

```python
NO_PERMISSION_LIST = [
    '/index/',
    '/logout/',
]
```

###### 9.通过中间件进行权限校验

```python
MIDDLEWARE = [
    ...
    "rbac.middleware.rbac.RbacMiddleware",
]
```

还有白名单校验

```python
# 中间件白名单 无需登录即可访问
VALID_URL_LIST = [
    '/login',
    '/admin/.*',
]
```

###### 10.控制粒度到按钮级别



###### 总结

目的是希望在任意系统中应用权限系统

--用户登录 + 用户首页 + 用户注销  业务逻辑

--项目业务逻辑开发

注意：开发的时候要灵活设置layout.html中的两个inclusion_tag

```python
<div class="pg-body">
    <div class="left-menu">
        <div class="menu-body">
        	{% multi_menu request %}  # 开发时注释掉，上线时使用
        </div>
    </div>
    <div class="right-body">
        <div>
        	{% breadcrumb request %}  # 开发时注释掉，上线时使用
        </div>
        {% block content %} {% endblock %}
    </div>
</div>
```

--权限信息的录入

--配置文件

注册app

```python
INSTALLED_APPS = [
    "rbac",   # 或者 "rbac.apps.RbacConfig"
]
```

应用中间件

```python
MIDDLEWARE = [
    ...
    "rbac.middleware.rbac.RbacMiddleware",
]
```

业务中用户表

```python
RBAC_USER_MODLE_CLASS = “app01.models.UserIfo”
```

权限/菜单在session中储存的key

```python
PERMISSION_SESSION_KEY = 'yue_permission_url_list_key'
MENU_SESSION_KEY = 'yue_permission_menu_key'
```

白名单

```python
# 中间件白名单 无需登录即可访问
VALID_URL_LIST = [
    '/login',
    '/admin/.*',
]
```

需要登陆但无需权限的URL

```python
NO_PERMISSION_LIST = [
    '/index/',
    '/logout/',
]
```

自动发现路由中的URL时，排除的URL

```python
AUTO_DISCOVER_EXCLUDE = [    
    '/admin/.*',    
    '/login/',    
    '/logout/',    
    '/index/',
]
```

--粒度到按钮级别的控制