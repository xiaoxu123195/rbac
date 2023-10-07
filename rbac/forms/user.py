from django import forms
from django.core.exceptions import ValidationError
from rbac import models


class UserModelForm(forms.ModelForm):
    confirm_password = forms.CharField(label='确认密码')

    class Meta:
        model = models.UserInfo
        fields = ['name', 'email', 'password', 'confirm_password']

    def __init__(self, *args, **kwargs):
        super(UserModelForm, self).__init__(*args, **kwargs)
        # 统一给ModelForm生成字段添加样式
        for name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'

    def clean_confirm_password(self):
        """
        检测密码是否一致
        :return:
        当调用 form.is_valid() 方法时，Django 会自动执行一系列的验证步骤，
        如验证字段是否为空、是否符合指定的格式等。如果所有的验证都通过了，
        那么 form.is_valid() 方法就会返回 True，
        同时会将经过验证的数据存储在 cleaned_data 字典中。
        """
        password = self.cleaned_data['password']
        confirm_password = self.cleaned_data['confirm_password']
        if password != confirm_password:
            raise ValidationError('两次密码输入不一致')
        return confirm_password


class UpdateUserModelForm(forms.ModelForm):
    class Meta:
        model = models.UserInfo
        fields = ['name', 'email', ]

    def __init__(self, *args, **kwargs):
        super(UpdateUserModelForm, self).__init__(*args, **kwargs)
        # 统一给ModelForm生成字段添加样式
        for name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'


class ResetPasswordUserModelForm(forms.ModelForm):
    confirm_password = forms.CharField(label='确认密码')

    class Meta:
        model = models.UserInfo
        fields = ['password', 'confirm_password']

    def __init__(self, *args, **kwargs):
        super(ResetPasswordUserModelForm, self).__init__(*args, **kwargs)
        # 统一给ModelForm生成字段添加样式
        for name, field in self.fields.items():
            field.widget.attrs['class'] = 'form-control'

    def clean_confirm_password(self):
        """
        检测密码是否一致
        :return:
        """
        password = self.cleaned_data['password']
        confirm_password = self.cleaned_data['confirm_password']
        if password != confirm_password:
            raise ValidationError('两次密码输入不一致')
        return confirm_password

    def clean_original_password(self):
        original_password = self.cleaned_data.get('original_password')
        if original_password != self.instance.password:
            raise forms.ValidationError('原始密码输入错误')
        return original_password
