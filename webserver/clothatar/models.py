from django.db import models

# Create your models here.


class Clothing(models.Model):
    clothing_id = models.AutoField(primary_key=True)
    # family = models.ForeignKey('ClothingFamily', models.DO_NOTHING, blank=True, null=True)
    family_id = models.IntegerField(unique=True, blank=True, null=True)
    avatar_id = models.IntegerField(unique=True, blank=True, null=True)
    clothing_size = models.ForeignKey('ClothingSizes', models.DO_NOTHING, db_column='clothing_size', blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    head_to_foot_weight = models.FloatField(blank=True, null=True)
    bust_weight = models.FloatField(blank=True, null=True)
    waist_weight = models.FloatField(blank=True, null=True)
    hips_weight = models.FloatField(blank=True, null=True)
    neck_to_wrist_bent_weight = models.FloatField(blank=True, null=True)
    inside_neck_to_waist_weight = models.FloatField(blank=True, null=True)
    waist_to_ankle_weight = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clothing'

    def __str__(self):
        return "{}--{}--{}--{}--{}".format(self.clothing_id,
                                           self.family_id,
                                           self.avatar_id,
                                           self.clothing_size,
                                           self.description)


class ClothingAvatar(models.Model):
    # avatar = models.ForeignKey(Clothing, models.DO_NOTHING, primary_key=True)
    avatar_id = models.IntegerField(primary_key=True)
    head_to_foot = models.FloatField(blank=True, null=True)
    bust = models.FloatField(blank=True, null=True)
    waist = models.FloatField(blank=True, null=True)
    hips = models.FloatField(blank=True, null=True)
    neck_to_wrist_bent = models.FloatField(blank=True, null=True)
    inside_neck_to_waist = models.FloatField(blank=True, null=True)
    waist_to_ankle = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clothing_avatar'

    def __str__(self):
        return '{}__{}__{}__{}__{}__{}__{}__{}'.format(self.avatar_id,
                                                       self.head_to_foot,
                                                       self.bust,
                                                       self.waist,
                                                       self.hips,
                                                       self.neck_to_wrist_bent,
                                                       self.inside_neck_to_waist,
                                                       self.waist_to_ankle)


class ClothingFamily(models.Model):
    family_id = models.AutoField(primary_key=True)
    description = models.TextField(blank=True, null=True)
    manufacturer = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clothing_family'


class ClothingSizes(models.Model):
    size_id = models.AutoField(primary_key=True)
    size_desc = models.CharField(max_length=10)

    class Meta:
        managed = False
        db_table = 'clothing_sizes'

    def __str__(self):
        return "{}--{}".format(self.size_id, self.size_desc)


class Person(models.Model):
    person_id = models.AutoField(primary_key=True)
    avatar_id = models.IntegerField(unique=True, blank=True, null=True)
    name = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'person'

    def __str__(self):
        return "{}--{}--{}".format(self.person_id, self.avatar_id, self.name)


class PersonAvatar(models.Model):
    # avatar = models.ForeignKey(Person, models.DO_NOTHING, primary_key=True)
    avatar_id = models.IntegerField(primary_key=True)
    head_to_foot = models.FloatField(blank=True, null=True)
    bust = models.FloatField(blank=True, null=True)
    waist = models.FloatField(blank=True, null=True)
    hips = models.FloatField(blank=True, null=True)
    neck_to_wrist_bent = models.FloatField(blank=True, null=True)
    inside_neck_to_waist = models.FloatField(blank=True, null=True)
    waist_to_ankle = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'person_avatar'

    def __str__(self):
        return "{}--{}--{}--{}--{}--{}--{}--{}".format(self.avatar_id,
                                                       self.head_to_foot,
                                                       self.bust,
                                                       self.waist,
                                                       self.hips,
                                                       self.neck_to_wrist_bent,
                                                       self.inside_neck_to_waist,
                                                       self.waist_to_ankle)
