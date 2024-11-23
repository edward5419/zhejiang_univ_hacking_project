from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import UserInfo
import json


# Create your views here.
@csrf_exempt
def login(request):
    # 检查是否为POST请求
    if request.method == 'POST':
        # 获取POST请求中的'id'参数
        id = request.POST.get('id')
        print(id)  # 打印id，用于调试
        # 获取POST请求中的'password'参数
        password = request.POST.get('password')
        print(password)  # 打印password，用于调试
        # 创建一个新的UserInfo对象，并保存到数据库
        user = UserInfo(userId=id, userPassword=password)
        user.save()
        # 返回创建成功的消息
        return JsonResponse({'message': 'User created successfully'}, status=200)
    else:
        # 如果不是POST请求，返回错误信息
        return JsonResponse({'error': 'Invalid request'}, status=400)
