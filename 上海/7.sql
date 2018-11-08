-- select m1.*,m2.lat as lat_work,m2.lon as lon_work ,
-- round((2*asin(sqrt(power(sin((m1.lon_home::NUMERIC*PI()/180-cast(m2.lon as numeric)*PI()/180)/2),2)*cos(cast(m2.lat as NUMERIC)*PI()/180)*cos(cast(m1.lat_home as NUMERIC)*PI()/180)+power(sin((cast(m1.lat_home as numeric)*PI()/180-cast(m2.lat as NUMERIC)*PI()/180)/2),2)))*6378173*10000)::NUMERIC,12)/10000 as dis
-- into xiechen.homework_dis
-- from (
-- select t1.*,t2.lat as lat_home,t2.lon as lon_home from (
-- SELECT *  FROM "public"."homework_grid"
-- where grid_work<>'' and grid_home<>'' and grid_home<>grid_work) as t1 LEFT OUTER JOIN "public".grid_gps as t2
-- on t1.grid_home=t2.grid)as m1 left outer join "public".grid_gps as m2 on m1.grid_work=m2.grid

--select avg(dis) from xiechen.homework_dis
-- select t1.*,t2.lat,t2.lon
-- into work_hz
--  from (
-- select grid_work ,count(*) from "public"."homework_grid"
-- GROUP BY grid_work) as t1 LEFT OUTER JOIN "public".grid_gps as t2 on t1.grid_work=t2.grid
-- 
-- SELECT "OBJECTID_1","REFNAME",sum(count_*avg_)/sum(count_) as dis 
-- into comm_jd
-- FROM "xiechen"."17newtemp1"
-- where "OBJECTID_1" is not null
-- group by "OBJECTID_1","REFNAME"
-- select t1.*,t2.lat,t2.lon 
-- into zhizhutongdi
-- from(
-- select grid_home,count(*) from "public"."homework_grid"
-- where grid_home=grid_work and grid_home<>''
-- group by grid_home) as t1 LEFT OUTER JOIN grid_gps as t2 on t1.grid_home=t2.grid

-- select t1.*,t2.lon,t2.lat 
-- into homework
-- from(
-- select grid_home,count(*) from "public"."homework_grid" where grid_home<>'' and grid_work<>''
-- group by grid_home) as t1 LEFT OUTER JOIN grid_gps as t2 on t1.grid_home=t2.grid
select m1.home_z,m1.home_6,m2."JD_ID" as work_z,m2."六普街道编号" as work6,sum(m1.c1) 
into xiechen.homework_z2
from (
select t1.*,t2."JD_ID" as home_z,t2."名称" as home_name,t2."六普街道编号" as home_6 from 
(select grid_home,grid_work,count(*) as c1 from homework_grid where grid_work<>''
group by grid_home,grid_work) as t1 LEFT OUTER JOIN xiechen.home_point_jd_2 as t2
on t1.grid_home=t2.grid_home) as m1 LEFT OUTER JOIN xiechen.work_point_jd_2 as m2
on m1.grid_work=m2.grid_work
group by m1.home_z,m1.home_6,m2."JD_ID",m2."六普街道编号"



-- SELECT t1.*,t2."六普街道编号" 
-- --into "xiechen"."work_point_jd_2"
-- FROM "xiechen"."work_point_jd" as t1 LEFT OUTER JOIN xiechen."城镇圈_ID" as t2
-- where "JD_ID" is not null
-- on t1."JD_ID"=t2."六普街道编号"
-- delete FROM "xiechen"."homework_z2"
-- where home_z is null or work_z is null
-- update "xiechen"."homework_z2"
-- set work6='0'
-- where work6 is null



