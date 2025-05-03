drop database if exists used_car_listings;
create database if not exists used_car_listings;


use used_car_listings;

-- selling data

DROP TABLE IF EXISTS listing_information;
create table if not exists  listing_information
(
-- selling data
id int primary key auto_increment,
data_id varchar(15) not null unique,
url text,
image_url text,
price int,
seller_description text,
posting_date text
);

-- Zone data
create table if not exists location_data
(
data_id varchar(15) not null unique,
region varchar(20) not null,
county varchar(20) not null,
state varchar(2) not null,
constraint location_fk_listing
foreign key (data_id)
references listing_information (data_id)
);

create table if not exists basic_information
(
--
data_id varchar(15) not null unique,
make_year int not null,
make varchar(20) not null,
model varchar(20) not null,
style varchar(40) not null,
color varchar(20) not null,
size varchar(20) not null,
constraint basic_fk_listing
foreign key (data_id)
references listing_information (data_id)
);


-- car status data
create table if not exists condition_status
(
data_id varchar(15) not null unique,
vin varchar(30),
vehicle_condition varchar(30) not null,
mileage int not null,
title_status varchar(20) not null,
constraint condition_fk_listing
foreign key (data_id)
references listing_information (data_id)
);




create table if not exists specs_information
(
data_id varchar(15) not null unique,
cylinders varchar(20) not null,
fuel_type varchar(15) not null,
transmission_type varchar(20) not null,
drive varchar(10) not null,
constraint specific_fk_listing
foreign key (data_id)
references listing_information (data_id)
);