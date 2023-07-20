create schema Travego;
create table Travego.passenger(
passenger_id   INT primary key, 
passenger_name varchar(20) ,
category varchar(20),
Gender varchar(20),
Boarding_city varchar(20),
Destination_city varchar(20),
Distance int ,
Bus_Type varchar(20));


create table Travego.price(
ID int , 
Bus_Type varchar(20),
Distance int ,
Price INT);


insert into  passenger values
(1 , 'Sejal' , 'AC', 'F' , 'Banglore' , 'Chennai' , 350 , 'Sleeper') ,
(2 , 'Anmol' , 'NON_AC', 'M' , 'Mumbai' , 'Hyderabad' , 700 , 'Sitting') , 
(3 , 'Pallavi' , 'AC', 'F' , 'Panji' , 'Bengaluru' , 600 , 'Sleeper') ,
(4 , 'Khushbu' , 'AC', 'F' , 'Chennai' , 'Mumbai' , 1500 , 'Sleeper') ,
(5 , 'Udit' , 'NON_AC', 'M' , 'Trivandrum' , 'Panaji' , 1000 , 'Sleeper') ,
(6 , 'Ankur' , 'AC', 'M' , 'Nagpur' , 'Hyderabad' , 500 , 'Sitting') ,
(7 , 'Hemant' , 'NON_AC', 'M' , 'Panaji' , 'Mumbai' , 700 , 'Sleeper') ,
(8 , 'Manish' , 'NON_AC', 'M' , 'Hyderabad' , 'Bengaluru' , 500 , 'Sitting') ,
(9 , 'Piyush' , 'AC', 'M' , 'Pune' , 'Nagpur' , 700 , 'Sitting') ;

select * from passenger;

insert into  price values 
(1 , 'Sleeper' , 350  , 770) ,
(2 , 'Sleeper' , 500  , 1100) ,
(3 , 'Sleeper' , 600  , 1320) ,
(4 , 'Sleeper' , 700  , 1540) ,
(5 , 'Sleeper' , 1000  , 2200) ,
(6 , 'Sleeper' , 1200  , 2640) ,
(7 , 'Sleeper' , 1500  , 2700) ,
(8 , 'Sleeper' , 500  , 620) ,
(9 , 'Sitting' , 600  , 744) ,
(10 , 'Sitting' , 700  , 868) ,
(11 , 'Sitting' , 1000  , 1240) ,
(12 , 'Sitting' , 1200  , 1488) ,
(13 , 'Sitting' , 1500  , 1860) ;


select * from passenger;
select * from price;

-- a.	How many females and how many male passengers traveled a minimum distance of 600 KMs? 
select Gender , Distance
 from passenger
where Distance <= 600
;

-- b.	Find the minimum ticket price of a Sleeper Bus. 
select min(price) 
from price
where Bus_Type = 'Sleeper';

-- c.	Select passenger names whose names start with character 'S' .
Select passenger_name 
from passenger 
where passenger_name like 'S%';

-- d.	Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output .
select passenger.passenger_name , passenger.Boarding_city , passenger.Destination_city , passenger.Bus_Type , price.Price 
from passenger 
left join price 
on passenger.passenger_id = price.ID;

-- e.	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
select passenger.passenger_name , price.Price 
from passenger 
join price 
on passenger.passenger_id = price.ID 
where passenger.Distance >= 1000 ;

-- f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select passenger.passenger_name , price.price
from passenger
 join price
on passenger.passenger_id = price.ID 
where passenger.Bus_Type = 'Sleeper' and passenger.Bus_Type = 'Sitting' and passenger.Boarding_city = 'Banglore' And passenger.Destination_city = 'Panaji' or 
 passenger.passenger_name = 'Pallavi';
 
 -- g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order 
 select distinct(Distance)
 from passenger
 order by Distance desc;
 
 
 -- h.	Display the passenger name and percentage of distance traveled by that passenger from the 
 -- total distance traveled by all passengers without using user variables 
SELECT
  p.Passenger_name,
  (p.Distance / t.TotalDistance) * 100 AS DistancePercentage
FROM
  passenger p
JOIN
  (SELECT SUM(Distance) AS TotalDistance FROM passenger) t;

-- Alter the column category with the value "Non-AC "where theBus_Type is sleeper
select * from passenger 
where category = 'NON_AC' and Bus_Type = 'Sleeper';

-- Delete an entry from the table where the passenger name is Piyush and commit this change in the database
DELETE FROM passenger
WHERE passenger_name = 'Piyush';
commit ;

-- truncate the table passenger and comment on the number of rows in the table (explainifrequired)
TRUNCATE TABLE passenger;
SELECT COUNT(*) AS RowCount
FROM passenger;


-- Delete the table passenger from the database.
DROP TABLE IF EXISTS passenger;





