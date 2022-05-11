/
create or replace procedure sp_top_product as
cursor cur_top_product is
select p_name, count_sales, rnk
from (select p_name, count(sales_id) as count_sales, dense_rank() over(order by count(sales_id)desc) rnk
from product_retail p, sales_retail s
where p.prod_id=s.prod_id
group by p_name) a
where a.rnk<=10;

begin
for i in cur_top_product loop
dbms_output.put_line(i.p_name||','||i.count_sales||','||i.rnk);
end loop;
end;
/

exec sp_top_product;
cursor cur_guest_records is select name, phone, city, proflag;


begin
for in in cur_guest_records loop
select count(*) into v_cnt
from customer
where name=i.name and city=i.city and phone=i.phone;
if v.cnt=1 then
dbms 


set serveroutput on;

select * from product_retail;
select * from sales_retail;
/
declare 
cursor cur_product_sale is select * from(select p_name,count(sales_id) as count_sale,dense_rank() over(order by count(sales_id)desc)rnk
from product_retail c,sales_retail s
where c.prod_id = s.prod_id
group by p_name)A
where A.rnk<=10;

begin 
for i in cur_product_sale loop
dbms_output.put_line(i.p_name||','||i.count_sale);
end loop;
end;
/
set SERVEROUTPUT ON;
/
create  or replace procedure sp_top_product as
cursor cur_product_sale is select p_name,count_sale,rnk from(select p_name,count(sales_id) as count_sale,dense_rank() over(order by count(sales_id)desc)rnk
from product_retail c,sales_retail s
where c.prod_id = s.prod_id
group by p_name)A
where A.rnk<=10;

begin 
for i in cur_product_sale loop
dbms_output.put_line(i.p_name||','||i.count_sale||','||i.rnk);
end loop;
end;
/
exec sp_top_product;
/
create sequence sequence_mnkoravi
start with  1
increment by 1
minvalue 1
maxvalue 100
nocycle;
/
select *  from customer_guest;
/
/--stored procedure for guest and customer ,call tables
create or replace procedure sp_customer_guest as
cursor cur_guest_det is select name,phone,city,pro_flg from guests;
v_cnt varchar2(20);
v_nm varchar2(20);
v_phone number(20);
v_city varchar2(20);
begin
for i in cur_guest_det loop
select count(*) into v_cnt
from customer_guest
where c_nm=i.name and c_phone=i.phone and c_city=i.city;


if v_cnt=1 then

select c_nm,c_phone,c_city into v_nm,v_phone,v_city 
from customer_guest
where  c_nm=i.name and c_phone=i.phone and c_city=i.city;


delete from guests
where  v_nm=name and v_phone=phone and v_city=city;

elsif i.pro_flg is null then

insert into call values(sequence_mnkoravi.nextval,i.name,i.phone,i.city);

update guests set pro_flg='y';

end if;
end loop;
commit;
end;
/


exec sp_customer_guest;

select * from guests;
select * from call;
commit;




                        
insert into guests (name,phone,city) values('rajesh',783738,'blr');
insert into guests (name,phone,city) values('bala',78939,'chn');
insert into guests (name,phone,city) values('arun',892393,'del');
insert into guests (name,phone,city) values('john',770260,'blr');
insert into guests (name,phone,city) values('gundu',77026089,'blr');
insert into guests (name,phone,city) values('tom',8555900,'hyd');






