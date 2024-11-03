from rest_framework.views import APIView
from django.shortcuts import render, redirect
from pay.models import GoodsSales
from app.libs.page_generator import page_generator
from app.models import Goods
from pay.utils import getUser,SuccessResponse,DetailResponse
import json

def visualization(request):
    s = GoodsSales.objects.all()
    t_list = []
    t_type_list = []
    t_type_label_list = []
    volume_list_label = []
    volume_list_data = []
    t_dict = dict()
    t_type_dict = dict()
    volume_dict = dict()
    for gs in GoodsSales.objects.all():
        s_dict = dict()
        type_dict = dict()
        gs_good = gs.good
        good_id = gs_good.id
        if good_id in t_dict.keys():
            temp = t_dict[good_id]
            s_dict['category'] = gs.category
            s_dict['name'] = gs_good.name
            s_dict['volume'] = gs.volume + temp['volume']
            s_dict['money'] = gs.money + temp['money']
            s_dict['good'] = gs_good
            t_dict[good_id] = s_dict
            s_dict['good'] = ''
            volume_dict[good_id] = s_dict
        else:
            s_dict['category'] = gs.category
            s_dict['name'] = gs_good.name
            s_dict['volume'] = gs.volume
            s_dict['money'] = gs.money
            s_dict['good'] = gs_good
            t_dict[good_id] = s_dict
            s_dict['good'] = ''
            volume_dict[good_id] = s_dict
        if gs.category in t_type_dict.keys():
            temp = t_type_dict[gs.category]
            type_dict['name'] = gs.category
            type_dict['value'] = gs.volume + temp['value']
            type_dict['money'] = gs.money + + temp['money']
            t_type_dict[gs.category] = type_dict
        else:
            type_dict['name'] = gs.category
            type_dict['value'] = gs.volume
            type_dict['money'] = gs.money
            t_type_dict[gs.category] = type_dict
        
    for key,value in t_dict.items():
        t_list.append(value)
    for key,value in t_type_dict.items():
        t_type_list.append(value['value'])
        t_type_label_list.append(value['name'])
    for key,value in volume_dict.items():
        value['money'] = str(value['money'])
        volume_list_data.append(value)
    t_list = sorted(t_list,key=lambda x:x['volume'],reverse=True)
    t_list = t_list[:8] if len(t_list) > 8 else t_list
    t_type_list = t_type_list[:8] if len(t_type_list) > 8 else t_type_list
    volume_list_data = sorted(volume_list_data,key=lambda x:x['volume'],reverse=True)
    volume_list_data = volume_list_data[:8] if len(volume_list_data) > 8 else volume_list_data
    
    
    json_type_label = json.dumps({'labels': t_type_label_list})
    print(t_list)
    print('volume_list_data',volume_list_data)
    return render(request, "home/visualization.html", locals())
