from enum import Enum

from django.db import models

from app.models import Users,Goods
table_prefix = 'pay_'
class PaymentType(Enum):  # 放到这，为了防止循环导入
    """
    支付方式枚举
    """
    ALIPAY = 'alipay'
    WXPAY = 'wxpay'
    LOCAL = 'local'


class PayOrderModel(models.Model):
    id = models.BigAutoField(primary_key=True, help_text="Id", verbose_name="Id")
    ORDER_STATUS_CHOICES = (
        (0, '待支付'),
        (1, '支付成功'),
        (2, '支付失败'),
    )
    goods = models.ForeignKey(Goods, on_delete=models.CASCADE, related_name="pay_order_goods", verbose_name="商品")
    goods_name = models.CharField(max_length=255, verbose_name="商品名")
    payment_type = models.CharField(max_length=10, choices=[(e.value, e.name) for e in PaymentType],
                                    verbose_name="支付方式")
    amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="金额")
    user = models.ForeignKey(Users, on_delete=models.CASCADE, related_name="pay_order_user", verbose_name="支付用户")
    order_status = models.IntegerField(choices=ORDER_STATUS_CHOICES, default=0, verbose_name="订单状态")
    out_trade_no = models.CharField(max_length=255, unique=True, verbose_name="订单号")
    delivery_STATUS_CHOICES = (
        (0, '待发货'),
        (1, '已发货'),
        (2, '已收货'),
    )
    delivery_status = models.IntegerField(choices=delivery_STATUS_CHOICES, default=0, verbose_name="发货状态")
    car = models.ForeignKey(to="ShopCar", on_delete=models.CASCADE, related_name="pay_order_car", verbose_name="购物车",null=True)
    delivery_address = models.CharField(max_length=500, verbose_name="收货地址", null=True, blank=True)
    creator = models.ForeignKey(Users, related_query_name='creator_query', null=True,
                                verbose_name='创建人', help_text="创建人", on_delete=models.SET_NULL,
                                db_constraint=False)
    create_datetime = models.DateTimeField(auto_now_add=True, null=True, blank=True, help_text="创建时间",
                                           verbose_name="创建时间")

    class Meta:
        db_table = table_prefix + "order"
        verbose_name = '订单'
        verbose_name_plural = verbose_name
        ordering = ('-create_datetime',)
        
class ShopCar(models.Model):
    """
    购物车
    """
    id = models.BigAutoField(primary_key=True, help_text="Id", verbose_name="Id")
    goods_name = models.CharField(max_length=255, verbose_name="商品名",null=True, blank=True, )
    goods_id = models.BigIntegerField(verbose_name="商品")
    count = models.BigIntegerField(verbose_name="数量", help_text="数量")
    is_delete = models.BooleanField(default=False, verbose_name="是否删除")
    creator = models.ForeignKey(Users, related_query_name='creator_query', null=True,
                                verbose_name='创建人', help_text="创建人", on_delete=models.SET_NULL,
                                db_constraint=False)
    create_datetime = models.DateTimeField(auto_now_add=True, null=True, blank=True, help_text="创建时间",
                                           verbose_name="创建时间")
    class Meta:
        db_table = table_prefix + "shop_car"
        verbose_name = "购物车"
        verbose_name_plural = verbose_name
        ordering = ("-create_datetime",)

class GoodsSales(models.Model):
    """
    商品销售分析
    """
    id = models.BigAutoField(primary_key=True, help_text="Id", verbose_name="Id")
    good= models.ForeignKey(Goods, on_delete=models.CASCADE, related_name="goods_sales", verbose_name="商品")
    volume = models.BigIntegerField(verbose_name="销量")
    money = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="销售额")
    category = models.CharField(max_length=255, verbose_name="商品分类", null=True, blank=True)
    creator = models.ForeignKey(Users, related_query_name='creator_query', null=True,
                                verbose_name='创建人', help_text="创建人", on_delete=models.SET_NULL,
                                db_constraint=False)
    create_datetime = models.DateTimeField(auto_now_add=True, null=True, blank=True, help_text="创建时间",
                                           verbose_name="创建时间")
    class Meta:
        db_table = table_prefix + "goods_sales"
        verbose_name = "商品销售分析"
        verbose_name_plural = verbose_name
        ordering = ("-volume",)
    