
with temp1 as (
select *,lac||ci as homelacci ,ROW_NUMBER() over(PARTITION by msid order by staytime desc) as r1 from sh_home_2011_50)
select * 
into sh_home_2011_50_1
from temp1 where r1=1

select count(distinct msid) from sh_hom_2011_50_1

with temp1 as (
select *,lac||ci as worklacci ,ROW_NUMBER() over(PARTITION by msid order by staytime desc) as wr1 from sh_work_2011_50)
select * 
into sh_work_2011_50_1
from temp1 where wr1=1

select coalesce(t1.msid,t2.msid),t1.homelacci,t2.worklacci  
into sh_hw_2011_temp
from sh_home_2011_50_1 as t1 full outer join sh_work_2011_50_1 as t2 on t1.msid=t2.msid

select count(distinct msid) from hy_day
select  count(*) from sh_hw_2011_temp where homelacci is not null and worklacci is not null
select count(distinct msid) from recreation_16_4
select count(distinct msid) from xiechen.stay16