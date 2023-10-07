from django.urls import path
from web.views import customer
from web.views import payment
from web.views import account

urlpatterns = [
    path('customer/list/', customer.customer_list, name='customer_list'),
    path('customer/add/', customer.customer_add, name='customer_add'),
    path('customer/edit/<int:cid>/', customer.customer_edit, name='customer_edit'),
    path('customer/del/<int:cid>/', customer.customer_del, name='customer_del'),
    path('customer/import/', customer.customer_import, name='customer_import'),
    path('customer/tpl/', customer.customer_tpl, name='customer_tpl'),

    path('payment/list/', payment.payment_list, name='payment_list'),
    path('payment/add/', payment.payment_add, name='payment_add'),
    path('payment/edit/<int:pid>/', payment.payment_edit, name='payment_edit'),
    path('payment/del/<int:pid>/', payment.payment_del, name='payment_del'),

    path('login/', account.login),
]
