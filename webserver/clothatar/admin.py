from django.contrib import admin

from .models import Person
from .models import PersonAvatar
from .models import Clothing
from .models import ClothingAvatar
# Register your models here.

admin.site.register(Person)
admin.site.register(PersonAvatar)
admin.site.register(Clothing)
admin.site.register(ClothingAvatar)
