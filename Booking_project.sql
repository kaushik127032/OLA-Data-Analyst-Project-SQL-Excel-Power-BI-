create database ola;
use ola;
select * from `booking2-july`;
ALTER TABLE  `booking2-july`
RENAME TO booking ;
select * from booking;
create view successful_booking as
select * from booking where booking_status='success';
select * from successful_booking;
create view ride_distance as
select vehicle_type, avg(ride_distance)
as avg_distance from booking group by vehicle_type;

select * from ride_distance;
create view cancel_ride_by_customer as
select count(*) from booking 
where booking_status="canceled by customer";
create view  top_5_cust as
select customer_id , count(booking_id) as total_rides
from booking
group by customer_id
order by total_rides desc limit 5;

create view ride_canc_by_driver as
select count(*) from booking 
where canceled_rides_by_driver='personal & car related issue';
create view max_min_rating_prime_sedan as
select max(driver_ratings) as max_rating, 
min(driver_ratings) as min_rating
from booking where vehicle_type ='prime sedan';

create view upi_payment as
select * from booking where payment_method ='upi';
create view avg_cust_rating as 
select vehicle_type , avg(customer_rating) as avg_rating
from booking
group by vehicle_type;
create view total_successfulride_value as
select sum(booking_value) as total_successfulride_value
from booking
where booking_status='success';

create view incomplete_rides_reason as
select booking_id , incomplete_rides_reason
from booking
where incomplete_rides='yes';


