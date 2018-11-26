---------计算home-->游憩
select home_czq,rec_czq,sum(sumnum) as sumnum,sum(sumtime) as sumtimeinto liupu_re

from (
select m1.*,m2."OBJECTID_2" as rec_czq from (
select t1.*,t2."OBJECTID_2" as home_czq from public.recreation_sum2 as t1 inner join lacci_6普 as t2 on t1.homelacci=cast( t2.lacci as numeric)
where numrank<10 or timerank<10
) as m1 inner join lacci_6普 as m2 on m1.lacci=m2.lacci) as tt
group by home_czq,rec_czq
-----------最终得到游憩的home-rec的坐标,第一优势流
with tmp1 as (
select * from (
select *,ROW_NUMBER() over(partition by home_czq order by sumnum desc)  as r1 from wupu_re where home_czq<>rec_czq) as t1
where r1=1 order by home_czq),
temp2 as (
select t1.*,t2.x as homex,t2.y as homey
--into xiechen.temp2
from tmp1 as t1 left outer join liupu匹配 as t2 on t1.home_czq=t2.ORIG_FID)

select t1.*,t2.x as recx,t2.y as recy 
--into liupu_firstflow
from temp2 as t1 left outer join liupu匹配 as t2 on t1.rec_czq=t2.ORIG_FID
order by home_czq

-------------------------------------------------------------------------
with tmp1 as (
select * from (
select *,ROW_NUMBER() over(partition by home_czq order by sumnum desc)  as numr1,ROW_NUMBER() over (partition by home_czq order by sumtime desc) as timer2 from wupu_re_v3 where home_czq<>rec_czq) as t1
where home_czq<>rec_czq
),

temp2 as (
select t1.*,t2.x as homex,t2.y as homey
from tmp1 as t1 left outer join wupu匹配 as t2 on t1.home_czq=t2.code)

select t1.*,t2.x as recx,t2.y as recy 
into wupu_re2_v3
from temp2 as t1 left outer join wupu匹配 as t2 on t1.rec_czq=t2."code"
order by home_czq
