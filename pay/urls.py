from django.urls import path
from rest_framework.routers import SimpleRouter

from pay.views.Order import PayOrderView,order,orderALL
from pay.views.ShopCar import ShopCarView,shopCar
from pay.views.GoodsSales import visualization
from pay.views.Pay import PayAPIView
from pay.views.ShopCar import ShopCarView
from pay.views.Order import PayOrderView
router = SimpleRouter()
# router.register('order', PayOrderView.as_view())
# router.register('api/pay/good', GoodsViewSet)
# router.register('shopCar', ShopCarView.as_view())
# router.register('api/pay/sales', GoodsSalesViewSet)

urlpatterns = [
    path('order', order),
    path('orderALL', orderALL),
    path('shopCar', shopCar),
    path('visualization', visualization),
    path('api/car', ShopCarView.as_view()),
    path('api/order', PayOrderView.as_view()),
    path('api/pay', PayAPIView.as_view()),
    # path('api/pay/alipay_notify', AliPayNotifyAPIView.as_view()),
    # path('api/pay/wxpay_notify', WxPayNotifyAPIView.as_view())
]
urlpatterns += router.urls
