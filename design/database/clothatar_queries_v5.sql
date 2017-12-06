--give absolute comparison between two avatars
-- p - t_person
-- c - t_clothing

select

pers.*,
(t_person.head_to_foot-t_clothing.head_to_foot) as head_to_foot,
(t_person.bust-t_clothing.bust) as bust,
(t_person.waist-t_clothing.waist) as waist,
(t_person.hips-t_clothing.hips) as hips,
(t_person.neck_to_wrist_bent-t_clothing.neck_to_wrist_bent) as neck_to_wrist_bent,
(t_person.inside_neck_to_waist-t_clothing.inside_neck_to_waist)as inside_neck_to_waist,
(t_person.waist_to_ankle-t_clothing.waist_to_ankle) as waist_to_ankle

from person_avatar as t_person , clothing_avatar as t_clothing , person as pers

where t_person.avatar_id = 16 and t_clothing.avatar_id = 2 and pers.avatar_id = 16;


--give overall percentage difference between two avatars

select

(
pdiff(a.head_to_foot,b.head_to_foot)+
pdiff(a.bust,b.bust)+
pdiff(a.waist,b.waist)+
pdiff(a.hips,b.hips)+
pdiff(a.neck_to_wrist_bent,b.neck_to_wrist_bent)+
pdiff(a.inside_neck_to_waist,b.inside_neck_to_waist)+
pdiff(a.waist_to_ankle,b.waist_to_ankle))/7.0 as overall_match

from person_avatar as a , clothing_avatar as b

where a.avatar_id = 16 and b.avatar_id = 13;