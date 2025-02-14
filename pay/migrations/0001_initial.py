# Generated by Django 3.2.19 on 2024-03-12 11:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('app', '0013_alter_users_account'),
    ]

    operations = [
        migrations.CreateModel(
            name='ShopCar',
            fields=[
                ('id', models.BigAutoField(help_text='Id', primary_key=True, serialize=False, verbose_name='Id')),
                ('goods_id', models.BigIntegerField(verbose_name='商品')),
                ('count', models.BigIntegerField(help_text='数量', verbose_name='数量')),
                ('is_delete', models.BooleanField(default=False, verbose_name='是否删除')),
                ('create_datetime', models.DateTimeField(auto_now_add=True, help_text='创建时间', null=True, verbose_name='创建时间')),
                ('creator', models.ForeignKey(db_constraint=False, help_text='创建人', null=True, on_delete=django.db.models.deletion.SET_NULL, related_query_name='creator_query', to='app.users', verbose_name='创建人')),
            ],
            options={
                'verbose_name': '购物车',
                'verbose_name_plural': '购物车',
                'db_table': 'pay_shop_car',
                'ordering': ('-create_datetime',),
            },
        ),
        migrations.CreateModel(
            name='PayOrderModel',
            fields=[
                ('id', models.BigAutoField(help_text='Id', primary_key=True, serialize=False, verbose_name='Id')),
                ('goods_name', models.CharField(max_length=255, verbose_name='商品名')),
                ('payment_type', models.CharField(choices=[('alipay', 'ALIPAY'), ('wxpay', 'WXPAY'), ('local', 'LOCAL')], max_length=10, verbose_name='支付方式')),
                ('amount', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='金额')),
                ('order_status', models.IntegerField(choices=[(0, '待支付'), (1, '支付成功'), (2, '支付失败')], default=0, verbose_name='订单状态')),
                ('out_trade_no', models.CharField(max_length=255, unique=True, verbose_name='订单号')),
                ('delivery_status', models.IntegerField(choices=[(0, '待发货'), (1, '已发货'), (2, '已收货')], default=0, verbose_name='发货状态')),
                ('delivery_address', models.CharField(blank=True, max_length=500, null=True, verbose_name='收货地址')),
                ('create_datetime', models.DateTimeField(auto_now_add=True, help_text='创建时间', null=True, verbose_name='创建时间')),
                ('car', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='pay_order_car', to='pay.shopcar', verbose_name='购物车')),
                ('creator', models.ForeignKey(db_constraint=False, help_text='创建人', null=True, on_delete=django.db.models.deletion.SET_NULL, related_query_name='creator_query', to='app.users', verbose_name='创建人')),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='pay_order_goods', to='app.goods', verbose_name='商品')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='pay_order_user', to='app.users', verbose_name='支付用户')),
            ],
            options={
                'verbose_name': '订单',
                'verbose_name_plural': '订单',
                'db_table': 'pay_order',
                'ordering': ('-create_datetime',),
            },
        ),
        migrations.CreateModel(
            name='GoodsSales',
            fields=[
                ('id', models.BigAutoField(help_text='Id', primary_key=True, serialize=False, verbose_name='Id')),
                ('volume', models.BigIntegerField(verbose_name='销量')),
                ('money', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='销售额')),
                ('category', models.CharField(blank=True, max_length=255, null=True, verbose_name='商品分类')),
                ('create_datetime', models.DateTimeField(auto_now_add=True, help_text='创建时间', null=True, verbose_name='创建时间')),
                ('creator', models.ForeignKey(db_constraint=False, help_text='创建人', null=True, on_delete=django.db.models.deletion.SET_NULL, related_query_name='creator_query', to='app.users', verbose_name='创建人')),
                ('good', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='goods_sales', to='app.goods', verbose_name='商品')),
            ],
            options={
                'verbose_name': '商品销售分析',
                'verbose_name_plural': '商品销售分析',
                'db_table': 'pay_goods_sales',
                'ordering': ('-volume',),
            },
        ),
    ]
