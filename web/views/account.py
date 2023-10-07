from django.shortcuts import render, redirect
from rbac import models
from rbac.service.init_permission import init_permission


def login(request):
    # 用户登录
    if request.method == 'GET':
        return render(request, 'login.html')
    user = request.POST.get('user')
    pwd = request.POST.get('pwd')
    obj = models.UserInfo.objects.filter(name=user, password=pwd).first()
    if not obj:
        msg = '用户名或密码错误'
        return render(request, 'login.html', locals())
    # 权限信息的初始化
    init_permission(obj, request)
    # 重定向
    return redirect('/customer/list/')
