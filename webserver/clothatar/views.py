from django.shortcuts import render

from django.http import HttpResponse
from django.http import JsonResponse


from .models import Person
from .models import PersonAvatar
from .models import Clothing
from .models import ClothingAvatar

# Create your views here.


def cloth_list(request):
    return render(request, 'clothatar/list.html', {})


def cloth_detail(request, family_id):
    pic_name = 'img/p-{}-1.jpg'.format(family_id)
    return render(request, 'clothatar/details.html', {'pic_name': pic_name})


def match_query(request):

    post_content = request.POST

    # print("request --->", request)
    # print("request msg--->", post_content)
    # customer_id = int(post_content['customer_id'])
    # clothing_id_list = post_content.getlist('clothing')

    # print('customer_id -->', customer_id)
    # print('clothing_id_list -->', clothing_id_list, type(clothing_id_list))

    query_result = {}
    clothings = []

    # people_avatar_id = 1

    customer_id = 1
    family_id = 1

    query_result['customer_id'] = customer_id
    query_result['clothings'] = clothings

    people = Person.objects.filter(person_id=customer_id)[0]

    # people_avatar = PersonAvatar.objects.filter(avatar__avatar_id=people.avatar_id)

    people_avatar = PersonAvatar.objects.filter(avatar_id=people.avatar_id)[0]

    # print('people--->', people)

    # for pa in people_avatars:
    #     print('pa--->', pa)

    # print('people_avatar--->', people_avatar)

    clothings_set = Clothing.objects.filter(family_id=family_id)

    for cloth in clothings_set:
        cloth_avatar_set = ClothingAvatar.objects.filter(avatar_id=cloth.avatar_id)

        if cloth_avatar_set is not None:
            cloth_avatar = cloth_avatar_set[0]
            print('cloth_avatar--->:', cloth_avatar)

            match_info = {}

            match_info['id'] = cloth_avatar.avatar_id
            match_info['match_point'] = 98
            match_info['size'] = cloth.clothing_size.size_desc
            match_info['waist'] = people_avatar.waist - cloth_avatar.waist
            match_info['hips'] = people_avatar.hips - cloth_avatar.hips
            match_info['bust'] = people_avatar.bust - cloth_avatar.bust

            clothings.append(match_info)

    print("return resutl --->: ", query_result)
    return JsonResponse(query_result)
