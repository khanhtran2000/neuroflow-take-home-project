-- MySQL
-- Q1.
select CONCAT(extract(month from u.created_at), ',', extract(year from u.created_at)) as date_time, count(user_completed_id) / count(u.user_id) as completion_rate
from (select u.user_id as user_completed_id, u.created_at 
		from users u join exercises e on u.user_id = e.user_id
		where extract(day from timediff(e.exercise_completion_date, u.created_at)) <= 30) a
group by date_time;


-- Q2.
select count(nums_exer) as "Number of activities", total.nums_user as "Number of users" from (
  select count(distinct(exercise_id)) as nums_exer, count(user_id) as nums_user 
  from exercise_2
  group by user_id
) as total 
group by total.nums_user;


-- Q3.
select distinct(provider_id), avg(score) 
from Phq9 
order by avg(score) desc limit 5;
