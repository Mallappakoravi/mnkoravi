create or replace procedure sp_dyn (p_tbl_nm varchar2) as
v_str varchar2(500);
v_cnt int;

begin
v_str:= ' select count(*) from '||p_tbl_nm;

execute immediate v_str into v_cnt;
dbms_output.put_line(v_cnt);
end;
/
exec sp_dyn('customer_retail');

set serveroutput on;

create or replace procedure sp_dyn (p_tbl_nm varchar2) as
child_rec_found exception;
pragma exception_init(child_rec_found, -2292);
v_str varchar2(500);
v_cnt int;

begin
v_str:= ' delete from '||p_tbl_nm;

execute immediate v_str;
dbms_output.put_line(SQL%rowcount || 'rows deleted');
exception
when child_rec_found then
dbms_output.put_line(SQLCODE||','||SQLERRM);
end;
/
exec sp_dyn('sales_retail');

