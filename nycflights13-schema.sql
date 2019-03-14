SET AUTOCOMMIT = 0;
START TRANSACTION ;

-- Suppression de la base de données si elle existe.
DROP SCHEMA IF EXISTS nycflights13 ;

CREATE SCHEMA nycflights13

CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_0900_ai_ci;
                                                   
USE nycflights13;



DROP TABLE IF EXISTS airports;
CREATE TABLE airports(
     
     faa VARCHAR(3) PRIMARY KEY,
     name VARCHAR(70),
     lat DECIMAL(20,15),
     lon DECIMAL(20,15),
     alt INT,
     tz SMALLINT,
     dst VARCHAR(2),
     tzone VARCHAR(20)
     )

ENGINE=InnoDB;
SHOW WARNINGS;


DROP TABLE IF EXISTS airlines;
 CREATE TABLE airlines(
     carrier VARCHAR(2) PRIMARY KEY,
     name VARCHAR(27)
     )
ENGINE=InnoDB;
SHOW WARNINGS;



DROP TABLE IF EXISTS planes;
CREATE TABLE planes(
    tailnum VARCHAR(6)PRIMARY KEY,
    year CHAR(4),
    type VARCHAR(24),
    manufacturer VARCHAR(30),
    model VARCHAR(30),
    engines SMALLINT UNSIGNED,
    seats SMALLINT UNSIGNED,
    speed SMALLINT UNSIGNED ,
    engine VARCHAR(20)
    )


ENGINE=InnoDB;
SHOW WARNINGS;


DROP TABLE IF EXISTS weather;
CREATE TABLE weather(
     origin CHAR(3),
     year CHAR(4),
     month CHAR(2),
     day CHAR(2) ,
     hour CHAR(2),
     temp DECIMAL (5,2) ,
     dewp  DECIMAL(20,17),
     humid DECIMAL(5,2),
     wind_dir SMALLINT,
     wind_speed  DECIMAL(21,17),
     wind_gust DECIMAL(22,18),
     precip DECIMAL(4,2),
     pressure DECIMAL(25,15),
     visib SMALLINT UNSIGNED,
     time_hour DATETIME,
     PRIMARY KEY (origin, year, month, day, hour)
)
ENGINE=InnoDB;
SHOW WARNINGS;

-- Création des tables.

DROP TABLE IF EXISTS flights ;
CREATE TABLE flights (
     id_flight INT PRIMARY KEY AUTO_INCREMENT,
     year CHAR(4) ,
     month CHAR(2),# mettre une contrainte de 1 à 12
     day CHAR(2) ,
     dep_time SMALLINT UNSIGNED ,
     sched_dep_time SMALLINT UNSIGNED,
     dep_delay SMALLINT ,
     arr_time SMALLINT ,
     sched_arr_time SMALLINT UNSIGNED,
     arr_delay SMALLINT ,
     carrier VARCHAR(2), # ON PEUT FAIRE UN REGEX DESSUS (parce que c'est un code normalisé)
     flight VARCHAR(4),
     tailnum VARCHAR(6), 
     origin CHAR(3), 
     dest CHAR(3), 
     air_time SMALLINT UNSIGNED ,
     distance SMALLINT UNSIGNED,
     hour CHAR(2) ,
     minute CHAR(2) ,
     time_hour DATETIME)

     engine=InnoDB;

SHOW WARNINGS;

SET AUTOCOMMIT = 1;
-- FIN DE FICHIER SCHEMA