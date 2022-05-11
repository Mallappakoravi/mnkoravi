create or replace procedure sp_source as
cursor cur_temp is select * from city_temp;

begin
for i in cur_temp loop

Insert into city_temp_normalized values(i.city, 'MORNING', i.morning_temp,(i.morning_temp*9/5)+32);
Insert into city_temp_normalized values(i.city, 'AFTERNOON', i.afternoon_temp,(i.afternoon_temp*9/5)+32);
Insert into city_temp_normalized values(i.city, 'EVENING', i.evening_temp,(i.evening_temp*9/5)+32);
end loop;
end;
/
EXEC sp_source;

select * from city_temp_normalized;

Create table city_temp
(city varchar2(10),
Morning_temp number(10),
Afternoon_temp number(10),
Evening_temp number(10));

Create table city_temp_normalized
(city varchar2(20),
Time varchar2(20),
Celcius number(10),
Farienheat number(10));


insert into city_temp values('BLR',22,28,25)
