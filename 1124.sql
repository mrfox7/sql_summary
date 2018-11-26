--Step1 汇总32张游憩表
select *,row_number() over(partition by homelacci order by sumnum desc) as numrank,"row_number"() over(partition by homelacci order by sumtime desc ) as timerank 
into recreation_15min
from(
select lacci,homelacci,sum(num) as sumnum,sum(sum_time)as sumtime 
from (
select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_00
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_01
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_02
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_03
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_04
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_05
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_06
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_07
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_08
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_09
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_10
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_11
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_12
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_13
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_14
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_15
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_16
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_17
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_18
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_19
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_20
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_21
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_22
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_23
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_24
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_25
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_26
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_27
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_28
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_29
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_30
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci
union all

select lacci,homelacci,count(*) as num,sum(sum_time) as sum_time from 
recreation_31
where sum_time >interval '15 minute' and homelacci is not null
group by lacci,homelacci

)
as t1
group by lacci,homelacci) as t2
where cast(lacci as numeric)  in(select cast(lacci as numeric) from public.lacci_bug_sum1) and cast(homelacci as numeric)  in(select cast(lacci as numeric) from public.lacci_bug_sum1)

--step2 汇总得到基站到基站之间的数量
---计算home-->游憩
--五普
with temp1 as (
select *,date_part('day', sumtime) * 24 * 60 + date_part('hour',sumtime) * 60 + date_part('minute', sumtime) + date_part('second',sumtime)/60 as minutes 
--into wupu_re_v2
from (
select home_czq,rec_czq,sum(sumnum) as sumnum,sum(sumtime) as sumtime
from (
select m1.*,m2."code" as rec_czq from (
select t1.*,t2."code" as home_czq from recreation_15min as t1 inner join lacci_5普 as t2 on t1.homelacci=cast( t2.lacci as numeric)
--where numrank<10 or timerank<10
) as m1 inner join lacci_5普 as m2 on m1.lacci=m2.lacci) as tt
group by home_czq,rec_czq
) as tt2),
---匹配xy坐标点出图
 temp2 as (
select t1.*,t2.x as homex,t2.y as homey
from temp1 as t1 left outer join wupu匹配 as t2 on t1.home_czq=t2.code)
select t1.*,t2.x as recx,t2.y as recy 
into wupu_re2_v2
from temp2 as t1 left outer join wupu匹配 as t2 on t1.rec_czq=t2."code"
order by home_czq


--六普
with temp1 as(
select *,date_part('day', sumtime) * 24 * 60 + date_part('hour',sumtime) * 60 + date_part('minute', sumtime) + date_part('second',sumtime)/60 as minutes 
--into liupu_re_v2
from (
select home_czq,rec_czq,sum(sumnum) as sumnum,sum(sumtime) as sumtime
from (
select m1.*,m2."OBJECTID_2" as rec_czq from (
select t1.*,t2."OBJECTID_2" as home_czq from recreation_15min as t1 inner join lacci_6普 as t2 on t1.homelacci=cast( t2.lacci as numeric)
--where numrank<10 or timerank<10
) as m1 inner join lacci_6普 as m2 on m1.lacci=m2.lacci) as tt
group by home_czq,rec_czq
) as tt2),
 temp2 as (
select t1.*,t2.x as homex,t2.y as homey
from temp1 as t1 left outer join liupu匹配 as t2 on t1.home_czq=t2."ORIG_FID")
select t1.*,t2.x as recx,t2.y as recy 
into liupu_re2_v2
from temp2 as t1 left outer join liupu匹配 as t2 on t1.rec_czq=t2."ORIG_FID"
order by home_czq

--6普
with temp2 as (
select t1.*,t2.x as homex,t2.y as homey
from "liupu_re_v2" as t1 left outer join liupu匹配 as t2 on t1.home_czq=t2."ORIG_FID")
select t1.*,t2.x as recx,t2.y as recy 
into liupu_re2_v2
from temp2 as t1 left outer join liupu匹配 as t2 on t1.rec_czq=t2."ORIG_FID"
order by home_czq

--5普
with temp2 as (
select t1.*,t2.x as homex,t2.y as homey
from "wupu_re_v2" as t1 left outer join wupu匹配 as t2 on t1.home_czq=t2."code")
select t1.*,t2.x as recx,t2.y as recy 
into wupu_re2_v2
from temp2 as t1 left outer join wupu匹配 as t2 on t1.rec_czq=t2."code"
order by home_czq

---Step4 出结果数据
with temp1 as(
select * from (
SELECT *,row_number() over(partition by home_czq order by sumnum desc) as r111 FROM "liupu_re2_v2" 
where home_czq<>rec_czq
--where home_czq<>'1' and rec_czq<>'1'
)as t1 where r111<6),
temp2 as(
select temp1.*,t2."名称" as homejd from temp1 left outer join liupu匹配 as t2 on temp1.home_czq=t2."ORIG_FID"
),
temp3 as (
select temp2.*,t2."名称" as recjd from temp2 left outer join liupu匹配 as t2 on temp2.rec_czq=t2."ORIG_FID"
)
select * from temp3

set statement_timeout to 0;
show statement_timeout
show all

