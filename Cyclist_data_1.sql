Create table cyclist_data
	(ride_id varchar(20),
	rideable_type varchar(20),
	started_at Datetime,
	ended_at Datetime,
	start_station_name varchar(20),
	start_station_id varchar(20),
	end_station_name varchar(20),
	end_station_id varchar(20),
	start_lat Double,
	start_lng Double,
	end_lat Double,
	end_lng Double,
	member_casual varchar(20)
	);
	
-- Upload Data in MYSQL through CMD
LOAD DATA LOCAL INFILE 'C:\\Users\\Santosh sahu\\Downloads\\cyclist_data\\202311-divvy-tripdata.csv'
INTO TABLE cyclist_data
FIELDS TERMINATED BY','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' IGNORE 1 ROWS; -- Repeated the same process as had to upload 12 CSV Files

-- Adding Extra columns
alter table cyclist_data
add column start_date date,
add column start_time time,
add column start_weekday int,
add column start_day varchar(10),
add column start_month int,
add column start_month_name varchar(20),
add column end_date date,
add column end_time time,
add column end_weekday int,
add column end_day varchar(10),
add column end_month int,
add column end_month_name Varchar(20);

-- updating Extra columns with data
update cyclist_data
set
	start_date = Date(started_at),
    start_time = Date(started_at),
    start_weekday = dayofweek(started_at),
    start_day = dayname(started_at),
    start_month = month(started_at),
    start_month_name = monthname(started_at),
	end_date = Date(ended_at),
    end_time = Time(ended_at),
    end_weekday = dayofweek(ended_at),
    end_day = dayname(ended_at),
    end_month = month(ended_at),
    end_month_name = monthname(ended_at);
    
-- creating a new table from the existing table with limited columns required for visualization
create table cyclist_clean_data as
select ride_id, rideable_type, member_casual,
	start_date, start_time, start_weekday, start_day, start_month, start_month_name,
        end_date, end_time, end_weekday, end_day, end_month, end_month_name
from cyclist_data;

-- Exporting the data into csv file for Visualization
select 'ride_id','rideable_type','member_casual','start_date','start_time','start_weekday',
	'start_day','start_month','start_month_name','end_date','end_time','end_weekday','end_day','end_month','end_month_name'
union
SELECT * FROM capstone.cyclist_clean_data
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\tableau_cyclist4.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
    
