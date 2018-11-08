SELECT t1."Playplace_ID",t1."sum",t2.lat,t2.lon 
into xiechen.recreation_density
FROM xiechen.recreation_hz as t1 join xiechen.laccell_zhen as t2 on 
t1."Playplace_ID"=t2."TARGET_FID"
-- select "Playplace_ID",Sum(cast("Sum" as int)) 
-- into xiechen.recreation_hz
-- from "public"."recreation" group by "Playplace_ID"