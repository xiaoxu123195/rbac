# Generated by Django 4.2.5 on 2023-09-25 12:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("rbac", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="permission",
            name="is_menu",
            field=models.BooleanField(default=False, verbose_name="是否可以做菜单"),
        ),
    ]
