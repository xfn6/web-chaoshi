from rest_framework.views import APIView
from pay.models import ShopCar,GoodsSales
from pay.models import PaymentType
from pay.utils import CustomPay
from app.models import Goods
from pay.utils import DetailResponse,ErrorResponse,getUser
 # 库存变化
def stock_change(add=False,stock=0,good_id=None):
    goods = Goods.objects.filter(id=good_id).first()
    if goods:
        good_stock = goods.stock
        if add:
            good_stock += stock
        else:
            if good_stock <= stock:
                return ErrorResponse("库存不足")
            else:
                good_stock -= stock
        goods.stock = good_stock
        goods.save()    
        
    return ErrorResponse("商品不存在")


class PayAPIView(APIView):
    """支付接口"""
    def post(self, request):
        user = getUser(request)
        goods_id =  request.data['goods_id']
        good = Goods.objects.get(id=goods_id)
        goods_name = good.name
        amount = request.data['amount']
        stock = request.data['stock']
        delivery_address = request.data['delivery_address']
        car = None
        if 'car_id' in request.data:
            car_id = request.data['car_id']
            car = ShopCar.objects.get(id=car_id)
            car.is_delete = True
            car.save()
        out_trade_no =  None
        if 'out_trade_no' in request.data:
            out_trade_no = request.data['out_trade_no']
        else:
            # stock_change(False,stock,good.id)
            GoodsSales.objects.create(good=good,volume=stock,money=amount,category=good.sort)
        pay_instance = CustomPay.get_instance()  # 单例
        dic = pay_instance.pay(goods_name,good,car, amount, user,out_trade_no,delivery_address)
        code = 200
        if dic['success'] is False:
            code = 400
        return DetailResponse(msg=dic['message'],code=code, data={
            'code_url': dic['data']
        })
