SELECT *,"row_number"() over(PARTITION by home_czqid ORDER BY cast("sum" as NUMERIC)) 
--into xiechen.homework_czq_zcq_both_result3
FROM "xiechen"."homework_czq_zcq_both_result2";