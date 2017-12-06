create sequence avatar_id_seq;                                                                                                   
                                                                                                                                 
create type avatar_data as (                                                                                                     
head_to_foot real ,                                                                                                              
bust real ,                                                                                                                      
waist real ,                                                                                                                     
hips real ,                                                                                                                      
neck_to_wrist_bent real ,                                                                                                        
inside_neck_to_waist real ,                                                                                                      
waist_to_ankle real                                                                                                              
                                                                                                                                 
);                                                                                                                               
                                                                                                                                 
create table clothing_sizes (                                                                                                    
size_id serial primary key,                                                                                                      
size_desc varchar(10) not null                                                                                                   
);                                                                                                                               
                                                                                                                                 
create table clothing_family (                                                                                                   
                                                                                                                                 
family_id serial primary key,                                                                                                    
description text,                                                                                                                
manufacturer text                                                                                                                
                                                                                                                                 
);                                                                                                                               
                                                                                                                                 
                                                                                                                                 
create table clothing (                                                                                                          
                                                                                                                                 
clothing_id serial primary key,                                                                                                  
family_id int references clothing_family(family_id),                                                                             
avatar_id int default nextval('avatar_id_seq'::regclass) unique,                                                                 
clothing_size int references clothing_sizes(size_id),                                                                            
description text,                                                                                                                
head_to_foot_weight real,                                                                                                        
bust_weight  real,                                                                                                               
waist_weight  real,                                                                                                              
hips_weight  real,                                                                                                               
neck_to_wrist_bent_weight  real,                                                                                                 
inside_neck_to_waist_weight  real,                                                                                               
waist_to_ankle_weight  real                                                                                                      
                                                                                                                                 
);                                                                                                                               
                                                                                                                                 
create table person (                                                                                                            
                                                                                                                                 
person_id serial primary key,                                                                                                    
avatar_id int default nextval('avatar_id_seq'::regclass) unique,                                                                 
name text                                                                                                                        
                                                                                                                                 
);                                                                                                                               
                                                                                                                                 
create table person_avatar (                                                                                                     
                                                                                                                                 
avatar_id int primary key references person(avatar_id),                                                                          
head_to_foot real default null,                                                                                                  
bust real default null,                                                                                                          
waist real default null,                                                                                                         
hips real default null,                                                                                                          
neck_to_wrist_bent real default null,                                                                                            
inside_neck_to_waist real default null,                                                                                          
waist_to_ankle real default null                                                                                                 
                                                                                                                                 
);                                                                                                                               
                                                                                                                                 
create table clothing_avatar (                                                                                                   
                                                                                                                                 
avatar_id int primary key references clothing(avatar_id),                                                                        
head_to_foot real default null,                                                                                                  
bust real default null,                                                                                                          
waist real default null,                                                                                                         
hips real default null,                                                                                                          
neck_to_wrist_bent real default null,                                                                                            
inside_neck_to_waist real default null,                                                                                          
waist_to_ankle real default null                                                                                                 
                                                                                                                                 
);                                                                                                                               
                                                                                                                                 
                                                                                                                                 
                                                                                                                                 
create or replace function pdiff (v1 real , v2 real)  returns real as $$                                                         
                                                                                                                                 
DECLARE                                                                                                                          
        difference real;                                                                                                         
BEGIN                                                                                                                            
        if v1 is null or v2 is null                                                                                              
        then                                                                                                                     
                difference := 0.0;                                                                                               
        else                                                                                                                     
                difference := (( @ v1 - v2) / ((v1+v2)/2.0 )) * 100.0;                                                           
        end if;                                                                                                                  
                                                                                                                                 
        return difference;                                                                                                       
END                                                                                                                              
                                                                                                                                 
$$ language plpgsql;                                                                                                             