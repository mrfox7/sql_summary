
-- select t1.*,t2."OBJECTID_2" as work_czqid 
-- into xiechen."homework_czq_zcq2"
-- from (
-- SELECT a1.*,a2."OBJECTID_2" as home_czqid FROM "xiechen"."homework_sum" as a1 LEFT OUTER JOIN xiechen."lacci2011_czq_zcq" as a2
-- on cast(a1.homelacci as NUMERIC)=cast( a2.lacci as NUMERIC)) as t1 LEFT OUTER JOIN xiechen."lacci2011_czq_zcq" as t2
-- on cast(t1.worklacci as NUMERIC)=cast(t2.lacci as NUMERIC)
-- select * 
-- into homework_czq_zcq_both3
-- from homework_czq_zcq2
-- where home_czqid is not null and work_czqid is not null
--剔除错误基站
-- select * into homework_czq_zcq_both4
-- from homework_czq_zcq_both3
-- where homelacci not in (select lacci from lacci_2011_bug2)
-- and worklacci not in (select lacci from lacci_2011_bug2)
-- ---合并城镇
-- select home_czqid,work_czqid,sum("count")
-- into homework_czq_zcq_both_result2
--  from homework_czq_zcq_both4
-- GROUP BY home_czqid,work_czqid

select t1.* from homework_czq_zcq_both_result2 as t1  JOIN(
SELECT "home_czqid",max(cast("sum" as NUMERIC)) as m1 FROM "2011czq"."homework_czq_zcq_both_result2" where "home_czqid"<>"work_czqid"
GROUP BY "home_czqid") as t2 on t1."home_czqid"=t2."home_czqid" and cast(t1."sum" as NUMERIC)=t2.m1