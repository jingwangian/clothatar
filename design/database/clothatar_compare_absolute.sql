--give absolute comparison between two avatars
-- p - person
-- c - clothing

select

(person.head_to_foot-clothing.head_to_foot) as head_to_foot,
(person.bust-clothing.bust) as bust,
(person.waist-clothing.waist) as waist,
(person.hips-clothing.hips) as hips,
(person.neck_to_wrist_bent-clothing.neck_to_wrist_bent) as neck_to_wrist_bent,
(person.inside_neck_to_waist-clothing.inside_neck_to_waist)as inside_neck_to_waist,
(person.waist_to_ankle-clothing.waist_to_ankle) as waist_to_ankle

from person_avatar as person , clothing_avatar as clothing

where person.avatar_id = 1 and clothing.avatar_id = 2;


