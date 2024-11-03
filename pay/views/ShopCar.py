from rest_framework.views import APIView
from rest_framework.serializers import ModelSerializer
from django.core import serializers
from pay.models import ShopCar
from django.shortcuts import render, redirect
from app.libs.page_generator import page_generator
from app.models import Goods
from pay.utils import getUser,SuccessResponse,DetailResponse
from django.db.models import Q

def shopCar(request):
    locals().clear()
    d_list = []
    keyword = request.GET.get('Search')
    car_list = []
    if keyword:
        car_list = ShopCar.objects.filter(Q(goods_name__contains=keyword),is_delete=False,creator_id=getUser(request).id)
    else:
        car_list = ShopCar.objects.filter(is_delete=False,creator_id=getUser(request).id)
    d_list = []
    for car in car_list:
        dic = {}
        dic['car'] = car
        dic['good'] = Goods.objects.filter(id=car.goods_id).first()
        d_list.append(dic)
    locals().update(page_generator(request, d_list))
    len = d_list.__len__()
    print(locals(),'order')
    return render(request, "home/car.html", locals())

class ShopCarView(APIView):
    
    def post(self,request):
        user = getUser(request)
        car = [ShopCar.objects.create(goods_id=request.data['goods_id'],count=request.data['count'],creator=user,goods_name=request.data['goods_name'])]
        return DetailResponse(data=serializers.serialize("json",car))

    def get(self, request):
        user = getUser(request)
        good_id = request.query_params['good_id']
        car = ShopCar.objects.filter(goods_id=good_id,creator=user,is_delete=False)
        return DetailResponse(data=len(car))
    
    def put(self, request):
        user = getUser(request)
        carId = request.query_params['car_id']
        ShopCar.objects.filter(id=carId).delete()
        return DetailResponse()