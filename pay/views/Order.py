from rest_framework.views import APIView
from django.shortcuts import render, redirect
from pay.models import PayOrderModel
from app.libs.page_generator import page_generator
from app.models import Goods
from pay.utils import getUser,SuccessResponse,DetailResponse


def order(request):
    d_list = []
    print(getUser(request).id,'getUser(request).id')
    keyword = request.GET.get('Search')
    if keyword:
        from django.db.models import Q
        d_list = PayOrderModel.objects.filter(Q(goods__name__contains=keyword) | Q(out_trade_no__contains=keyword),user_id=getUser(request).id)
    else:
        d_list = PayOrderModel.objects.filter(user_id=getUser(request).id)
    len = d_list.__len__()
    locals().update(page_generator(request, d_list))
    return render(request, "home/order.html", locals())

def orderALL(request):
    d_list = []
    keyword = request.GET.get('Search')
    if keyword:
        from django.db.models import Q
        d_list = PayOrderModel.objects.filter(Q(goods__name__contains=keyword) | Q(out_trade_no__contains=keyword))
    else:
        d_list = PayOrderModel.objects.filter()
    len = d_list.__len__()
    locals().update(page_generator(request, d_list))
    return render(request, "manage/order.html", locals())

class PayOrderView(APIView):

    def put(self, request):
        order_id = request.query_params['id']
        PayOrderModel.objects.filter(id=order_id).delete()
        return DetailResponse()

    def post(self, request):
        order_id = request.query_params['id']
        order = PayOrderModel.objects.filter(id=order_id).first()
        if 'delivery_status' in request.data:
            order.delivery_status = request.data['delivery_status']
        order.save()
        return DetailResponse()