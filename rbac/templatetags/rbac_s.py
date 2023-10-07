from django.template import Library
from django.conf import settings
from collections import OrderedDict
from rbac.service import urls

register = Library()


@register.inclusion_tag('rbac/static_menu.html')
def static_menu(request):
    """创建一级菜单"""
    menu_list = request.session[settings.MENU_SESSION_KEY]
    return {'menu_list': menu_list}


@register.inclusion_tag('rbac/multi_menu.html')
def multi_menu(request):
    """创建二级菜单"""
    menu_dict = request.session[settings.MENU_SESSION_KEY]
    # 对字典的key进行排序
    key_list = sorted(menu_dict)
    # 空的有序字典
    ordered_dict = OrderedDict()

    for key in key_list:
        val = menu_dict[key]
        val['class'] = 'hide'

        for per in val['children']:
            # 将现在访问的url与获取的url对比，若相同则取消hide添加active
            if per['id'] == request.current_selected_permission:
                per['class'] = 'active'
                val['class'] = ''
        ordered_dict[key] = val

    return {'menu_dict': ordered_dict}


@register.inclusion_tag('rbac/breadcrumb.html')
def breadcrumb(request):
    return {'record_list': request.breadcrumb}


@register.filter
def has_permission(request, name):
    """
    判断是否有权限，最多有两个参数
    格式：request|has_permission:"customer_add"
    :param request:
    :param name:
    :return:
    """
    if name in request.session[settings.PERMISSION_SESSION_KEY]:
        return True


@register.simple_tag
def memory_url(request, name, *args, **kwargs):
    """
    生成带有原搜索条件的URL（替代了模板中的url）
    :param request:
    :param name:
    :return:
    """
    return urls.memory_url(request, name, *args, **kwargs)
