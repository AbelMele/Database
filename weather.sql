//weather

create table weather (
temp_id  int primary key,
record_Date date,
temperature int		
);

Insert Into weather (temp_id, record_Date,temperature) Values 
(1, '2023-06-28', 86),
(2, '2023-06-27', 70),
(3, '2023-06-26', 89),
(4, '2023-06-25', 87);
UPDATE weather set temperature=10 where temp_id=1;

select w1.temp_id As id
from weather w1
JOIN
 weather w2 ON  w1.record_Date = w2.record_Date + Interval '1 DAY'
WHERE
w1.temperature > w2.temperature
order by
w1.temp_id; 

select * from weather;