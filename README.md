# Capstone_project_Cyclist

-- import data into SQL
LOAD DATA LOCAL INFILE 'C:\\Users\\Santosh sahu\\Downloads\\cyclist_data\\202311-divvy-tripdata.csv'
INTO TABLE cyclist_data
FIELDS TERMINATED BY','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

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


