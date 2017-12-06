create table person_avatar (

avatar_id serial primary key,
head_to_foot real default null,
bust real default null,
waist real default null,
hips real default null,
neck_to_wrist_bent real default null,
inside_neck_to_waist real default null,
waist_to_ankle real default null

);

create table clothing_avatar (

avatar_id serial primary key,
head_to_foot real default null,
bust real default null,
waist real default null,
hips real default null,
neck_to_wrist_bent real default null,
inside_neck_to_waist real default null,
waist_to_ankle real default null

);

create type avatar_data as (
head_to_foot real ,
bust real ,
waist real ,
hips real ,
neck_to_wrist_bent real ,
inside_neck_to_waist real ,
waist_to_ankle real

);

create table clothing (

clothing_id serial primary key,
avatar_id int references clothing_avatar(avatar_id),
garment_type text,
description text,
manufacturer text,
head_to_foot_weight real ,
bust_weight  real ,
waist_weight  real ,
hips_weight  real ,
neck_to_wrist_bent_weight  real ,
inside_neck_to_waist_weight  real ,
waist_to_ankle_weight  real

);

create table person (

person_id serial primary key,
avatar_id int references person_avatar(avatar_id),
name text

);

--give absolute comparison between two avatars
-- p - person
-- c - clothing

select

(person.head_to_foot-clothing.head_to_foot),
(person.bust-clothing.bust),
(person.waist-clothing.waist),
(person.hips-clothing.hips),
(person.neck_to_wrist_bent-clothing.neck_to_wrist_bent),
(person.inside_neck_to_waist-clothing.inside_neck_to_waist),
(person.waist_to_ankle-clothing.waist_to_ankle)

from person_avatar as person , clothing_avatar as clothing

where person.avatar_id = 1 and clothing.avatar_id = 1;


insert into person_avatar
(
head_to_foot,
bust,
waist,
hips,
neck_to_wrist_bent,
inside_neck_to_waist,
waist_to_ankle)
values ( 189 , 45.4 , 85.4 , 92.1 , 75 , 70 , 81.2 );

insert into clothing_avatar
(
head_to_foot,
bust,
waist,
hips,
neck_to_wrist_bent,
inside_neck_to_waist,
waist_to_ankle)
values ( 179 , 75.4 , 66.2 , 92.1 , 75 , 92 , 83.7 );


create or replace function pdiff (v1 real , v2 real)  returns real as $$

DECLARE
        difference real;
BEGIN
        difference := (( @ v1 - v2) / ((v1+v2)/2.0 )) * 100.0;
        return difference;
END

$$ language plpgsql;

select

(pdiff(a.head_to_foot,b.head_to_foot)+
pdiff(a.bust,b.bust)+
pdiff(a.waist,b.waist)+
pdiff(a.hips,b.hips)+
pdiff(a.neck_to_wrist_bent,b.neck_to_wrist_bent)+
pdiff(a.inside_neck_to_waist,b.inside_neck_to_waist)+
pdiff(a.waist_to_ankle,b.waist_to_ankle))/7.0

from person_avatar as a , clothing_avatar as b

where a.avatar_id = 1 and b.avatar_id = 1;