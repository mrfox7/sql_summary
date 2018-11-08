with temp1 as(
SELECT *,"row_number"() over(ORDER BY lacci) as r1 FROM "xiechen"."lacci_2011"),
temp2 as (select t1.*,t2.lacci as lacci2,t2.lon as lon2,t2.lat as lat2 ,t2."名称" as "名称2",t2."代码" as "代码2",t2.r1 as r2 from temp1 as t1 LEFT OUTER JOIN temp1 as t2 on t1.r1=t2.r1+1),
temp3 as (select * ,
( 2*asin( sqrt(power(sin((cast(lon as numeric)*PI()/180-cast(lon2 as numeric)*PI()/180)/2),2)*cos(cast(lat2 as numeric)*PI()/180)*cos(cast(lat as numeric)*PI()/180)+power(sin((cast(lat as numeric)*PI()/180-cast(lat2 as numeric)*PI()/180)/2),2)))*6378173)as dis
from temp2)
select * 
into xiechen.lacci_bug2
from temp3 
