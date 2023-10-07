from django.conf import settings


def init_permission(obj, request):
    # 根据当前用户信息获取此用户所拥有的所有权限，并放入session中
    """
    用户权限的初始化
    :param obj :当前用户对象
    :param request :请求相关所有数据
    获取当前用户所拥有的权限（跨表查询 UserInfo-->Role-->Permission）
    但是还要去重 假设ceo拥有/index/ /order/ 总监有 index/ customer/
    销售有 /user/ /add_user/ 当一个用户有这三个身份时，会发生重复
    使用distinct() 去重
    假如新建用户并没给分配权限，那么最终查询的url是null，所以要设置不为null
    """
    permission_queryset = obj.roles.filter(permissions__isnull=False).values("permissions__id",
                                                                             "permissions__title",
                                                                             "permissions__name",
                                                                             "permissions__pid_id",
                                                                             "permissions__pid__title",
                                                                             "permissions__pid__url",
                                                                             "permissions__menu_id",
                                                                             "permissions__menu__title",
                                                                             "permissions__menu__icon",
                                                                             "permissions__url").distinct()
    # 获取权限 + 菜单信息
    menu_dict = {}
    permission_dict = {}
    for item in permission_queryset:
        permission_dict[item['permissions__name']] = (
            {
                'id': item['permissions__id'],
                'title': item['permissions__title'],
                'url': item['permissions__url'],
                'pid': item['permissions__pid_id'],
                'p_title': item['permissions__pid__title'],
                'p_url': item['permissions__pid__url'],
            })

        menu_id = item['permissions__menu_id']
        if not menu_id:
            continue
        node = {'id': item['permissions__id'], 'title': item['permissions__title'], 'url': item['permissions__url']}
        if menu_id in menu_dict:
            menu_dict[menu_id]['children'].append(node)
        else:
            menu_dict[menu_id] = {
                'title': item['permissions__menu__title'],
                'icon': item['permissions__menu__icon'],
                'children': [node],
            }

    request.session[settings.PERMISSION_SESSION_KEY] = permission_dict
    request.session[settings.MENU_SESSION_KEY] = menu_dict
