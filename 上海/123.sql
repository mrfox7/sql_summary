-- select t1.work_name,sum(t1.c1) from(
-- select a2."name" as home_name,a1."work_name" as work_name,count(a1.*) as c1 from xincheng_homeworklast2 as a1 join 落在主城的基站 as a2
-- on cast(a1.homelacci as int8) =a2.lacci
-- GROUP BY a2."name",a1."work_name" 
-- ) as t1
-- where t1.home_name=t1.work_name
-- group by t1.work_name
select "work_name",count(*) from xincheng_homeworklast2 
GROUP BY "work_name"
-- select a1.*,a2."name" as work_name
-- into xiechen.xincheng_homeworklast2
-- from "public".homework2011_50_3 as a1 join 落在主城的基站 as a2 
-- on  cast(a1.worklacci as int8)=a2.lacci
-- where a2."name"<>'中心城'
