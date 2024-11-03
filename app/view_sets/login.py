from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from ..models import Users
from app.libs.page_generator import page_generator

def indexTest(request):
    return render(request, "templates/login_user.html")

def indexTest1(request):
    return render(request, "templates/register_user.html")

def loginUsers(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        users = Users.objects.filter(username=username, password=password)
        if users:
            request.session['is_login'] = '1'
            request.session['user_id'] = users[0].id
            request.session['username'] = users[0].username
            request.session['nick_name'] = users[0].nick_name
            request.session['account'] = users[0].account
            request.session['age'] = users[0].age
            request.session['sex'] = users[0].sex
            request.session.set_expiry(0)  # 关闭浏览器时删除会话
            # return render(request, 'home/index.html')
            return HttpResponse("ok")
        return HttpResponse("no")
    else:
        return render(request, 'login_user.html')

def registerUsers(request):
    if request.method == "POST" and request.POST:
        data = request.POST
        if(data.get("username") == ""):
            return HttpResponse("no")

        if (data.get("password") == ""):
            return HttpResponse("no")

        if (data.get("nick_name") == ""):
            return HttpResponse("no")

        username = data.get("username")
        password = data.get("password")
        nick_name = data.get("nick_name")
        age = data.get("age")
        sex = data.get("sex")
        account = 10000
        Users.objects.create(
            username=username,
            password=password,
            nick_name=nick_name,
            age=age,
            sex=sex,
            account=account
        )
        return HttpResponse("ok")
    else:
        return HttpResponse("no")
        # return HttpResponseRedirect('/')
from django.shortcuts import redirect


def logout(request):
    # 清空会话数据
    request.session.flush()
    # 或者只清空特定的会话数据
    # del request.session['is_login']
    # del request.session['user_id']
    # del request.session['username']

    # 重定向到登录页面或其他页面
    return render(request, 'login_user.html')  # 假设登录页面的 URL 名称为 'login'


def user_all(request):
    d_list = []
    keyword = request.GET.get('Search')
    print(keyword)
    if keyword:
        from django.db.models import Q
        d_list = Users.objects.filter(nick_name = keyword)
    else:
        d_list = Users.objects.all()
    len = d_list.__len__()
    locals().update(page_generator(request, d_list))
    return render(request, 'manage/user.html', locals())

def user_update(request):
    if request.method == 'POST':
        Users.objects.filter(
            id=request.POST['id']
        ).update(username=request.POST['username'], nick_name=request.POST['nick_name'],
                 age=request.POST['age'],
                 sex=request.POST['sex'],
                 account=int(request.POST['account']))
        return HttpResponse("ok")
    id = request.GET['id']
    info = Users.objects.filter(id=id)[0]
    return render(request, 'manage/user.html', locals())

def user_delete(request):
    id = request.GET['id']
    print(id)
    Users.objects.filter(id=id).delete()
    return render(request, 'manage/user.html')

