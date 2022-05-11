create or replace package pkg_proc as
v_cnt int;
procedure sp_p1;
function fn_f1 return number;
end;


/
create or replace package body pkg_proc as
procedure sp_p1 as
begin
insert into emp (empno,ename) values(1114, 'ram');
dbms_output.put_line(sql%rowcount||'row modified');
end;

function fn_f1 return number as
v_cnt int;
begin
select count(*) into v_cnt
from emp;
return v_cnt;
end;
end;
/

exec pkg_proc.sp_p1;

exec pkg_proc.fn_f1;

select pkg_proc.fn_f1 from dual;