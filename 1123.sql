select * from (
SELECT *,row_number() over(partition by home_czq order by minutes desc) as r111 FROM "wupu_re2_v3" 
--where home_czq<>'1' and rec_czq<>'1'
)as t1 where r111=1

select rec_czq,sum(sumnum) from wupu_re 
--where home_czq=rec_czq
group by rec_czq