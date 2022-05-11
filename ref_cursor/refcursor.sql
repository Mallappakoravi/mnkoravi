create or replace function fn_cnt_product return number as
v_cnt int;

begin
select count(prod_id) into v_cnt
from product_retail;
return v_cnt;
end;

/
variable b_cnt number;
exec:b_cnt:=fn_cnt_product;
print:=b_cnt;
/
select fn_cnt_product
from dual;
/
create or replace function fn_cnt_age(p_age in int, p_gender in varchar2) return number as
v_cnt int;
begin
/

--REF-CURSOR
create or replace procedure sp_ref(p_str varchar2) as
v_ref sys_refcursor;
v_rec emp%rowtype;
begin
open v_ref for p_str;
loop
fetch v_ref into v_rec;
exit when v_ref%notfound;
dbms_output.put_line(v_rec.ename||','||v_rec.sal);
end loop;
close v_ref;
end;
/
exec sp_ref('select * from emp');
/
set serveroutput on;


2--
create or replace procedure sp_ref_select(p_id int, p_ref out sys_refcursor) as
begin
if p_id=1 then
open p_ref for select * from customer_retail;
else
open p_ref for select * from product_retail;
end if;
end;
/

variable b_ref ref