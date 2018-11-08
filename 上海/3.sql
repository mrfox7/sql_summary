SELECT homelacci,worklacci,count(*) 
into "xiechen".homework_sum
FROM "public"."homework2011_50_3"
where dis_hw<>0
GROUP BY homelacci,worklacci