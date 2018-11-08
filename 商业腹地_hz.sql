-- select m1.*,m2.s1,(cast(cast(m1.c1 as float)/cast(m2.s1 as float)  as float)) as ratio 
-- into 商业腹地
-- from 
-- (
-- select t1."单元编号",t2."商业_ID",count(cast(t1."Sum" as int)) as c1 
-- from (
-- SELECT a1."Playplace_ID",a1."Sum",a2."单元编号" FROM "public"."recreation" as a1 join xiechen.落在单元上的基站 as a2
-- on cast(a1."Homeplace_ID" as int8)=a2."TARGET_FID") as t1
-- join xiechen.落在商业中心上的基站 as t2
-- on cast(t1."Playplace_ID" as int8)=t2."TARGET_FID"
-- group by t1."单元编号",t2."商业_ID")
-- as m1 join
-- --select * from recreation where "Homeplace_ID"='0' or "Playplace_ID"='0'
-- (select t1."单元编号",count(cast(t1."Sum" as int)) as s1 
-- from (
-- SELECT a1."Playplace_ID",a1."Sum",a2."单元编号" FROM "public"."recreation" as a1 join xiechen.落在单元上的基站 as a2
-- on cast(a1."Homeplace_ID" as int8)=a2."TARGET_FID") as t1
-- join xiechen.落在商业中心上的基站 as t2
-- on cast(t1."Playplace_ID" as int8)=t2."TARGET_FID"
-- group by t1."单元编号") as m2
-- on m1."单元编号"=m2."单元编号"
-- order by m1."单元编号",(cast(cast(m1.c1 as float)/cast(m2.s1 as float)  as float)) desc
-- --group by m1."单元编号",m1."商业_ID"
-- 
-- --where cast( cast(m1.c1 as float)/cast(m2.s1 as float)  as float)>0.5
select a1.* from xiechen.商业腹地 as a1 join 
(
select "单元编号",max(ratio) as max1 from xiechen.商业腹地
group by "单元编号") as a2 on a1."单元编号"=a2."单元编号" 
where a1.ratio=a2.max1
ORDER BY a1."单元编号"
--select distinct "单元编号" from xiechen.商业腹地
