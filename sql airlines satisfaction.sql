-- downloaded the dataset from kaggle "airlines.csv"
-- then created the separate database named 'airlines'
-- that downloaded dataset was uploaded to sql

-- for creating database
 create database airlines ;
 
 -- for making that database as an default database
use airlines;

-- Pull all columns from airline_survey
select * from survey ;

-- Count total participants
select count(*) as no_of_participants from survey;

-- Survey participants placed into groups by gender
select gender,count(*) as number_of_participants from survey 
group by gender ;

-- Survey participants placed into groups by satisfaction
select satisfaction, count(*) as no_of_participants from survey
group by satisfaction ;

-- Survey participants placed into groups by Customer Type
select count(Customer_Type) as no_of_passengers, customer_type from survey
group by customer_type 
order by no_of_passengers desc ;

-- Average age based on Customer Type, rounded to nearest age
select customer_type , round(avg(age)) as avg_age from survey
group by Customer_Type
order by Customer_Type; 

-- Average age based on class, rounded to nearest age
select class,round(avg(age)) as average_age from survey
group by class
order by average_age;

-- Average age based on gender, rounded to nearest age
select gender , round(avg(age)) as average_age from survey
group by gender
order by average_age ;

-- Survey participants placed into groups by Class
select class,count(class) as no_of_participants from survey
group by class
order by no_of_participants;

-- satisfied participants by class
select class,count(class) as satisfied_passangers from survey
where satisfaction = "satisfied" 
group by class
order by satisfied_passangers;

-- Unsatisfied participants by class
select class,count(class) as non_satisfied_passangers from survey
where satisfaction != "satisfied" 
group by class
order by non_satisfied_passangers;

-- Comparing department scores among class
select class, 
count(*) as no_of_passengers,
round(avg(flight_distance),0) as average_distance, 
round(avg(age),0) as average_age,
round(avg(seat_comfort),1) as seat_score,
round(avg(Leg_room_service),1) as legroom_score,
round(avg(Inflight_service),1) as service_score
from survey
group by class
order by no_of_passengers desc ;

-- Satisfied participants 
select class, 
count(*) as no_of_passengers,
round(avg(flight_distance),0) as average_distance, 
round(avg(age),0) as average_age,
round(avg(seat_comfort),1) as seat_score,
round(avg(Leg_room_service),1) as legroom_score,
round(avg(Inflight_service),1) as service_score
from survey
where satisfaction = 'satisfied'
group by class
order by no_of_passengers desc ;

-- Unsatisfied participants
select class, 
count(*) as no_of_passengers,
round(avg(flight_distance),0) as average_distance, 
round(avg(age),0) as average_age,
round(avg(seat_comfort),1) as seat_score,
round(avg(Leg_room_service),1) as legroom_score,
round(avg(Inflight_service),1) as service_score
from survey
where satisfaction != 'satisfied'
group by class
order by no_of_passengers desc