use used_car_listings;

select state, style, count(loda.data_id)
from location_data loda join basic_information bi
on loda.data_id = bi.data_id
group by state, style with rollup
order by state asc;

select state, style, round(avg(price), 0)
from listing_information li join basic_information bi
on li.data_id = bi.data_id join location_data loda
on bi.data_id = loda.data_id
group by state, style with rollup
order by state asc;

select state, drive, count(drive)
from location_data loda join specs_information spin
on loda.data_id = spin.data_id
group by state, drive
order by drive;

select state, color, count(color)
from location_data loda join basic_information bi
on loda.data_id = bi.data_id
group by state, color
order by color;