-- 修正基站
-- select a1.* 
-- into 落在主城的基站
-- from 落在主城的基站未修正 as a1 left outer join lacci_bug_up as a2
-- on cast(a1.lacci as int8)=cast(a2.lacci as int8)
-- where a2.lacci is null
--生成新城home表格
-- select a1.* ,a2.name as home_name
-- into xiechen.homein_xincheng
-- from "public".homework2011_50_3 as a1 join 落在主城的基站 as a2
-- on cast(a1.homelacci as int8)=cast(a2.lacci as int8)
--剔除work在错误基站的
-- select a1.* 
-- into homein_xincheng2
-- from homein_xincheng2 as a1 
-- where cast(a1.worklacci as int8) not in (select cast(lacci as int8) from lacci_xincheng_bug )


--生成新城work 表格
-- select a1.* ,a2.name as home_name
-- into xiechen.workin_xincheng
-- from "public".homework2011_50_3 as a1 join 落在主城的基站 as a2
-- on cast(a1.worklacci as int8)=cast(a2.lacci as int8)
--剔除home在错误基站的
-- select a1.* 
-- into workin_xincheng2
-- from workin_xincheng as a1 
-- where cast(a1.homelacci as int8) not in (select cast(lacci as int8) from lacci_xincheng_bug )

-- --计算2011年平均通勤距离
-- select home_name,avg(dis_hw) from homein_xincheng2
-- where dis_hw<>0
-- group by home_name

-- --计算排除职住同地的人数
-- SELECT home_name,count(*) as 总人数 FROM "xiechen".homein_xincheng2
-- where dis_hw<>0
-- GROUP BY home_name
-- ORDER BY home_name;
--计算工作与居住在同一新城的人数
-- select a1.home_name,count(*)  FROM "xiechen".homein_xincheng2 as a1 join 落在主城的基站 as a2
-- on cast(a1.worklacci as int8)=a2.lacci
-- where dis_hw>0 and a1.home_name=a2.name
-- GROUP BY a1.home_name

select a1.work_name,count(*)  FROM "xiechen".workin_xincheng2 as a1 join 落在主城的基站 as a2
on cast(a1.homelacci as int8)=a2.lacci
where dis_hw>0 and a1.work_name=a2.name
GROUP BY a1.work_name
--计算不在本城工作的人
-- select a1.home_name,count(*) from homein_xincheng2  as a1 LEFT OUTER JOIN  落在主城的基站 as a2
-- on cast(a1.worklacci as int8)=a2.lacci
-- where (a2.name is null or a1.home_name<>a2.name) and a1.dis_hw<>0
-- GROUP BY a1.home_name
--计算外来就业的人
-- select a1.work_name,count(*) from workin_xincheng2  as a1 LEFT OUTER JOIN 落在主城的基站 as a2 on cast(a1.homelacci as int8)=a2.lacci
-- where (a1.work_name<>a2.name or a2.name is null) and dis_hw<>0
-- GROUP BY a1.work_name
--计算work在新城，排除职住同地总人数
-- SELECT work_name,count(*) FROM "xiechen".workin_xincheng2
-- where dis_hw<>0
-- GROUP BY work_name

--计算来源等表格
--计算work在中心城区的人
-- select a1.home_name,count(*)  FROM "xiechen".homein_xincheng2 as a1 join 落在主城的基站 as a2
-- on cast(a1.worklacci as int8)=a2.lacci
-- where dis_hw>0 and a2.name='中心城'
-- GROUP BY a1.home_name
--计算home在中心城的
-- select a1.work_name,count(*) from workin_xincheng2  as a1 LEFT OUTER JOIN 落在主城的基站 as a2 on cast(a1.homelacci as int8)=a2.lacci
-- where a2.name ='中心城' and a1.dis_hw<>0
-- GROUP BY a1.work_name















