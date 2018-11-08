SELECT msid,time_f,time_t,delta_time,lac FROM "xiechen"."stay_15"
where cast(time_f as text) like '20170813%' and home_lac is null and work_lac is null