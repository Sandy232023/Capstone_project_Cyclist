SELECT * FROM capstone.cyclist_data;
    SET SESSION wait_timeout = 28800;
SET SESSION interactive_timeout = 28800;
SHOW VARIABLES LIKE 'wait_timeout';
SHOW VARIABLES LIKE 'interactive_timeout';
SET GLOBAL wait_timeout = 28800;
SET GLOBAL interactive_timeout = 28800;
SHOW VARIABLES LIKE 'wait_timeout';
SHOW VARIABLES LIKE 'interactive_timeout';

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
    
