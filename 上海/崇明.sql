-- select t1.*,t2."OBJECTID_2" as work_czqid 
-- into xiechen."homework_cm"
-- from (
-- SELECT a1.*,a2."OBJECTID_2" as home_czqid FROM "xiechen"."homework_sum" as a1 LEFT OUTER JOIN xiechen."lacci_cm" as a2
-- on cast(a1.homelacci as NUMERIC)=cast( a2.lacci as NUMERIC)) as t1 LEFT OUTER JOIN xiechen."lacci_cm" as t2
-- on cast(t1.worklacci as NUMERIC)=cast(t2.lacci as NUMERIC)
select home_czqid,work_czqid,sum("count")
into homework_cm_both_result
 from homework_cm_both2
GROUP BY home_czqid,work_czqid