from django.shortcuts import render
from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout

from django.http import HttpResponse
from django.http import JsonResponse


from .models import Person
from .models import PersonAvatar
from .models import Clothing
from .models import ClothingAvatar
from .models import ClothingFamily
# Create your views here.


@login_required(login_url='/admin/login/')
def user_login(request):
    # return HttpResponse('You have login')
    return redirect('/clothatar')


def user_logout(request):
    logout(request)
    return redirect('/clothatar')
    # return HttpResponse('You have logout')


def cloth_list(request):
    user_name = 'None'
    if not request.user.is_authenticated:
        user_login = 0
    else:
        user_login = 1
        user_name = request.user.username

    if user_name == 'anna':
        customer_id = 1

    clothings = []

    clothings.append({'pic_name': 'img/p-1-1.jpg', 'match_point': 98, 'size': 'AU 10', 'description': 'Elise Ruffle Wrap Dress atmos', 'family_id': 1, 'price': 24.99})
    clothings.append({'pic_name': 'img/p-2-1.jpg', 'match_point': 100, 'size': 'AU 10', 'description': 'Palm Springs Drape Dress Cooper St', 'family_id': 2, 'price': 32.99})
    clothings.append({'pic_name': 'img/p-3-1.jpg', 'match_point': 99, 'size': 'AU 10', 'description': 'Monet Dress Fresh Soul', 'family_id': 3, 'price': 55.99})

    context = {'user_login': user_login, 'clothings': clothings}

    return render(request, 'clothatar/list.html', context)


def cloth_detail(request, family_id):
    user_name = 'None'
    customer_id = 0
    if not request.user.is_authenticated:
        user_login = 0
    else:
        user_login = 1
        user_name = request.user.username

    if user_name == 'anna':
        customer_id = 1

    pic_name = 'img/p-{}-1.jpg'.format(family_id)

    match_result = match_cloth(customer_id, family_id)

    context = {'pic_name': pic_name, 'user_login': user_login, 'match_result': match_result}

    print("context--->:", context)

    return render(request, 'clothatar/details.html', context)


def match_cloth(customer_id, family_id):
    query_result = {}
    clothings = []

    query_result['customer_id'] = customer_id
    query_result['clothings'] = clothings

    if customer_id > 0:
        people = Person.objects.filter(person_id=customer_id)[0]
        people_avatar = PersonAvatar.objects.filter(avatar_id=people.avatar_id)[0]
    else:
        people = None
        people_avatar = None

    clothing_family = ClothingFamily.objects.filter(family_id=family_id)[0]

    query_result['description'] = clothing_family.description
    clothings_set = Clothing.objects.filter(family_id=family_id)

    min_value = 10000
    suggest_size = 'unknown'

    for cloth in clothings_set:
        cloth_avatar_set = ClothingAvatar.objects.filter(avatar_id=cloth.avatar_id)

        if cloth_avatar_set is not None:
            cloth_avatar = cloth_avatar_set[0]
            print('cloth_avatar--->:', cloth_avatar)

            match_info = {}

            match_info['id'] = cloth_avatar.avatar_id
            match_info['match_point'] = 0
            match_info['size'] = cloth.clothing_size.size_desc

            if people_avatar is not None:
                match_info['waist'] = people_avatar.waist - cloth_avatar.waist
                match_info['hips'] = people_avatar.hips - cloth_avatar.hips
                match_info['bust'] = people_avatar.bust - cloth_avatar.bust

                v1 = sum([abs(match_info['waist']), abs(match_info['hips']), abs(match_info['bust'])])
                if min_value > v1:
                    min_value = v1
                    suggest_size = cloth.clothing_size.size_desc

                avg_value = int(v1 / len([match_info['waist'], match_info['hips'], match_info['bust']]))
                match_info['match_point'] = 100 - avg_value

                print("avg_value--->", avg_value)
                print("match_point--->", match_info['match_point'])

            else:
                match_info['waist'] = cloth_avatar.waist
                match_info['hips'] = cloth_avatar.hips
                match_info['bust'] = cloth_avatar.bust

            clothings.append(match_info)

    query_result['suggest_size'] = suggest_size

    print("suggest_size--->", suggest_size)

    # print("return resutl --->: ", query_result)
    return query_result


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
