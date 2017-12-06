--create sizes

--insert into clothing_sizes (size_desc) values ('S');
--insert into clothing_sizes (size_desc) values ('M');
--insert into clothing_sizes (size_desc) values ('L');
--insert into clothing_sizes (size_desc) values ('XL');
--insert into clothing_sizes (size_desc) values ('XXL');

insert into clothing_sizes (size_desc) values ('AU 6');
insert into clothing_sizes (size_desc) values ('AU 8');
insert into clothing_sizes (size_desc) values ('AU 10');
insert into clothing_sizes (size_desc) values ('AU 12');
insert into clothing_sizes (size_desc) values ('AU 14');

--create a clothing family
insert into clothing_family (description,manufacturer) values ('Elise Ruffle Wrap Dress', 'atmos & here');
insert into clothing_family (description,manufacturer) values ('Palm Springs Drape Dress', 'Cooper St');
insert into clothing_family (description,manufacturer) values ('Monet Dress', 'Fresh Soul');
insert into clothing_family (description,manufacturer) values ('Oslo Dress', 'Faithful');

--create articles of clothing
insert into clothing (family_id, clothing_size, description) values ( 1 , 1 , 'Elise Ruffle Wrap Dress atmos & here AU 6');
insert into clothing (family_id, clothing_size, description) values ( 1 , 2 , 'Elise Ruffle Wrap Dress atmos & here AU 8');
insert into clothing (family_id, clothing_size, description) values ( 1 , 3 , 'Elise Ruffle Wrap Dress atmos & here AU 10');
insert into clothing (family_id, clothing_size, description) values ( 1 , 4 , 'Elise Ruffle Wrap Dress atmos & here AU 12');
insert into clothing (family_id, clothing_size, description) values ( 1 , 5 , 'Elise Ruffle Wrap Dress atmos & here AU 14');

insert into clothing (family_id, clothing_size, description) values ( 2 , 1 , 'Palm Springs Drape Dress Cooper St AU 6');
insert into clothing (family_id, clothing_size, description) values ( 2 , 2 , 'Palm Springs Drape Dress Cooper St AU 8');
insert into clothing (family_id, clothing_size, description) values ( 2 , 3 , 'Palm Springs Drape Dress Cooper St AU 10');
insert into clothing (family_id, clothing_size, description) values ( 2 , 4 , 'Palm Springs Drape Dress Cooper St AU 12');
insert into clothing (family_id, clothing_size, description) values ( 2 , 5 , 'Palm Springs Drape Dress Cooper St AU 14');

insert into clothing (family_id, clothing_size, description) values ( 3 , 1 , 'Monet Dress Fresh Soul AU 6');
insert into clothing (family_id, clothing_size, description) values ( 3 , 2 , 'Monet Dress Fresh Soul AU 8');
insert into clothing (family_id, clothing_size, description) values ( 3 , 3 , 'Monet Dress Fresh Soul AU 10');
insert into clothing (family_id, clothing_size, description) values ( 3 , 4 , 'Monet Dress Fresh Soul AU 12');
insert into clothing (family_id, clothing_size, description) values ( 3 , 5 , 'Monet Dress Fresh Soul AU 14');

--create clothing_avatar
--insert into clothing_avatar
--(
--head_to_foot,
--bust,
--waist,
--hips,
--neck_to_wrist_bent,
--inside_neck_to_waist,
--waist_to_ankle)
--values ( 179 , 75.4 , 66.2 , 92.1 , 75 , 92 , 83.7 );

--create clothing_avatar
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 1 , 79  , 61  , 89 );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 2 , 84 , 66 , 94 );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 3 , 89 , 79  ,99  );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 4 , 94 , 76 , 104 );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 5 , 99 , 89 , 109 );

insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 6 , 82.5 , 65.5  , 91.5 );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 7 , 85 , 68 , 94 );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 8 , 90 , 73 , 99 );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 9 , 95 , 78 ,104  );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 10 , 100 , 83 , 109 );

insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 11 , 81.5 , 61 , 66 );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 12 , 86.5 , 66 , 91.5 );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 13 , 91.5 , 71 , 96.5 );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 14 , 96.5 , 76 , 101.5 );
insert into clothing_avatar ( avatar_id, bust, waist, hips ) values ( 15 , 101.5 , 81 , 106.5 );



--create person
insert into person ( name ) values ('Jo ThePerson');
--create person_avatar


insert into person_avatar
(
avatar_id,
head_to_foot,
bust,
waist,
hips,
neck_to_wrist_bent,
inside_neck_to_waist,
waist_to_ankle)
values ( 16, 171  , 91 , 73  , 98.5 , 77  , 45 , 104 );