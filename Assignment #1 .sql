
#Part 1 

#Question 1
Select count(speed),min(speed) as 'Minimum Distance' ,max(speed) as 'Maximum distance' from planes;

#Question 2
select sum(distance) as 'Total distance' from flights 
Where year ='2013' and month ='1';

#Question 3
Select planes. manufacturer, sum(flights.distance) 
From flights 
Inner join planes
on planes.tailnum =flights.tailnum
where flights.year = '2013'and flights.month ='7' and flights.day ='5'
group by planes.manufacturer;

#Question 4
# How many American Airlines flights came out of Newark(EWR) 
#in January  of 2013 where the Temperatures was 32 degrees?

Select carrier, count(carrier) as 'Number of flights' from flights 
join planes
on planes.tailnum = flights.tailnum
join weather
on flights.origin = weather.origin
where carrier = 'AA' AND flights.origin ='EWR'and weather.year = '2013' and weather.month ='1' and weather.temp ='32';

#part 2 

Select dep_delay from flights
where origin ='ewr'and origin ='LGA' AND origin ='JFK'
INTO outfile '/users/davidvayman/desktop/avgDelays.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';