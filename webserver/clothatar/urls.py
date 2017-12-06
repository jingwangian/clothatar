from django.conf.urls import url
from django.contrib import admin
from . import views

app_name = 'clothatar'

urlpatterns = [
    # clothmatch/query
    url(r'^$', views.cloth_list, name='cloth_list'),
    url(r'^user_login$', views.user_login, name='user_login'),
    url(r'^user_logout$', views.user_logout, name='user_logout'),
    url(r'^detail/(?P<family_id>\d)$', views.cloth_detail, name='cloth_detail'),
    url(r'^query$', views.match_query, name='query')
]
