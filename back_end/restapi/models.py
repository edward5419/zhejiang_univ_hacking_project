from django.db import models

# 数据库上创建table的代码。
class UserInfo(models.Model):
    userInfoId = models.AutoField(primary_key=True)
    userId = models.CharField(max_length=100,)
    userPassword = models.CharField(max_length=100,)