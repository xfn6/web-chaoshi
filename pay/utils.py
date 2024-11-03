import decimal
import json
import time
import threading
from decimal import Decimal
from rest_framework.response import Response

from pay.models import PayOrderModel, PaymentType, ShopCar
from app.models import Users,Goods

#  生成订单号

def generate_order_code():
    """
    生成订单号方法
    :return:根据时间生成订单号
    """
    return str(
        time.strftime('%Y%m%d%H%M%S', time.localtime(time.time()))
        + str(time.time()).replace('.', '')[-7:]
    )


class CustomPay:
    """
    封装的支付工具类，直接调用pay方法进行支付
    """
    __instance = None
    __instance_lock = threading.Lock()

    def __init__(self):
        # if CustomPay.__instance is not None:
        #     raise Exception("支付类是单例，请用get_instance获取")
        # else:
        #     CustomPay.__instance = self
        self.wxpay_config = None
        self.alipay_config = None
        self.pay_type = PaymentType.LOCAL  

    def __new__(cls, *args, **kwargs):
        if CustomPay.__instance is None:
            with CustomPay.__instance_lock:
                if CustomPay.__instance is None:
                    CustomPay.__instance = object.__new__(cls)
        return CustomPay.__instance

    @staticmethod
    def get_instance():
        if CustomPay.__instance is None:
            CustomPay()
        return CustomPay.__instance

    @staticmethod
    def create_order(out_trade_no, amount, goods_name,goods,car, payment_type, pay_user,delivery_address):
        PayOrderModel.objects.create(out_trade_no=out_trade_no, amount=amount, goods_name=goods_name,goods=goods,car=car,
                                            payment_type=payment_type, user=pay_user,delivery_address=delivery_address)
    @staticmethod
    def update_order(out_trade_no, status = 1):
        order =  PayOrderModel.objects.filter(out_trade_no=out_trade_no).first()
        print(order,out_trade_no)
        order.order_status = status
        order.save()
     
    @staticmethod
    def change_balance(user_id, amount):
        user = Users.objects.filter(id=user_id).first()
        if user:
            balance = Decimal(user.account)
            amount =  Decimal(amount)
            print(balance , amount,balance > amount)
            if balance > amount:
                user.account = balance - amount
                user.save()
                return True,None
            else:
                return False,'余额不足'
        else:
            return False,'用户不存在'
    def pay(self, subject,good,car, amount, pay_user,out_trade_no_exit,delivery_address):
        """
        支付方法
        :param pay_type: 支付的平台，可选wxpay, alipay
        :param subject: 商品的描述
        :param amount: 商品的价格，单位：元
        :return: 前端显示的url二维码链接
        """
        dic = dict()
        dic['message'] = '调用支付接口成功'
        dic['success'] = True
        dic['data'] =  None
        out_trade_no = out_trade_no_exit
        print('pay', out_trade_no)
        if out_trade_no is None:
            out_trade_no = generate_order_code()
        
        if out_trade_no_exit is None:
            self.create_order(out_trade_no, amount, subject,good,car,PaymentType.LOCAL.value , pay_user,delivery_address)
        s,msg =  self.change_balance(pay_user.id,amount)
        if s:
            self.update_order(out_trade_no)
        else:
            dic['success'] =  False
            dic['message'] = msg
        return dic
        
class ErrorResponse(Response):
    """
    标准响应错误的返回,ErrorResponse(msg='xxx')
    (1)默认错误码返回400, 也可以指定其他返回码:ErrorResponse(code=xxx)
    """

    def __init__(self, data=None, msg='error', code=400, status=None, template_name=None, headers=None,
                 exception=False, content_type=None):
        std_data = {
            "code": code,
            "data": data,
            "msg": msg
        }
        super().__init__(std_data, status, template_name, headers, exception, content_type)

class DetailResponse(Response):
    """
    不包含分页信息的接口返回,主要用于单条数据查询
    (1)默认code返回2000, 不支持指定其他返回码
    """

    def __init__(self, data=None, msg='success', status=None, template_name=None, headers=None, exception=False,
                 content_type=None,code=2000):
        std_data = {
            "code": code,
            "data": data,
            "msg": msg
        }
        super().__init__(std_data, status, template_name, headers, exception, content_type)


class SuccessResponse(Response):
    """
    标准响应成功的返回, SuccessResponse(data)或者SuccessResponse(data=data)
    (1)默认code返回2000, 不支持指定其他返回码
    """

    def __init__(self, data=None, msg='success', status=None, template_name=None, headers=None, exception=False,
                 content_type=None,page=1,limit=1,total=1):
        std_data = {
            "code": 2000,
            "data": {
                "page": page,
                "limit": limit,
                "total": total,
                "data": data
            },
            "msg": msg
        }
        super().__init__(std_data, status, template_name, headers, exception, content_type)


def getUser(request):
    user_id = request.session['user_id']
    return Users.objects.filter(id=user_id).first()