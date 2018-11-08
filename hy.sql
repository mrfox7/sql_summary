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
select msid,count(*) as hy_day 
into hy_day
from temp2 where sum_time> interval '2 hour'
GROUP BY msid