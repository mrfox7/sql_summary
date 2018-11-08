--活跃人数Table1
with temp1 as (
select *,(to_timestamp(cast(timestamp_t as text) ,'YYYYMMDDHH24miss')-to_timestamp(cast(timestamp_f as text) ,'YYYYMMDDHH24miss')) as delta_time,lac || ci as lacci
from stay_16
where 
(extract(hour from to_timestamp(cast(timestamp_f as text) ,'YYYYMMDDHH24miss'))>=5 or extract(hour from to_timestamp(cast(timestamp_f as text) ,'YYYYMMDDHH24miss'))<=23) 
and (extract(hour from to_timestamp(cast(timestamp_t as text) ,'YYYYMMDDHH24miss'))>=5 or extract(hour from to_timestamp(cast(timestamp_t as text) ,'YYYYMMDDHH24miss'))<=23) 
),
temp2 as (
select msid, extract(day from to_timestamp(cast(timestamp_f as text) ,'YYYYMMDDHH24miss')) as "date",sum(delta_time) as sum_time  from temp1 
group by msid,extract(day from to_timestamp(cast(timestamp_f as text) ,'YYYYMMDDHH24miss'))
order by msid
)
select msid,count("date") as hy_day 
into hy_day
from temp2 where sum_time> interval '2 hour'
GROUP BY msid
 
 --筛选时间段数据
 with temp1 as  (
select *,(to_timestamp(cast(timestamp_t as text) ,'YYYYMMDDHH24miss')-to_timestamp(cast(timestamp_f as text) ,'YYYYMMDDHH24miss')) as delta_time,lac || ci as lacci
from stay_16
where (cast(timestamp_f as text) like '20111022%' or cast(timestamp_f as text) like '20111023%'
or cast(timestamp_f as text) like '20111029%' or cast(timestamp_f as text) like '20111030%')
and (extract(hour from to_timestamp(cast(timestamp_f as text) ,'YYYYMMDDHH24miss'))>=8 or extract(hour from to_timestamp(cast(timestamp_f as text) ,'YYYYMMDDHH24miss'))<=23) 
and (extract(hour from to_timestamp(cast(timestamp_t as text) ,'YYYYMMDDHH24miss'))>=8 or extract(hour from to_timestamp(cast(timestamp_t as text) ,'YYYYMMDDHH24miss'))<=23) 
) ,
temp2 as(
select msid,lacci,extract(day from to_timestamp(cast(timestamp_f as text) ,'YYYYMMDDHH24miss')) as date,sum(delta_time) as sum_time from temp1
group by lacci,msid,extract(day from to_timestamp(cast(timestamp_f as text) ,'YYYYMMDDHH24miss')))
,
temp3 as (
select * ,ROW_NUMBER() over(PARTITION by msid,"date" order by sum_time desc) as row1
from temp2),
temp9 as (
select temp3.*,t4.homelacci as homelacci,t4.worklacci as worklacci from temp3 left outer join sh_hw_2011_temp as t4 on temp3.msid=t4.msid
where row1<8),
temp6 as (
select * from temp9
where  (homelacci=null and worklacci=null)  or (lacci<>coalesce(homelacci,worklacci))
),
temp7 as (
select * ,row_number() over (partition by msid,"date" order by sum_time desc) as row2 from temp6)
select *into recreation_16_4
from temp7
 where row2<6 
order by msid,"date",row2;
select count(distinct msid) from recreation_16_4;

--select * from temp3-- order by msid,"date",sum_time desc
--order by msid,sum_time desc

--