USE nycflights13 ;

#flights
TRUNCATE TABLE flights ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flights.csv'
INTO TABLE flights
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(year,month,day,dep_time,sched_dep_time,dep_delay,arr_time,sched_arr_time,arr_delay,carrier,flight,tailnum,origin,dest,air_time,distance,hour,minute,time_hour);

 SHOW WARNINGS ;#Pr avoir le dernier warnings.

#airlines

TRUNCATE TABLE airlines ;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airlines.csv'
INTO TABLE airlines
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(carrier,name);
SHOW WARNINGS ;



# airports

TRUNCATE TABLE airports;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airports.csv'
INTO TABLE airports
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(faa,name,lat,lon,alt,tz,dst,tzone);
SHOW WARNINGS ;




# planes

TRUNCATE TABLE planes;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/planes.csv'
INTO TABLE planes
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tailnum,year,type,manufacturer,model,engines,seats,speed,engine);
SHOW WARNINGS ;




#weather
TRUNCATE TABLE weather;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/weather.csv'
INTO TABLE weather
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(origin,year,month,day,hour,temp,dewp,humid,wind_dir,wind_speed,wind_gust,precip,pressure,visib,time_hour);
SHOW WARNINGS ;

INSERT INTO airports (faa, name)
	VALUES ('BQN', 'Rafael Hernandez Airport'),
		('PSE', 'Mercedita Airport'),
		('SJU', 'San Juan Airport'),
		('STT', 'Cyril E. King Airport');

ALTER TABLE flights
ADD CONSTRAINT FK_airportsflights FOREIGN KEY(dest)
REFERENCES airports(faa);

ALTER TABLE flights
ADD CONSTRAINT FK_airpflights FOREIGN KEY(origin)
REFERENCES airports(faa);

ALTER TABLE flights
ADD CONSTRAINT FK_airlflights FOREIGN KEY(carrier)
REFERENCES airlines(carrier);

 ALTER TABLE weather
 ADD CONSTRAINT FK_airpweather FOREIGN KEY(origin)
 REFERENCES airports(faa);

INSERT INTO planes (tailnum)
SELECT distinct tailnum FROM flights
WHERE tailnum NOT IN (SELECT tailnum FROM planes)

 ALTER TABLE flights
ADD CONSTRAINT FK_flightsplanes FOREIGN KEY(tailnum)
REFERENCES planes(tailnum);







