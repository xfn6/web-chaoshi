# Generated by Django 2.1.4 on 2019-01-16 12:05

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('sale_price', models.FloatField()),
                ('cost_price', models.FloatField()),
                ('weight', models.FloatField()),
                ('sort', models.IntegerField()),
                ('location', models.IntegerField()),
                ('produce_date', models.DateField()),
                ('limit_date', models.DateField()),
                ('isHot', models.IntegerField()),
                ('isCheap', models.IntegerField()),
                ('isDelete', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Manager',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('account', models.CharField(max_length=20)),
                ('pwd', models.CharField(max_length=40)),
                ('name', models.CharField(max_length=20)),
                ('gender', models.IntegerField(default=0)),
                ('phone', models.CharField(max_length=11)),
                ('authority', models.IntegerField(default=0)),
                ('isDelete', models.BooleanField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Message',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('time', models.DateTimeField()),
                ('type', models.IntegerField()),
                ('content', models.TextField()),
                ('contact', models.CharField(max_length=20)),
                ('name', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Provider',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('address', models.CharField(max_length=40)),
                ('phone', models.CharField(max_length=11)),
                ('isDelete', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Record',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('purchase_date', models.DateTimeField()),
                ('on_sale', models.IntegerField()),
                ('stock', models.IntegerField()),
                ('sale_num', models.IntegerField()),
                ('sale_date', models.DateTimeField(null=True)),
                ('withdraw_num', models.IntegerField()),
                ('withdraw_date', models.DateTimeField(null=True)),
                ('name', models.ForeignKey(on_delete=models.CASCADE, to='app.Goods')),
            ],
        ),
        migrations.AddField(
            model_name='goods',
            name='provider',
            field=models.ForeignKey(on_delete=models.CASCADE, to='app.Provider'),
        ),
    ]
